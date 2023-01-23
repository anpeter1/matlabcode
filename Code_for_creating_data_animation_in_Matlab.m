
% Rate to play exported video
playrate = 30;

% Undock window style
set(0,'DefaultFigureWindowStyle','normal');
f = figure;
    
% File name of video
FileName = 'piv_video';
        
% Initialize video 
outputVideo = VideoWriter(fullfile(save_path,[FileName '.mp4']),'MPEG-4');
outputVideo.FrameRate = playrate;
open(outputVideo)

% Loop thru frames
for i = 1:size(data,1)
    
	% Plot data: put your own data that changes here
    plot(data(i,1),data(i,2))
    
	% Render it
    drawnow 
   
    % Capture image
    img = getframe(gca);
		
	% Write to video file
    writeVideo(outputVideo,img)
end

close(outputVideo)  
