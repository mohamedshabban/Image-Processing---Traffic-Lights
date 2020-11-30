img=imread('F:\4th year\image\project\Test cases\Bonus\case 1\b-1.jpg');
I = rgb2gray(img);
I = im2bw(I);
I = ~I;
figure,imshow(I);
[L ,num] = bwlabel(I);
disp(num)

se = strel('Square',double(15)); %test 3.2

%se = strel('Square',double(6));
ss = imerode(I,se);
figure, imshow(ss);
%
m=bwareafilt(ss,1);
[vv,num22] = bwlabel(m);
%test case 4 
% m=bwareafilt(ss,2);
% m2=bwareafilt(ss,3);
% m3=m2-m;
% [vv,num22] = bwlabel(m3);
% disp(num22)

stats = regionprops(vv,'All');
rectangle('Position',stats(1).BoundingBox,'Edgecolor','r');
I2=imcrop(img,stats(1).BoundingBox);
 figure,imshow(I2)


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
            if (I2(i,j,2)>180 && I2(i,j,1)>230)
             yellow_count = yellow_count+1;             
         end
        end
         if(I2(i,j,2)>200 && I2(i,j,1)<120)
             green_count= green_count + 1 ;
         end
         
    end
end
if(red_count==yellow_count)
    disp('red & yellow')
elseif (green_count>red_count)
 
end





