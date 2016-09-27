%MATLAB code for generating point spread function of a telescope
Dap=1.0; nxy=128;
dxy=Dap*6/nxy;
x=(-nxy/2:1:nxy/2-1)*dxy;
[xx,yy]=meshgrid(x,x);
rr=sqrt(xx.^2+yy.^2);
ap = (rr<Dap/2);%aperture
figure;
subplot(2,2,1);
imagesc(ap);
axis image;
title('Aperture');
B= fftshift(fft2(ap));
%B=fft2(ap);
psf=B.*conj(B);%Point spread function
%figure;
subplot(2,2,2);
imagesc(psf);
8axis image
title('Point spread function');
otf=fftshift(fft2(psf));%Optical transfer function
%figure;
subplot(2,2,3);
imagesc(otf);
axis image;
title('Optical transfer function');
mtf=abs(otf);%Modular transfer function
%figure;
subplot(2,2,4);
imagesc(mtf);
axis image;
title('Modular transfer function');
obj=imread('C:\Users\Ravi\Desktop\object.png','png');%object
tel=imfilter(obj,psf,'conv');
figure;
imagesc(tel);
axis image;