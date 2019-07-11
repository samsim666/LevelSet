p='G:\home\yangyi\localized_seg\yangyi\';
D =dir([p '*.jpg']);
q='G:\home\yangyi\localized_seg\result_0.9\';
for i =37:length(D)

   I = imread([p D(i).name]);
   disp(i);
   data= data1{2:150,3:6};

   minx=data(i,1);
   miny=data(i,2);
   maxx=data(i,3);
   maxy=data(i,4);
  if minx<10
      minx=10;
  end
  if miny<10
      miny=10;
  end
  if maxx>500
      maxx=500;
  end
  if maxy>500
      maxy=500;
  end
  
   m = false(size(I,1),size(I,2));   %-- create initial mask
%m(37:213,89:227) = true;
m(minx:maxx,miny:maxy) =true;

I = imresize(I,.5);  %-- make image smaller 
m = imresize(m,.5);  %   for fast computation

subplot(2,2,1); imshow(I); title('Input Image');
subplot(2,2,2); imshow(m); title('Initialization');
subplot(2,2,3); title('Segmentation');

seg = localized_seg(I, m,1200);  %-- run segmentation

subplot(2,2,4); imshow(seg); title('Final Segmentation');
imwrite(seg,[q D(i).name]);

   
end  