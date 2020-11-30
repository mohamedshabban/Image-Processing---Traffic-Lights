
img=imread('F:\4th year\image\project\Test cases\Case 3\1.jpg');
figure,imshow(img);

I = rgb2gray(img);
I = im2bw(I);
I = ~I;
figure,imshow(I);
[L ,num] = bwlabel(I);
stats = regionprops(L,'BoundingBox');
rectangle('Position',stats(1).BoundingBox,'Edgecolor','r');
stats(1).BoundingBox(1)=53;
stats(1).BoundingBox(2)=138;
stats(1).BoundingBox(3)=20;
stats(1).BoundingBox(4)=42;

I2=imcrop(img,stats(1).BoundingBox);
figure,imshow(I2);
%%%%%%%%%%
red_count=0;
green_count=0;
yellow_count=0;
[h, w ,l ]= size(I2);
disp(h);
disp(w);
bbb = I2(1,1,2);
for i = 1:h
    for j = 1: w
        if(I2(i,j,1)>200 && I2(i,j,2)<120)
            red_count= red_count + 1 ;          
        end
         if(I2(i,j,2)>200 && I2(i,j,1)<120)
             green_count= green_count + 1 ;
         end
         if (I2(i,j,2)>180 && I2(i,j,1)>230)
             yellow_count = yellow_count+1;             
         end
    end
end
if(red_count>green_count)
    disp('red')
elseif (green_count>red_count)
    disp('green')
elseif(yellow_count > red_count&&yellow_count > green_count)
        disp('Yellow')
end




% next=imdilate(I,strel('square',6));
% figure, imshow(~next);
% new1=bwareafilt(~next,1);
% new2=bwareafilt(~next,2);
% new3= new2-new1;
% %figure, imshow(new3);
% [L1 , num11] = bwlabel(new3);
% status_objects =regionprops(L1,'');
% bb= status_objects(1).BoundingBox(:);

%newimg=imcrop(img,[bb(1),bb(2),bb(3),bb(4)]);
%figure, imshow(newimg);

% I2 = imcrop(data,List);
% figure,imshow(I2);
%  x = stats(1).BoundingBox(1);
%  
%  
%  y = stats(1).BoundingBox(2);
%  len = stats(1).BoundingBox(3);
%  wed = stats(1).BoundingBox(4);
%  inc_red=0;
%  inc_yellow=0;
% red_count=0;
% green_count=0;
% yellow_count=0;
% row = uint8(len+x);
% col = uint8(wed+y);
% %disp(row);
% %disp(col);
% [h, w ,l ]= size(I2);
% disp(h);
% disp(w);
% bbb = I2(1,1,2);
% for i = 1:h
%     for j = 1: w
%         if(I2(i,j,1)>200 && I2(i,j,2)<120)
%             red_count= red_count + 1 ;          
%         end
%          if(I2(i,j,2)>200 && I2(i,j,1)<120)
%              green_count= green_count + 1 ;
%          end
%          if (I2(i,j,2)>180 && I2(i,j,1)>230)
%              yellow_count = yellow_count+1;             
%          end
%     end
% end
% if(red_count>green_count)
%     disp('red')
% elseif (green_count>red_count)
%     disp('green')
% elseif(yellow_count > red_count&&yellow_count > green_count)
%         disp('Yellow')
% end

