% STEP 2
[y, Fs] = audioread('handel.wav');
player = audioplayer(y,Fs);
play(player);
% ----------