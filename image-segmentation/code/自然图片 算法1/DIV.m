function f=DIV(d,b)
x=1;y=2; %for clarity

% Boundary conditions ignored

alpha=  -d(:,:,x)+b(:,:,x)-d(:,:,y)+b(:,:,y);
alpha(2:end,:)=alpha(2:end,:)+d(1:end-1,:,x)-b(1:end-1,:,x);
alpha(:,2:end)=alpha(:,2:end)+ d(:,1:end-1,y)-b(:,1:end-1,y);
f=alpha;