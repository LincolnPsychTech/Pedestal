function stim = pedtextload(ax, stimdir, varargin)
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
defSize = [... % Default position values
    mean(ax.XLim)*0.2, ...
    mean(ax.YLim) ...
    ];

for n = 1:length(defSize) % For each position index
    try
        stim.Pos(n) = varargin{n}; % Set position to corresponding specified value
        if ~isnumeric(stim.Pos(n)) % If supplied value is not numeric...
            error('Position values must be numeric'); % Throw error for prosterity
        end
    catch % If this fails (i.e. if no value is supplied)
        stim.Pos(n) = defSize(n); % Use default value
    end
end