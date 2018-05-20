% Image addition
i1=input('Enter first image name with location (cameraman.tif) :');
a=imread(i1);
m=rgb2gray(a);
subplot(2,2,1),imshow(m),title('Source image 1');

i2=input('Enter Second image name with location (cameraman.tif) :');
b=imread(i2);
n=rgb2gray(b);
subplot(2,2,2),imshow(n),title('Source image 2');

addim=double(m)+double(n);
d=uint8(addim);
imwrite(d,'out.bmp');
subplot(2,2,3),imshow(imread('out.bmp')),title('Subtracted image');


% Image addition and subtraction.
i1=input('Enter first image name with location (rgb.jpg) :');
a=imread(i1);
m=rgb2gray(a);
subplot(2,2,1),imshow(m),title('Source image 1');

i2=input('Enter Second image name with location (rgb2.jpg) :');
b=imread(i2);
n=rgb2gray(b);
subplot(2,2,2),imshow(n),title('Source image 2');

subim=double(m)-double(n);
e=uint8(subim);
imwrite(e,'out.bmp');
subplot(2,2,3),imshow(imread('out.bmp')),title('Subtracted image');






% Image histogram.
i1=input('Enter first image name with location (cameraman.tif) :');
img=imread(i1);
%img=rgb2gray(img);
subplot(2,1,1),imshow(img),title('Source image');

d=size(img);
n=d(1)*d(2);
pk=zeros(1,256);
for i=0:255
   s=find(img==i);
   [nk a]=size(s);
   pk(i+1)=nk/n;    
end

subplot(2,1,2),bar(0:255,2.5*pk,1/256),title('Histogram.');






% Image addition and subtraction.
i1=input('Enter image name with location (rgb.jpg) :');
a=imread(i1);
a=rgb2gray(a);
subplot(2,1,1),imshow(a),title('Source image');

c=255-double(a);
d=uint8(c);
%imshow(d);
subplot(2,1,2),imshow(d),title('Negative image');


%   High pass filter for image filtering.
clear;
clc;
i1=input('Enter image name with location (rgb.jpg) :');
inim=imread(i1);
%inim=rgb2gray(getim);
subplot(2,1,1),imshow(inim),title('Input image');

exim=wextend(2,'zpd',inim,1);
mask=[-1 -1 -1; -1 8 -1;-1 -1 -1];
[r,c]=size(exim);

for i=1:1:r-2,
   for j=1:1:c-2,
      N1=exim(i:i+2,j:j+2);
      ele_multi=mask.*double(N1);
      col_sum=sum(ele_multi);
      row_sum=col_sum(1,1)+col_sum(1,2)+col_sum(1,3);
      ave=row_sum/9;
      outim(i,j)=ave;
   end
end

hpassim=uint8(outim);
subplot(2,1,2),imshow(hpassim),title('High pass filtered image');      




i=imread('coins.png');
figure(1); imshow(i);
bw=im2bw(i,.3)   % apply any threshold to segment ( i have used just b/w convertion with .3 threshhold, u can use any threshold according to your need with the help of some testset)
[c r p]=impixel(bw);
obj=bwselect(bw,c,r,4)  
title('select the connected componet wich want to segment') 
mask=cast(obj,class(i)); % masked image must be converted to the same integer type as the integer image we want to mask
m_rgb = cat(3,(i(:,:,1).*mask), (i(:,:,2).*mask), (i(:,:,3).*mask));
figure(3); imshow(m_rgb);









 %Threshold
clear all; close all; clc;
Img2 = imread('cameraman.tif');
Img2=double(Img2);
im=Img2;
[r, c]=size(im); 
p=zeros(r,c);
for x=1:r
    for y=1:c
        if(im(x,y)<160)
           p(x,y)=0;
        else p(x,y)=im(x,y);
        end
    end
end

figure; imagesc(p);colormap(gray);
xlabel('Thresholding Image');



%block segmentation%
clc
clear all
close all

inp_img=imresize(imread('face1.jpg'),[252 252]);   %Resize 252/84=3 rem=0
gray_img=rgb2gray(inp_img);
[r, c]=size(gray_img);
 bs_r=84;                   %Row value for block segmentation
 bs_c=84;                   %colume value for block (84*84)
gray_feature=block(bs_r,bs_c,gray_img);  %block segmentation

figure

 kk=0;
 for p=1:(r/bs_r)
     for q=1:(c/bs_c)
 subplot(r/bs_r,c/bs_c,kk+q)
 imshow(gray_feature(:,:,kk+q))
     end
     kk=kk+(r/bs_r);
 end
 
 
 
 
 
 
 %% Image segmentation and extraction
%% Read Image
imagen=imread('image_a.jpg');
%% Show image
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end
%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,30);
pause(1)
%% Show image binary image
figure(2)
imshow(~imagen);
title('INPUT IMAGE WITHOUT NOISE')
%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction
figure
for n=1:Ne
    [r,c] = find(L==n);
    n1=imagen(min(r):max(r),min(c):max(c));
    imshow(~n1);
    pause(0.5)
end
