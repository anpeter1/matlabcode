function [files,paths] = recdir(mydir,pattern)
% Recursively list filenames in all subdirectories. Pattern uses DIR syntax.
% Example: [N,P] = recdir(pwd, '*.txt')
files = {};
paths = {};
nestdir(mydir)
    function nestdir(P)
        S = dir(fullfile(P,pattern));
        files = [files,{S.name}];
        paths = [paths,repmat({P},1,numel(S))];
        S = dir(fullfile(P,'*'));
        C = setdiff({S([S.isdir]).name},{'..','.'});
        for k = 1:numel(C)
            nestdir(fullfile(P,C{k}))
        end
    end


testx = 3;
end