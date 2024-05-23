function F = EQUATIONS(x,Dp,Fp,Nx,Ny,hx,hy,N,M,t)  
A=(1-M).^-0.5;
adabt=Dp-0.5; % Point de commancer du profil 
%% Define F(x)
% Equations aux noueuds
F(1)=x(2)+2*x(Nx+1)-2*(A+1)*x(1);
for k=2:Dp-1
 F(k)=x(k+1)+x(k-1)+2*A*x(k+Nx)-2*(A+1)*x(k);
end
for k=Dp:Fp
F(k)=x(k+1)+x(k-1)+2.*A.*x(k+Nx)-2.*(A+1)*x(k)...
-2*t*A*(0.5*1.74779155*(hy*(k-adabt)).^(-1/2)-0.624424+...
2.*(-1.727016)*hy*(k-adabt)+3*1.384087*...
(((hy*(k-adabt))).^2)+4.*(-0.489769).*((hy*(k-adabt))).^3);
end
for k=Fp:Nx
 F(k)=x(k+1)+x(k-1)+2*A*x(k+Nx)-2*(A+1)*x(k);
end
for i=0:Ny-3
s1=Nx+2+(Nx*i);
s2=s1+Nx-3;	 
    for  k=s1:s2
     	F(k)=x(k+1)+x(k-1)+A*x(k+Nx)+A*x(k-Nx)-2.*(A+1).*x(k);
    end
end    
F(Nx)=x(Nx-1)+A*x(Nx+Nx)-2*(A+1)*x(Nx);
for k=Nx+Nx:Nx:N-Nx
F(k)=x(k-1)+A*x(k+Nx)+A*x(k-Nx)-2*(A+1)*x(k);
end
 for k=Nx+1:Nx:N-Nx-Nx+1
F(k)=x(k+1)+A*x(k+Nx)+A*x(k-Nx)-2*(A+1)*x(k);
 end
F(N-Nx+1)=x(N-Nx+2)+A*x(N-Nx+1-Nx)-2*(A+1)*x(N-Nx+1);
for  k=N-Nx:N-1
F(k)=x(k+1)+x(k-1)+A*x(k-Nx)-2*(A+1)*x(k);
end
 F(N)=x(N-1)+A*x(N-Nx)-2*(A+1)*x(N);  
F=F';
%%
end

