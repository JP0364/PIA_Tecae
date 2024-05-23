function   jac=JACFUNC(F,x,Dp,Fp,Nx,Ny,hx,hy,N,M,t)
% Fonction pour calculer le matrice Jacobien 
N=length(x);
F=EQUATIONS(x,Dp,Fp,Nx,Ny,hx,hy,N,M,t);
DX=1e-06;
    for i=1:N
        xn=x;
   xn(i)=x(i)+DX; 
    Fnew=EQUATIONS(xn,Dp,Fp,Nx,Ny,hx,hy,N,M,t);
    jac(:,i)=(Fnew-F)/DX;
    end
end

