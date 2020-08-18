tic

clear 
close all;


imgID =6; %   % choose one of the          %%%%%%%%%5 u 大于0.55，8 %u 大于0.59     6 u大于0.55

Img = imread([num2str(imgID),'.bmp']);
Img = double(Img(:,:,1));
Img = rescale(Img,0,1);

 
[M,N] = size(Img);
u0 = zeros(M,N);
%初始框
  
% S0=zeros(M,N);

switch imgID
 
case 6
rho1=0.85;                             
lameda =40;
rho2=6;
alpha=7000;
beta=5;
rho=220;
eps=0.00001;
maxiter=200;
u0(ceil(6*M/10):floor(7*M/10), ceil(4*N/20):floor(6*N/20)) = 1;  


case 7                        %u＞0.59
rho1=0.112;                             
lameda =36;
rho2=3.8;
alpha=11000;
beta=4;
rho=162;
eps=0.00001;
maxiter=160;
u0(ceil(1*M/10):floor(2*M/10), ceil(6*N/20):floor(7*N/20)) = 1;  


 

%%%%%%%%%%%%%%%%%%%%%%%%%%%        %u 大于0.55
case 5                                         
rho1=0.55;                             
lameda=22;
rho2=0.6;
alpha=4000;
beta=3;
rho=20;
eps=0.00001;
maxiter=200;
u0(ceil(1*M/10):floor(6*M/10), ceil(2*N/10):floor(9*N/10)) = 1;  



%%%%%%%%%%%%%%%%%%%%%%%%%%%      
case 8                              
rho1=0.24;                             
lameda=8;
rho2=5;
alpha=1000;
beta=12.8;
rho=30;
eps=0.00001;
maxiter=200;
u0(ceil(1*M/11):floor(9*M/10), ceil(2*N/10):floor(8*N/10)) = 1;  






end
















for type = {'bias'}

[c1,c2,u,S,B]=sp_gcs(u0,Img,rho1,lameda,alpha,beta,rho,rho2,eps,maxiter,type); 

a=0;b=1;
B=rescale(B,a,b);

figure(1),imshow(u,'border','tight','initialmagnification','fit');


S=rescale(S,0,1);         
figure(3), imshow(S,'border','tight','initialmagnification','fit');   
figure(4),imshow(B,'border','tight','initialmagnification','fit');  

      
        
%          figure(5),
%         Iseg = hsv2rgb( cat(3, zeros(M,N), u, 0.25+0.75*Img) );
%         imshow(Iseg,[]);
%         image( Iseg ); title('final'); axis tight; axis off;
%         print(5,'-depsc2','c4.eps')
%         
%         figure(6),
%        Iseg0 = hsv2rgb( cat(3, zeros(M,N), u0, 0.25+0.75*Img) );imshow(Iseg0);
%         image( Iseg0 ); title('init'); axis tight; axis off;
%         print(6,'-depsc2','c5.eps')

        

end



figure(5),imshow(Img, [0, 1],'border','tight','initialmagnification','fit');hold on;
contour(u0,[0.5 0.5],'r'); 
figure(6),imshow(Img, [0, 1],'border','tight','initialmagnification','fit');hold on;
contour(u,[0.5 0.5],'r'); 




    S0='ceshi3we.mat';
    save(S0);





