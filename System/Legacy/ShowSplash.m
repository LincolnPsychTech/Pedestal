im = imread('Splash.png'); %load splash image
imsize = size(im); %get original image size
imsize = imsize*(1000/max(imsize)); %transform so it fits within a 1000*1000 box

splash = figure('MenuBar', 'none','NumberTitle','off','Position',[0,0,imsize(2),imsize(1)],'Visible','off'); %create figure
splaxis = axes('Parent',splash,'Units', 'normalized', 'Position', [0 0 1 1]); %create axis

image(im,'Parent',splaxis); %draw image
set(splaxis,'TickDir','out') %remove ticks

movegui(splash,'center'); %move to centre

set(splash,'Visible','on')

pause(2) %load content (placeholder)

close all