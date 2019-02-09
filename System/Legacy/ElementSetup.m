function v = ElementSetup(app, wDim)
sDim = [100, 100];

v = Element;
v.Parent = app;

% Calculate scale between screen simulation and actual screen
screenDim = get( groot, 'Screensize' );
ratio = screenDim(3:4)./wDim; 
scale = min(ratio); %how much do they need to shrink the screen by in the sim
v.scale = scale; %pass to app

% Basic Elements
v.ogStimWidth = sDim(1)*scale;
v.ogStimHeight = sDim(2)*scale;

% Resize simulated screen
v.Window.Position(3:4) = wDim.*scale; %re-scale window
v.Window.XLim = [0, wDim(1)];
v.Window.YLim = [0, wDim(2)];
v.Slider_X.Position(3) = wDim(1)*scale; %width of x slider
v.Slider_X.Limits(2) = wDim(1); %limits of x slider
v.Slider_X.Position(2) = wDim(2)*scale; %y position of x slider
v.Slider_Y.Position(4) = wDim(2)*scale; %height of y slider
v.Slider_Y.Limits(2) = wDim(2); %limits of x slider

% Move sliders
v.Slider_X.Value = wDim(1)/2;
v.Slider_Y.Value = wDim(2)/2;
v.YPos.Position(2) = wDim(2)*scale/2 - 50;
v.XPos.Position(1) = wDim(1)*scale/2 - 45;
v.XPos.Position(2) = wDim(2)*scale - 100;

% Move scale box
v.Spinner_Scale.Position(1:2) = [wDim(1)*scale/2 - 35, wDim(2)*scale/2 - 25];
v.ScaleSpinnerLabel.Position(1:2) = [v.Spinner_Scale.Position(1), v.Spinner_Scale.Position(2) + 25];

% Draw stimulus
v.Stim = rectangle(v.Window, ...
    'Position',[(wDim./2 - sDim./2), sDim], ...
    'FaceColor',[0,33,71]./255, ...
    'EdgeColor',[0,33,71]./255);
end