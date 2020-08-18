tic

clear 
close all;
 
ImgID =5; %   % choose one of the input images
Img = imread([num2str(ImgID),'.bmp']);
Img = double(Img(:,:,1));
Img=Img./255;

 
[M,N] = size(Img);
u0 = zeros(M,N);
%³õÊ¼¿ò
  
S0=zeros(M,N);

switch ImgID   
case 1
rho1=0.45;                             
lameda =3;
rho2=0.6;
alpha=1000;
beta=3;
rho=20;
eps=0.00001;
maxiter=200;
u0(ceil(2*M/10):floor(8*M/10), ceil(4*N/10):floor(6*N/10)) = 1;    
    

case 2
rho1=0.45;                             
lameda =4;
rho2=0.6;
alpha=1800;
beta=3;
rho=20;
eps=0.00001;
maxiter=1000;
u0(ceil(2*M/10):floor(8*M/10), ceil(5*N/10):floor(8*N/10)) = 1;      

case 3
rho1=0.45;                             
lameda =4;      %
rho2=0.6;
alpha=2000;      
beta=3;
rho=20;
eps=0.00001;
maxiter=1500;
u0(ceil(1*M/10):floor(6*M/10), ceil(3*N/10):floor(8*N/10)) = 1;      

case 4
rho1=0.45;                             
lameda =3.5;
rho2=0.6;
alpha=2000;
beta=3;
rho=20;
eps=0.00001;
maxiter=400;
u0(ceil(2*M/10):floor(8*M/10), ceil(2*N/10):floor(6*N/10)) = 1;     
        
case 5        
rho1=0.1;                             
lameda =3;
rho2=0.6;
alpha=2000;
beta=3;
rho=20;
eps=0.00001;
maxiter=400;
% u0(ceil(2*M/10):floor(7*M/10), ceil(2*N/10):floor(6*N/10)) = 1;  
u0(ceil(4*M/10):floor(6*M/10), ceil(4*N/10):floor(6*N/10)) = 1;
end


[c1,c2,u,S,B]=seg_gcs(u0,Img,rho1,lameda,alpha,beta,rho,rho2,eps,maxiter); 

a=0;b=1;
B=rescale(B,a,b);

figure(1),imshow(u,'border','tight','initialmagnification','fit');


S=rescale(S,0,1);         
figure(3), imshow(S,'border','tight','initialmagnification','fit');
figure(4),imshow(B,'border','tight','initialmagnification','fit');  


figure(5),imshow(Img, [0, 1],'border','tight','initialmagnification','fit');hold on;
contour(u0,[0.5 0.5],'r'); 
figure(6),imshow(Img, [0, 1],'border','tight','initialmagnification','fit');hold on;
contour(u,[1 1],'r'); 





