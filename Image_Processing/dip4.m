%Problem 4
%Image sharpening using Laplacian and Gradient operators

clear all;
close all;
b=imread('image.jpg');
input_image=rgb2gray(b);

%negative mask
x=[1,1,1;1,-8,1;1,1,1]; %laplacian operator
image=padarray(input_image,[1,1]);
image=double(image);
I=zeros(size(image));


s=size(image);
row=s(1);
column=s(2);
image1=zeros(row,column);

%Correlation operation
for i=2:row-1
   for j=2:column-1
       %image1(i,j)=sum(sum(lap_filt.*image(i:i+2,j:j+2)));
        image1(i,j)=  x(1,1)*image(i-1,j-1) + x(1,2)*image(i-1,j) + x(1,3)*image(i-1,j+1)...
            + x(2,1)*image(i,j-1) + x(2,2)*image(i,j) + x(2,3)*image(i,j+1)...
            + x(3,1)*image(i+1,j-1) + x(3,2)*image(i+1,j) + x(3,3)*image(i+1,j+1);
   end
end

output_image=uint8(image1);

figure;
imshow(output_image);
title('Filtered image');

output_image2=uint8(image)-output_image;
figure;
imshow(output_image2);
title('Sharpened image');

%horizontal mask
y=[-1,-2,-1;0,0,0;1,2,1];

%Correlation operation
for k=2:row-1
   for l=2:column-1
       
       image2(k,l)=y(1,1)*image(k-1,l-1) + y(1,2)*image(k-1,l) + y(1,3)*image(k-1,l+1)...
            + y(2,1)*image(k,l-1) + y(2,2)*image(k,l) + y(2,3)*image(k,l+1)...
            + y(3,1)*image(k+1,l-1) + y(3,2)*image(k+1,l) + y(3,3)*image(k+1,l+1);
   end
end


output_image3=uint8(image2);
figure;
imshow(output_image3);
title('Using gradient operator')