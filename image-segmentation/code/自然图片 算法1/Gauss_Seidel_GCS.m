function u=Gauss_Seidel_GCS(u,g)

g(2:end,:)=g(2:end,:)+u(1:end-1,:);
g(1:end-1,:)=g(1:end-1,:)+u(2:end,:);
g(:,2:end)=g(:,2:end)+u(:,1:end-1);
g(:,1:end-1)=g(:,1:end-1)+u(:,2:end);

g=g*0.25;


u=max(min(g,1),0);
end



% function u=Gauss_Seidel_GCS(u,r,d,b,mu,lambda)
% 
% x=1;y=2; %for clarity
% 
% % Boundary conditions ignored
% 
% alpha=  -d(:,:,x)+b(:,:,x)-d(:,:,y)+b(:,:,y);
% alpha(2:end,:)=alpha(2:end,:)+d(1:end-1,:,x)-b(1:end-1,:,x);
% alpha(:,2:end)=alpha(:,2:end)+ d(:,1:end-1,y)-b(:,1:end-1,y);
% 
% beta=(-mu/lambda*r+alpha);
% beta(2:end,:)=beta(2:end,:)+u(1:end-1,:);
% beta(1:end-1,:)=beta(1:end-1,:)+u(2:end,:);
% beta(:,2:end)=beta(:,2:end)+u(:,1:end-1);
% beta(:,1:end-1)=beta(:,1:end-1)+u(:,2:end);
% 
% beta=beta*0.25;
% 
% 
% u=max(min(beta,1),0);
% end