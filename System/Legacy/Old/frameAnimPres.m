function frameAnimPres(imageDir, duration, display, frameRate)

frameRate = str2num(frameRate{:});
noFrames = round((duration/1000)*frameRate);

i = 1;
while i <= noFrames
    for frame = 1:length(imageDir{:})
        frameImage = imread(imageDir{:}{frame});
        texture = Screen('MakeTexture', display, frameImage);
        Screen('DrawTexture', display,texture);
        Screen('Flip', display)
        pause(1/frameRate)
        i = i+1;
    end
end