function u=Gauss_Seidel_GCS(u,g)

g(2:end,:)=g(2:end,:)+u(1:end-1,:);
g(1:end-1,:)=g(1:end-1,:)+u(2:end,:);
g(:,2:end)=g(:,2:end)+u(:,1:end-1);
g(:,1:end-1)=g(:,1:end-1)+u(:,2:end);

g=g*0.25;


u=max(min(g,1),0);
end