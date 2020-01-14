function stim = pedtext(ax, stimdir, x, y)
%% Create storage structure
stim = struct(...
    'Type', [], ... % File type
    'Pos', [x y], ... % Position (x, y, width, height)
    'Dir', stimdir, ... % File location
    'Obj', [] ... % Object handle
    );

%% Read text
txt = fileread(stimdir);

%% Defaults for non-values
if isempty(x) % If x is blank...
    stim.Pos(1) = 0.1; % Default to center
end
if isempty(y) % If y is blank...
    stim.Pos(2) = 0.1; % Default to center
end

%% Draw text
stim.Obj = text(ax, ... % Create a textbox...
    'EdgeColor', 'none', ... % ...with no edge...
    'FontSize', 20, ... % ...font size 20...
    'Position', [stim.Pos(1) stim.Pos(2)], ... % ...at a user-specified position...
    'String', txt... % ...containing the string specified by the user
    ); 