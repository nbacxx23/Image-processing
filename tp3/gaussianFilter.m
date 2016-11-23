% une fonction permettant d'efectuer le filtrage Gaussien par TFD
function  image_G = gaussianFiltre(I,sigma)
[M,N,dim]=size(I);

%show the original picture first
figure;
imshow(I);
title('Original picture');

DFT_I=fft2(I);

Nk = ifftshift((-fix(M/2):ceil(M/2)-1))/M;
Nl = ifftshift((-fix(N/2):ceil(N/2)-1))/N;
%Nk=[1:M];
%Nl=[1:N];
[Nk,Nl] = meshgrid(Nk,Nl);

phase=exp(-2*pi^2*sigma^2*(Nk.^2+Nl.^2));

for i=[1:dim]
    Trans_DFT(:,:,i)=DFT_I(:,:,i).*phase;
end

image_G=real(ifft2(Trans_DFT));


figure;
imshow(image_G);
title('Gaussian Filter');

end

