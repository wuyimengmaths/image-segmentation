clc;clear all;close all;
m=217; n=181;
I=zeros(m,n);

for i=0:3
    for j=0:3
     a=2*rand-2;
     max(I(:))
     I=I+f(a,I,i,j);         
    end    
end
I0=rescale(I,0,1);
figure(1),imshow(I0,[]);




%figure(2),imshow(I1,[]);   
% imwrite(I0,'bias8.bmp');
%save('bias7.mat');