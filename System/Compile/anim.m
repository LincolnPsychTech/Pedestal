function anim(w, frDir, frRate)
% Play a frame animation

frames = dir(frDir); % Get all frame file details
frames(1:2) = []; % Remove blank file spaces
for fr = 1:length(frames) % For each frame...
    frames(fr).img = imread([frDir '\' frames(fr).name]); % Read image into frames structure
end

for currentFrame = 1:length(frames) % For each frame...
    tic % Start a timer
    while toc < 1/frRate % While this timer is less than 1/frames per second
        im = image(w, frames(currentFrame).img); % Draw image to screen
        w.TickLength = [0 0]; % Hide ticks
        drawnow
    end
    if toc > 2/frRate % If frame took more than twice intended time to load...
        warning(['High frame latency at frame ' num2str(currentFrame)]); % Print a warning
    end
    delete(im); % Delete the image
end
end