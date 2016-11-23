clear all;
close all;
% generate gaussian images with different sigma(1/100,1/10,1), same mu(0.5)
img_1 = normrnd(0.5,0.01,[256 256]);
img_2 = normrnd(0.5,0.1,[256 256]);
img_3 = normrnd(0.5,1,[256 256]);
figure;imshow(img_1);title('gaussienne with sigma_1/100');
figure;imshow(img_2);title('gaussienne with sigma_1/10');
figure;imshow(img_3);title('gaussienne with sigma_1');