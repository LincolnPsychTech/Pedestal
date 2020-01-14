function frames = pedanimload(ax, framedir, varargin)
%% Setup stim directory
stimFolder = dir(framedir); % Get all files in the specified folder
stimFolder([1:2]) = []; % Delete . and .. indices
stimFolder = table2struct(sortrows(struct2table(stimFolder), 'name')); % Sort frames alphabetically

%% Cycle through stimuli
frames = []; % Blank struct to store frames

for f = 1:length(stimFolder) % For each frame...
    %% Create storage structure
    stim = struct(...
        'Type', 'img', ... % File type
        'Pos', [], ... % Position (x, y, width, height)
        'Dir', [stimFolder(f).folder, '\', stimFolder(f).name], ... % File location
        'Img', [], ... % Image data placeholder
        'Alpha', [], ... % Transparency data placeholder
        'FrameN', f, ... % Frame number
        'Obj', [] ... % Object handle
        );
    
    %% Read image
    [stim.Img, ~, stim.Alpha] = imread(stim.Dir); % Read in image and transparency data
    if isempty(stim.Alpha) % If no transparency data...
        stim.Alpha = ones(size(stim.Img, [1,2])); % Set all pixels to fully opaque
    end
    
    %% Defaults for non-values
    defSize = [mean(ax.XLim)-size(stim.Img, 2)/2 mean(ax.YLim)-size(stim.Img, 1)/2 size(stim.Img, [2,1])]; % Default position values
    for n = 1:4 % For each position index
        try
            stim.Pos(n) = varargin{n}; % Set position to corresponding specified value
            if ~isnumeric(stim.Pos(n)) % If supplied value is not numeric...
                error('Position values must be numeric'); % Throw error for prosterity
            end
        catch % If this fails (i.e. if no value is supplied)
            stim.Pos(n) = defSize(n); % Use default value
        end
    end
    
    %% Add to overall structure
    frames = [frames; stim];
end