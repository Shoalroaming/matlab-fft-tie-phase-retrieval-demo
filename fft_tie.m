function [Phi]=fft_tie(Ia,Ic,I0,lambda,dz,dx,dy,eps1,eps2)
% 读图
[N,M]=size(Ia);
% 频率
[KX,KY]=k_mesh(M,N,dx,dy);
k2=KX.^2+KY.^2;
% 滤波
H=-1./(k2+eps1);
H(1,1)=0;
% 辅助函数
f=-pi/lambda*(Ia-Ic)/dz;
F=H.*fftshift(fft2(f));
phi=ifft2(ifftshift(F));
% 相位
[phix,phiy]=gradient(phi,dx,dy);
x = (0:M-1)*dx;
y = (0:N-1)*dy;
[X,Y] = meshgrid(x,y);
g=divergence(X,Y,phix./(I0+eps2),phiy./(I0+eps2));  
G=H.*fftshift(fft2(g));
Phi=ifft2(ifftshift(G));
% 平移
Phi = Phi - mean(Phi(:));
end
