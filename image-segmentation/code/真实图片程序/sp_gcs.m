function [c1,c2,u,S,B] = sp_gcs(u,Img,rho1,lameda,alpha,beta,rho,rho2,eps,maxiter,type)
[M,N] = size(Img);
B = zeros(M,N);
S = Img-B;
theta = zeros(M,N);

[XX,YY] = meshgrid((1:N)/N, (1:M)/M);
BfiltDCT = rho + 2*alpha*(XX.^2 + YY.^2);
SfiltDCT = (2*lameda+rho)./rho2+(XX.^2 + YY.^2);


c1 = sum( S(:) .* u(:) ) / sum(  u(:) );
c2 = sum(  S(:) .* (1-u(:)) ) / sum( (1-u(:)) );
    
    [deltau(:,:,1), deltau(:,:,2)]=gradient(u);
    [deltaS(:,:,1), deltaS(:,:,2)]=gradient(S);        

uprev=zeros(size(u));
%Sprev=zeros(size(Img));

theta1=zeros([size(u),2]);
d1=zeros([size(u),2]);
ii=1;


theta2=zeros([size(S),2]);
d2=zeros([size(S),2]);

while (norm2D(u-uprev,2)>eps) && (ii<maxiter)
    
%     if sum(u(:)) > 0.5*numel(u)
%        u = 1-u;
%     end




 
    d1=shrink(deltau+theta1./rho1,1/rho1);          %solve d1
    d2=shrink(deltaS+theta2./rho2,beta/rho2);        % solve d2

    r=((c1-S).^2-(c2-S).^2);
    uprev=u;

g=(-lameda/rho1*r+DIV(d1.*rho1,theta1)/rho1);


u=Gauss_Seidel_GCS(u,g);  %solve u  
u = 1 .* (u > 0.55);

    S=real( idct2( dct2((theta+rho*(Img-B)-2*lameda*(u.*c2-u.*c1-c2)+(DIV(d2.*rho2,theta2)))/rho2)./SfiltDCT)); %solve S
    
if any(strcmp( type, {'bias'} ))
    B = real( idct2( dct2( rho*( Img - S ) + theta ) ./ BfiltDCT ) ); %solve B
        
    
    
    theta = theta + rho*(Img - B - S);     %%%%%%%%%%%%%%
    theta1=theta1+rho1*(deltau-d1);                         
    theta2=theta2+rho2*(deltaS-d2); 
end
    
c1 = sum( S(:).* u(:) ) / sum(  u(:) );
c2 = sum( S(:) .* (1-u(:)) ) / sum( (1-u(:)) );

    
%      c1=mean(Img(uprev>0.01));
%      c2=mean(Img(uprev<0.01));
    
    ii=ii+1;
    
end
disp(['Exit in iteration number ', num2str(ii)])
end
