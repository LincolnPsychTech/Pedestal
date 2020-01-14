function stim = pedtextload(ax, stimdir, x, y)
%% Create storage structure
stim = struct(...
    'Type', 'txt', ... % File type
    'Text', [], ...
    'Pos', [], ... % Position (x, y, width, height)
    'Dir', stimdir, ... % File location
    'Obj', [] ... % Object handle
    );

%% Read text
stim.Text = fileread(stimdir); % Read text from file

%% Defaults for non-values
if isempty(x) % If x is blank...
    stim.Pos(1) = mean(ax.XLim)*0.2; % Default to center
else
    stim.Pos(1) = x;
end
if isempty(y) % If y is blank...
    stim.Pos(2) = mean(ax.YLim); % Default to center
else
    stim.Pos(2) = y;
end