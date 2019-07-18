function dispimg(w, imDir, dur)
% Display an image

map = imread(imDir); % Load image
im = image(w, map); % Draw to screen
w.TickLength = [0 0]; % Hide ticks
drawnow

pause(dur); % Pause for set time
delete(im); % Delete image
end