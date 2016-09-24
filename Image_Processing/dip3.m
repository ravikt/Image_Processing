%Problem 3
%Smootheing and Median filter

clear all;
close all;
b=imread('image.jpg');
input_image=rgb2gray(b);
x=[1,2,1;2,4,2;1,2,1]/16; %smoothing filter
image=padarray(input_image,[1,1]);
s=size(image);
row=s(1);
column=s(2);

% 3x3 Smoothing filter 

for i=2:1:row-1
   
    for j=2:1:column-1
        
    image1(i,j)=  x(1,1)*image(i-1,j-1) + x(1,2)*image(i-1,j) + x(1,3)*image(i-1,j+1)...
            + x(2,1)*image(i,j-1) + x(2,2)*image(i,j) + x(2,3)*image(i,j+1)...
            + x(3,1)*image(i+1,j-1) + x(3,2)*image(i+1,j) + x(3,3)*image(i+1,j+1);
    
    end

end
figure;
imshow(image1);
title('Image with Smoothing filter')

% 3x3 Median filter

im=padarray(input_image,[1,1],'replicate');

for i=2:1:row-1
   
    for j=2:1:column-1
        
            med_filt = [im(i-1,j-1), im(i-1,j), im(i-1,j+1),...
            im(i,j-1), im(i,j), im(i,j+1),...
            im(i+1,j-1), im(i+1,j), im(i+1,j+1)];
    
    image2(i,j)=median(med_filt);
        
    end

end
figure;
imshow(image2);
title('Image with Median filter')