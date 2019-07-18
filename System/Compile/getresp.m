function [resp, rt] = getresp(w, imDir, dur)
% Display an image and collect a response

map = imread(imDir); % Read in image
im = image(w, map); % Print to screen
w.TickLength = [0 0]; % Hide ticks
drawnow

tic % Start a timer
if dur == Inf % If duration is infinity...
    waitfor(w.Parent, 'UserData'); % Wait for a response
    resp = w.Parent.UserData; % Store response
    rt = toc; % Store timer value as reaction time
else
    cont = true;
    while toc < dur && cont % While timer is less than specified duration and no response is received
        resp = w.Parent.UserData; % Look for a response
        drawnow
        if ~isempty(resp) % If no response...
            cont = false; % End while loop
            drawnow
        end
    end
    rt = toc; % Store timer value as reaction time
end

if strcmp('escape', resp) % If they pressed escape...
    close all % Exit
    error('Experiment terminated by user'); % Print an error
end

delete(im); % Delete image

