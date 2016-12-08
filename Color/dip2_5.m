%Median filter and Laplacian on RGB image

clear all;
close all;
input_image=imread('balloon.jpg');

r=input_image(:,:,1);
b=input_image(:,:,2);
g=input_image(:,:,3);

red  =padarray(r,[1,1]);
blue =padarray(b,[1,1]);
green=padarray(g,[1,1]);

s=size(red);
row=s(1);
column=s(2);

% 3x3 Median filter

% im_red  =padarray(red,[1,1],'replicate');
% im_blue =padarray(blue,[1,1],'replicate');
% im_green=padarray(green,[1,1],'replicate');
% 
% for i=2:1:row-1
%    
%     for j=2:1:column-1
%         
%             medfilt_red = [im_red(i-1,j-1), im_red(i-1,j), im_red(i-1,j+1),...
%             im_red(i,j-1), im_red(i,j), im_red(i,j+1),...
%             im_red(i+1,j-1), im_red(i+1,j), im_red(i+1,j+1)];
%     
%     image_red(i,j)=median((medfilt_red));
%         
%             medfilt_blue = [im_blue(i-1,j-1), im_blue(i-1,j), im_blue(i-1,j+1),...
%             im_blue(i,j-1), im_blue(i,j), im_blue(i,j+1),...
%             im_blue(i+1,j-1), im_blue(i+1,j), im_blue(i+1,j+1)];
%         
%     image_blue(i,j)=median((medfilt_blue));
%     
%             medfilt_green = [im_green(i-1,j-1), im_green(i-1,j), im_green(i-1,j+1),...
%             im_green(i,j-1), im_green(i,j), im_green(i,j+1),...
%             im_green(i+1,j-1), im_green(i+1,j), im_green(i+1,j+1)];
%     
%     image_green(i,j)=median((medfilt_green));
%         
%     end
% 
% end
% 
% % Output image after applying median filter 
% output_image1=cat(3, image_red, image_blue, image_green);

%Laplacian filter negative mask
lap_filt=[1,1,1;1,-8,1;1,1,1];

image_r=double(red);
image_b=double(blue);
image_g=double(green);

s=size(image_r);
row=s(1);
column=s(2);

for k=1:row-2
   for l=1:column-2
       red(k,l)  =sum(sum(lap_filt.*image_r(k:k+2,l:l+2)));
       blue(k,l) =sum(sum(lap_filt.*image_b(k:k+2,l:l+2)));
       green(k,l)=sum(sum(lap_filt.*image_g(k:k+2,l:l+2)));
   end
end
% Output image after applying laplacian
output_image2=cat(3, red, green, blue);
imshow(output_image2)