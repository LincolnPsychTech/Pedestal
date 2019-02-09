function audioPres(soundDir, duration)

audio = audioread(soundDir);
sound(audio)
pause(duration/1000)
clear sound