%Problem 5
%Application of discrete fourier transform and 
%subsequent inversion after filtering

clear all;
close all;
b=imread('image.jpg');
input_image=double(rgb2gray(b));

s=size(input_image);
row=s(1);
column=s(2);
%image=padarray(input_image,[2*row-1,2*column-1],'post');
image=double(input_image);

% Fourier transform of the image
% X = zeros(row,column);
% for u=0:row-1
%     for v=0:column-1
%         for k = 0:row-1
%             for n = 0:column-1
%                 X(k+1,n+1) = X(k+1,n+1) + input_image(k+1,n+1)*exp(-1i*2*pi*(u*k/row + v*n/column));
%     end
%         end
%     end
% end
X=fft2(image,2*row-1,2*column-1);
% Xc=fftshift(X);
% S=abs(X);
% S2=log(1+abs(Xc));
% figure;
% title('Fourier transformed image');
% imshow(S2,[])

[r,c]=size(X);
d0=10;

d=zeros(r,c);
h=zeros(r,c);

%gaussian low pass filter
for i=1:r
    for j=1:c
      d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
      h(i,j)= exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
      res(i,j)=(h(i,j))*X(i,j);
       
     end
 end
p=ifft2(res);
p=p(1:row,1:column);
figure;
imshow(b);
title('Original image')

figure;
imshow(p)
title('Filtered image')
