% Demo of "Localized Region Based Active Contours"
% 
% Example:
% localized_seg_demo
%
% Coded by: Shawn Lankton (www.shawnlankton.com)
%ÄãºÃ
%I = imread('monkey.png');   
%-- load the image

I = imread('G:\home\yangyi\localized_seg\yangyi_1\ISIC_0003462.jpg');
m = false(size(I,1),size(I,2));   %-- create initial mask
%m(37:213,89:227) = true;
m(184:272,192:280) =true;

I = imresize(I,.5);  %-- make image smaller 
m = imresize(m,.5);  %   for fast computation

subplot(2,2,1); imshow(I); title('Input Image');
subplot(2,2,2); imshow(m); title('Initialization');
subplot(2,2,3); title('Segmentation');

seg = localized_seg(I, m,1300);  %-- run segmentation

subplot(2,2,4); imshow(seg); title('Final Segmentation');
imwrite(seg,'G:\home\yangyi\localized_seg\result_0.9\ISIC_0003462.jpg')




