function stim = pedimageload(ax, stimdir, varargin)
%% Create storage structure
stim = struct(...
    'Type', 'img', ... % File type
    'Pos', [], ... % Position (x, y, width, height)
    'Dir', stimdir, ... % File location
    'Obj', [] ... % Object handle
    );

%% Read image
[stim.Img, ~, stim.Alpha] = imread(stimdir); % Read image
if isempty(stim.Alpha) % If no transparency data...
    stim.Alpha = ones(size(img, [1,2])); % Set all pixels to fully opaque
end

%% Defaults for non-values
defSize = [... % Default position values
    (ax.XLim(2) - size(stim.Img, 2)) / 2, ...
    (ax.YLim(2) - size(stim.Img, 1)) / 2, ...
    size(stim.Img, [2, 1]) ...
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