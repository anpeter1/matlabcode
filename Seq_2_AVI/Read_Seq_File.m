function Read_Seq_File

flowpath = ['G:\My Drive\Ashley_flow\Master Lionfish'];

[ image_folder_path ] = ...
    'C:\Users\anpet\Documents\Repositories\toolbox-master';
if 0
[ image_folder_path ] = uigetdir('Select Seq_Reader_Toolbox path...');
if(image_folder_path==0)
    return;
end
end

% Add Seq_Reader_Toolbox path.
addpath(genpath(image_folder_path)); savepath;
% Read Seq path.

% input_seq_file = 'G:\My Drive\Ashley_flow\Master Lionfish\Old Setup and Analysis\TO SORT First round LF prelim\Analyzed data file backups\Popeye\C cyaena done\Sun Sep 18 done\pvol_pop_ccya_d_na_91816_14-34-45.146.seq'

if 1
[ seq_file_name,seq_file_path ] = uigetfile({'*.seq'},'Pick a video seq. file...');
if(seq_file_path == 0)
    return;
end

input_seq_file = [seq_file_path,seq_file_name];
end
% % Read output image path.
% [video_file_name,video_file_path] = uigetdir('Select Destination Image Folder');
% output_image_file = [video_file_path,video_file_name];

% Read output video path.
video_file_path = [seq_file_path];
video_file_name = ['testcropErr','.avi']

if 0
[video_file_name,video_file_path] = uiputfile([seq_file_name(1:end-4),'cropErr','.avi'],'Save Video Name');

end

output_video_file = [video_file_path,video_file_name];

videoFWriter = VideoWriter(output_video_file);
videoFWriter.Quality = 100;
open(videoFWriter);
% Read User input
% prompt = 'Start Frame Number : ';
% start_frame = input(prompt);
start_frame = 1;
% prompt = 'End Frame Number : ';
% end_frame = input(prompt);
end_frame = 100;

skip_frame = 1;

% %% Save Images from seq video.
% Is = seqIo( input_seq_file, 'toImgs', output_image_file, skip_frame, start_frame, end_frame, 'png' );


%% Read Seq frame and write in video file
% if(isempty(skip)), skip=1; end
if(isempty(start_frame)), start_frame=0; end
if(isempty(end_frame)), end_frame=inf; end

sr = seqIo( input_seq_file, 'reader' );
% sr=reader(input_seq_file);
info=sr.getinfo(); 


end_frame=min(end_frame,info.numFrames-1);
frames=start_frame:skip_frame:end_frame; 

for frame=frames
    disp(frame);
    sr.seek(frame);
    I=sr.getframe(); 
    writeVideo(videoFWriter, I);
    clear I;
end;
sr.close();
close(videoFWriter);

% Remove Seq_Reader_Toolbox path.
rmpath(genpath(image_folder_path));savepath;

disp('COMPLETE... (-_-)');
end