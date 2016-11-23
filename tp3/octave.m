%the function I_zoom = octave(I,zoom_factor=2,nstep=1) give the nstep zoom
%results.

function I_zoom = octave(I,zoom_factor,nstep)
for i=[1:nstep]
    I_zoom = I(1:zoom_factor:end,1:zoom_factor:end,:);
    I=zeroPadding(I_zoom,zoom_factor);
end
   
figure;
imshow(I);
title('Under Sampling,step=1');

end
