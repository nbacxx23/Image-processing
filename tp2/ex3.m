clear all; close all;
factor=2; %the factor of the enlarged image
theta=pi/8; %the angle of the rotation

%read the image
I=double(imread('ceiling.png'))/255;
%the size of the picture
[M,N,dim]=size(I);

%put the picture in a bigger image
Big_I=zeros(floor(M*factor),floor(N*factor),dim);
Big_I(floor(M*(factor-1)/2)+1:floor(M*(factor+1)/2),floor(N*(factor-1)/2)+1:floor(N*(factor+1)/2),:)=I(:,:,:);
%the size of the bigger image
[mm,nn,dim]=size(Big_I);
figure;
imshow(Big_I);
title('Original picture');

%first matrice
%use the 1D-fft in columns for the DFT transformation
DFT_I=fft(Big_I,[],1);

for k=1:floor(mm/2)
    for l=1:nn
        phase(k,l)=exp(-2*1i*pi*(k-1)/mm*(-tan(theta/2))*(l-floor(nn/2)));
    end
end

for k=floor(mm/2)+1:mm
    for l=1:nn
        phase(k,l)=exp(-2*1i*pi*(k-1-mm)/mm*(-tan(theta/2))*(l-floor(nn/2)));
    end
end
%multiply the phase channel by channel
Trans_DFT(:,:,1)=DFT_I(:,:,1).*phase;
Trans_DFT(:,:,2)=DFT_I(:,:,2).*phase;
Trans_DFT(:,:,3)=DFT_I(:,:,3).*phase;
%inverse the DFT
Trans_I=ifft(Trans_DFT,[],1);
figure;
imshow(real(Trans_I));
title('Original picture');

%second matrice
%use the 1D-fft in rows for the DFT transformation
DFT_I=fft(Trans_I,[],2);

for k=1:mm
    for l=1:floor(nn/2)
        phase(k,l)=exp(-2*1i*pi*(l-1)/nn*(sin(theta))*(k-floor(mm/2)));
    end
end

for k=1:mm
    for l=floor(nn/2)+1:nn
        phase(k,l)=exp(-2*1i*pi*(l-1-nn)/nn*(sin(theta))*(k-floor(mm/2)));
    end
end

%multiply the phase channel by channel
Trans_DFT(:,:,1)=DFT_I(:,:,1).*phase;
Trans_DFT(:,:,2)=DFT_I(:,:,2).*phase;
Trans_DFT(:,:,3)=DFT_I(:,:,3).*phase;

%inverse the DFT
Trans_I=ifft(Trans_DFT,[],2);
figure;
imshow(real(Trans_I));
title('Second transformation');

%third matrice
%use the 1D-fft in columns for the DFT transformation
DFT_I=fft(Trans_I,[],1);

for k=1:floor(mm/2)
    for l=1:nn
        phase(k,l)=exp(-2*1i*pi*(k-1)/mm*(-tan(theta/2))*(l-floor(nn/2)));
    end
end

for k=floor(mm/2)+1:mm
    for l=1:nn
        phase(k,l)=exp(-2*1i*pi*(k-1-mm)/mm*(-tan(theta/2))*(l-floor(nn/2)));
    end
end

%multiply the phase channel by channel
Trans_DFT(:,:,1)=DFT_I(:,:,1).*phase;
Trans_DFT(:,:,2)=DFT_I(:,:,2).*phase;
Trans_DFT(:,:,3)=DFT_I(:,:,3).*phase;
%inverse the DFT
Trans_I=ifft(Trans_DFT,[],1);

figure;
imshow(real(Trans_I));
title('Rotated picture');