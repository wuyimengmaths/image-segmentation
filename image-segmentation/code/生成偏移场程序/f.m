function g=f(a,I,i,j)
 [m,n]=size(I); g=zeros(m,n);
        for x=1:m
            for y=1:n
              g(x,y)=a.*((x-m/2)/(m/2))^i.*((y-n/2)/(n/2))^j;
             % g(x,y)=a.*((x-m/2))^i.*((y-n/2))^j;
            end
        end                  