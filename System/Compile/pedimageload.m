function stim = pedimageload(ax, stimdir, x, y, w, h)
%% Create storage structure
stim = struct(...
    'Type', 'img', ... % File type
    'Pos', [x y w h], ... % Position (x, y, width, height)
    'Dir', stimdir, ... % File location
    'Obj', [] ... % Object handle
    );

%% Read image
[img, ~, alpha] = imread(stimdir); % Read image
if isempty(alpha) % If no transparency data...
    alpha = ones(size(img, [1,2])); % Set all pixels to fully opaque
end

%% Defaults for non-values
if isempty(w) % If width is blank...
    stim.Pos(3) = size(img, 2); % Default to full size
end
if isempty(h) % If height is blank...
    stim.Pos(4) = size(img, 1); % Default to full size
end
if isempty(x) % If x is blank...
    stim.Pos(1) = (ax.XLim(2) - stim.Pos(3)) / 2; % Default to center
end
if isempty(y) % If y is blank...
    stim.Pos(2) = (ax.YLim(2) - stim.Pos(4)) / 2; % Default to center
end