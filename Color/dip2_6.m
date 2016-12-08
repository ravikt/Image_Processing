% Edge detection in a RGB image
% Soble mask is used for the operation

clear all;
close all;
input_image=imread('balloon.jpg');
r=input_image(:,:,1);
b=input_image(:,:,2);
g=input_image(:,:,3);

grad_filt=[-1,-2,-1;0,0,0;1,2,1]; %Sobel operator horizontal mask
red  =padarray(r,[1,1]);
blue =padarray(b,[1,1]);
green=padarray(g,[1,1]);

image_r=double(red);
image_b=double(blue);
image_g=double(green);

s=size(image_r);
row=s(1);
column=s(2);

for k=1:row-2
   for l=1:column-2
       red(k,l)  =sum(sum(grad_filt.*image_r(k:k+2,l:l+2)));
       blue(k,l) =sum(sum(grad_filt.*image_b(k:k+2,l:l+2)));
       green(k,l)=sum(sum(grad_filt.*image_g(k:k+2,l:l+2)));
   end
end

output_image2=cat(3, red, green, blue);
imshow(output_image2)
