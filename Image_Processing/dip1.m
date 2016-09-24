%Problem 1
%Histogram equalization


close all;
clear all;
sum=0;
b=imread('image.jpg');
s=size(b);
red  =b(:,:,1);
blue =b(:,:,2);
green=b(:,:,3);

x=unique(b);    % Unique pixel intensities
c=histc(b(:),x);% frequency of pixel intensities
%plot(x,c)       % plots histogram of the image

%Calculation of the transform using cumulative distribution function
for i = 1:1:212
    
    sum=sum+c(i);
    cdf(i)=sum/(s(1)*s(2)*s(3));
    h(i)=round(255*cdf(i)); 
end

     
    for k=1:1:212
    
        red(red==x(k))=h(k);
        blue(blue==x(k))=h(k);
        green(green==x(k))=h(k);
         
    end


output_image=cat(3,red,blue,green);


figure
imshow(b)
title('Original image')


figure
imshow(output_image)
title('Histogram equalized image')