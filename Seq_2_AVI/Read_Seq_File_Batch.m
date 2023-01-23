%% Get Paths

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

input_path_parent = [flowpath filesep ...
'Old Setup and Analysis' filesep...
'TO SORT First round LF prelim' filesep ...
'Videos need to sort (first LF round)\091816'];

outPath_parent = [
    filesep 'AVI'];

input_folders = dir(input_path_parent);

%% Loop through input folder
for folder_cnt = 1:length(input_folders)
    
    %exclude artificial counts
    if(strcmp(input_folders(folder_cnt).name,'.') ...
                    || strcmp(input_folders(folder_cnt).name,'..'))
        continue;
    end
    
    input_path = fullfile(input_path_parent,input_folders(folder_cnt).name);
    outPath = fullfile(outPath_parent,input_folders(folder_cnt).name);
    mkdir(outPath);
    image_files = dir(fullfile(input_path,'*.seq'));
    
    for cnt = 1:length(image_files)
        
        input_seq_file = fullfile(input_path,image_files(cnt).name);
      
        output_video_file = fullfile(outPath,[image_files(cnt).name(1:end-4),'Test','.avi']);
        
        
        videoFWriter = VideoWriter(output_video_file);
        videoFWriter.Quality = 100;
        open(videoFWriter);
        
        % Read User input
%         prompt = 'Start Frame Number : ';
        %     start_frame = input(prompt);
        start_frame = [];
        
%         prompt = 'End Frame Number : ';
        %     end_frame = input(prompt);
        end_frame = [];
        
        skip_frame = 1;
       
        
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
 
    end
end

% Remove Seq_Reader_Toolbox path.
rmpath(genpath(image_folder_path));savepath;


disp('COMPLETE... (-_-)');