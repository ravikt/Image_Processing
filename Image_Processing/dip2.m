%Problem 2
%Power law transformation

close all;
clear all;

image=imread('image.jpg');
input_image=im2double(image);
red  = input_image(:,:,1); 
blue = input_image(:,:,2);
green= input_image(:,:,3); 

%Transformation
c=1;
gamma1=0.2;
gamma2=5;
red1  =power(red,gamma1);
blue1 =power(blue,gamma1);
green1=power(green,gamma1);
output_image1=cat(3, red1, blue1, green1);

red2  =power(red,gamma2);
blue2 =power(blue,gamma2);
green2=power(green,gamma2);
output_image2=cat(3, red2, blue2, green2);

figure;
imshow(image);
title('Original Image')

figure;
imshow(output_image1);
title('Transformed Image with gamma = 0.8')

figure;
imshow(output_image2);
title('Transformed Image with gamma = 5')