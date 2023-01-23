%% |degreetick| documentation
% This function places degree symbols on tick labels. Labels 
% dynamically update after zooming. 
% 
%% Syntax 
% 
%  degreetick 'x'
%  degreetick 'y'
%  degreetick 'z'
% 
%% Description 
% 
% |degreetick 'x'| places degree symbols on x tick labels. 
%
% |degreetick 'y'| places degree symbols on y tick labels. 
%
% |degreetick 'z'| places degree symbols on z tick labels. 
% 
%% Example 
% Place degree symbols on y labels: 

plot(1:10,(1:10).^2)
degreetick 'y'
box off
ylabel 'temperature'

%% Author Info
% This function was written by <http://www.chadagreene.com Chad A. Greene> of the University
% of Texas at Austin's Institute for Geophysics, May 2015. 