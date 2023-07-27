% STEP 2
[y, Fs] = audioread('sample.wav');
audiowrite('handel.wav',y , Fs);
player = audioplayer(y,Fs);
play(player);
% --------------
% STEP 3
% 4 raqam ashar
% total duration of file 
disp(size(y,1)/Fs)
% ---------------
% STEP 4
hist(y);
figure;
histogram(y);
xlim([-0.1 0.1]);
n = hist(y);
p = n / sum(n);
H_X = -sum(p.*log2(p));
display(H_X);
% max compression
display(length(y) * H_X);
% --------------
% STEP 5
unique_number = unique(y(:,1));
counts = histc(y(:,1), unique_number);
probabilities = 1/length(y) .* counts;
dict_coded = huffmandict(unique_number, probabilities);
encoded = huffmanenco(y(:,1),dict_coded);
audiowrite('encoded.wav', encoded, Fs);
% --------------
