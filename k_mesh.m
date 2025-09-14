function [KX,KY] = k_mesh(M,N,dx,dy)
kx = 2*pi/(M*dx) * (-floor(M/2):floor((M-1)/2));
ky = 2*pi/(N*dy) * (-floor(N/2):floor((N-1)/2));
[KX,KY] = meshgrid(kx,ky);
end
