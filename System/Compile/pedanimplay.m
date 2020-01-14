function frames = pedanimplay(ax, frames, fps)
%% Draw image
obj = image(ax, 'CData', []); % Initialise image holder

for f = frames' % For each frame...
    tic % Start a timer
    f.Obj = obj; % Store image holder handle
    set(f.Obj, ... % Set properties of image holder...
        'XData', [f.Pos(1), f.Pos(1) + f.Pos(3)], ... % Position horizontal
        'YData', [f.Pos(2), f.Pos(2) + f.Pos(4)], ... % Position vertical
        'CData', flipud(f.Img), ... % Apply image data for this frame
        'AlphaData', flipud(f.Alpha) ... % Apply transparency data for this frame
        );
    while toc < 1/fps % Until 1 frame refresh has passed
        drawnow % Keep refreshing the screen
    end
end

delete(obj) % Delete image holder