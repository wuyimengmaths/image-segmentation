tic

clear 
close all;


ImgID =1; %   % choose one of the input images

Img = imread([num2str(ImgID),'.bmp']);
Img = double(Img);
Img=Img./255;

Img=log(Img+1);
Img = rescale(Img,0,1);


[M,N] = size(Img);
u0 = zeros(M,N);
%初始框
  
S0=zeros(M,N);

switch ImgID
    
    
case 1
rho1=0.45;                            
lameda =23;       %  jiao
rho2=0.6;
alpha=8000;
beta=3;
rho=20;        %
eps=0.0001;
maxiter=500;
step=2;                                            %矫正step调到20            
u0(ceil(3*M/8):floor(4*M/8), ceil(3*N/8):floor(5*N/8)) = 1;  


case 2
rho1=0.45;                             
lameda =20;
rho2=0.6;
alpha=8000;
beta=3;
rho=2;
eps=0.00001;
maxiter=500;
step=2;                                   %矫正step调到20
 
u0(ceil(3*M/8):floor(4*M/8), ceil(2*N/8):floor(3*N/8)) = 1;  

case 3
rho1=0.45;                             
lameda =23;
rho2=0.6;
alpha=7000;
beta=3;
rho=20;
eps=0.00001;
maxiter=300;
step=2;                                          %矫正step调到20
u0(ceil(4*M/8):floor(5*M/8), ceil(2*N/8):floor(3*N/8)) = 1; 

case 4
rho1=0.45;                             
lameda =19;
rho2=0.6;
alpha=5000;
beta=3;
rho=20;
eps=0.00001;
step=2;                                %矫正step调到20
maxiter=500;
u0(ceil(4*M/8):floor(5*M/8), ceil(14*N/20):floor(15*N/20)) = 1;
    
  
 

    

  
end

for type = {'bias'}

[c1,c2,u,S,B]=seg_gcs(u0,Img,rho1,lameda,alpha,beta,rho,rho2,eps,maxiter,type,step); 

a=0;b=1;
B=rescale(B,a,b);

figure(1),imshow(u,'border','tight','initialmagnification','fit');

S=exp(S);
S=rescale(S,0,1); 

figure(3), imshow(S,'border','tight','initialmagnification','fit');
figure(4),imshow(B,'border','tight','initialmagnification','fit');  



        

end




Img2 = imread([num2str(ImgID),'.bmp']);
Img2 = double(Img2);
Img2=Img2./255;

figure(5),imshow(Img2, [0, 1],'border','tight','initialmagnification','fit');hold on;
contour(u0,[0.5 0.5],'r');  
figure(6),imshow(Img2, [0, 1],'border','tight','initialmagnification','fit');hold on;
contour(u,[0.5 0.5],'r'); 


