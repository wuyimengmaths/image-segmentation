function z=shrink(z,lambda)
nz=sqrt(  sum(z.^2,3)   );
nz=max(0,nz - lambda)./max(1e-4,nz);
z = nz(:,:,ones(1,size(z,3))).*z;
end
