function [U_out] = asp(U_in, lambda, dx, dy, dz)
% 读图
[N, M] = size(U_in);
% 频率
[KX, KY] = k_mesh(M,N,dx,dy);
% 滤波
k=2*pi/lambda;
H = exp(1i* dz * sqrt(max(k^2 - KX.^2 - KY.^2,0)));
% 恢复
U_fft = fftshift(fft2(U_in));
U_out = ifft2(ifftshift(H.*U_fft));
end
