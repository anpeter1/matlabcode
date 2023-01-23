function seq2avi

%% Add Paths
VoutPath = ['C:\Users\anpet\Documents\Repositories'];

% Read Seq path.
seqpath = ['C:\Users\anpet\Documents\Repositories\17-36-01.151.seq']


[SeqL, header] = ReadJpegSEQ(seqpath,[0 0]);

% SeqL = SeqL{:,1};
% Tstamp = SeqL{:,2};


% Set up output video file
vOut = VideoWriter([VoutPath filesep 'convTest'],'Motion JPEG AVI');



open(vOut)



for i = 1:length(SeqL)
    
    im = SeqL{i,1};
  
    
    
    writeVideo(vOut,im);
   
    i = i +1;
    hold off
    
end


close(vOut)



end














