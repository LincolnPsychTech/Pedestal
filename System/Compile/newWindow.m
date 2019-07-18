function [fig, w] = newWindow()
% Create a new window

fig = figure; % Create figure
w = axes(fig); % Draw axes
sDim = get(groot, 'ScreenSize'); % Get monitor size

set(fig, ...
    'InnerPosition', sDim, ... % Fullscreen figure
    'KeyPressFcn', @keyPress, ... % Create keypress listener
    'WindowButtonDownFcn', @clickFcn ... % Create click listener
    );

set(w, ...
    'Position', [0 0 1 1], ... % Fullscreen axis
    'XLim', [sDim([1 3])], ... % Align x axis to screen width
    'YLim', [sDim([2 4])], ... % Align y axis to screen height
    'TickLength', [0 0] ... % Hide ticks
    );

function keyPress(app, event)
    app.UserData = event.Key; % Set the UserData of the figure to equal the key which was just pressed
end
function clickFcn(app, varargin)
    app.UserData = get(w, 'CurrentPoint'); % Set the UserData of the figure to equal the coords of mouse
end
end