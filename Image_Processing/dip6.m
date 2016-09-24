%Problem 6
%High pass filtering in frequency domain

clear all;
close all;
b=imread('image.jpg');
input_image=double(rgb2gray(b));

s=size(input_image);
row=s(1);
column=s(2);
%image=padarray(input_image,[2*row-1,2*column-1],'post');
image=double(input_image);

X=fft2(image,2*row-1,2*column-1);


[r,c]=size(X);
d0=200;

d=zeros(r,c);
h=zeros(r,c);

% High pass gaussian filter

for i=1:r
    for j=1:c
     d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
     h(i,j)= 1 - exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
     res(i,j)=(h(i,j))*X(i,j);
    end
end

% for i=1:r
%     for j=1:c
%       h(i,j)= 1 - exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
%     end
% end
% 
% 
% for i=1:r
%     for j=1:c
%     res(i,j)=(h(i,j))*X(i,j);
% 
%     end
% end

p=ifft2(res);
p=p(1:row,1:column);

figure;
imshow(b);
title('Original image')

figure;
imshow(p)
title('Filtered image')