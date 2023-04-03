function startup

set(0,'defaultfigurecolor',[1 1 1])
set(groot, 'defaultAxesTickDir', 'out');
set(groot,  'defaultAxesTickDirMode', 'manual');
set(0,'DefaultFigureWindowStyle','docked')
% box off



s = settings;
s.matlab.fonts.editor.code.Name.TemporaryValue = 'Monospaced';
s.matlab.fonts.editor.code.Size.TemporaryValue = 12;

end