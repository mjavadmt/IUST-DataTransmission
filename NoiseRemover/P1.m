clc;
close all;

% STEP 2
filePath = "D:\Full HD Desktop Wallpapers\amusement.jpg";
img = imread(filePath);
figure;
imshow(img)
% ---------------
% STEP 3
grayImg = rgb2gray(img);
% --------------
% STEP 4
figure;
imwrite(grayImg,"GrayImage.jpg");
imshow(grayImg);
% --------------
% STEP 5
totalEnergy = sum(grayImg(:));
display(totalEnergy);
% alternative
F = fft2(grayImg);
magImage = abs(F).^2;
energy = sum(magImage(:));
display(energy);
% -----------------
% STEP 6
figure;
noisedPicture = imnoise(grayImg,'gaussian');
imshow(noisedPicture);
x = im2double(grayImg);
y = im2double(abs(noisedPicture - grayImg));
signalNoiseRatio = snr(x,y);
display(signalNoiseRatio);
% ---------------------
% STEP 7
ft = fftshift(log(abs(fft2(grayImg))));
figure;
imshow(ft, []);
% --------------------
% STEP 8
figure;
Kmedian = medfilt2(noisedPicture);
imshow(Kmedian);
[peaksnr, outputSNR] = psnr(noisedPicture , grayImg);
  
fprintf('\n The Peak-SNR value is %0.4f', peaksnr );
fprintf('\n The Peak-SNR value is %0.4f', outputSNR );


