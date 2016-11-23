function I=Laplacien(I,eps,iter)
for i = 1:iter 
    grad_x=I(1 :end-1, :,:)-I(2 :end, :,:);
    grad_y=I( :,1 :end-1,:)-I( :,2 :end,:);
    dx2=grad_x(1 :end-1, :,:)-grad_x(2 :end, :,:);
    dy2=grad_y( :,1 :end-1,:)-grad_y( :,2 :end,:);
    dx2=dx2(:,1:end-2,:);
    dy2=dy2(1:end-2,:,:);
    J=dx2+dy2;
    I=I(1 :end-2, 1:end-2,:);
    I=I-eps*J;
end
figure;
imshow(I);
title(['Laplacien,eps=' num2str(eps) ',iteration=' num2str(iter)]);
%imwrite(I, ['Laplacien,eps=' num2str(eps) ',iteration=' num2str(iter) '.png'], 'png');
end
