% The function zeroPadding(I,factor) can return a picture zoomed in with
% the factor

function I_zoom=zeroPadding(I,factor)
[M,N,dim]=size(I);
DFR_zoom=double(zeros(factor*M,factor*N,dim));
%translation DFT
DFT_I=fft2(I);
%
DFR_zoom(1:floor(M/2),1:floor(N/2),:)=DFT_I(1:floor(M/2),1:floor(N/2),:);
DFR_zoom(end:-1:end-floor(M/2)+1,1:floor(N/2),:)=DFT_I(end:-1:end-floor(M/2)+1,1:floor(N/2),:);
DFR_zoom(1:floor(M/2),end:-1:end-floor(N/2)+1,:)=DFT_I(1:floor(M/2),end:-1:end-floor(N/2)+1,:);
DFR_zoom(end:-1:end-floor(M/2)+1,end:-1:end-floor(N/2)+1,:)=DFT_I(end:-1:end-floor(M/2)+1,end:-1:end-floor(N/2)+1,:);
%multipy the amplitude
I_zoom=real(ifft2(DFR_zoom))*factor^2;

%show the picture to verify the results
%figure;
%imshow(I_zoom);
%title('Zooming');
end
