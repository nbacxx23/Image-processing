%% Generate observed image
clear all;
close all;
I=double(imread('flowers.bmp'))/255;
I=mean(I,3);
sizeI=size(I);
u=I+0.1*randn(sizeI);
figure; imshow(I);title('origin image');
figure; imshow(u);title('Noisy observed image');

% Denoise
w=3;
sigma_s=1;
sigma_i=2;
size_I_noisy=size(u);
[N,M] = size(u);

%% Bilateral filtering.
bound = 2*w+1;
S = zeros(bound,bound);
u_square = zeros(bound,bound);
% calculate S which is constant during the loop over p
for x_1 = 1:bound
    for x_2 = 1:bound
        S(x_1,x_2) = exp(-((x_1-w-1)^2+(x_2-w-1)^2)/(2*sigma_s^2));
    end
end

I_denoised = u;
%loop over p_1 and p_2
for p_1 = w+1:N-w
    for p_2 = w+1:M-w
        u_square = u(p_1-w:p_1+w,p_2-w:p_2+w);
        C_matrix = exp(-((u_square-u_square(w+1,w+1)).^2)/(2*sigma_i^2)).*S;
        C = sum(C_matrix(:));
        I_denoised(p_1-w,p_2-w) = sum(u_square(:).*C_matrix(:))/C;
    end
end
             
figure;imshow(I_denoised);title('Denoised image');

