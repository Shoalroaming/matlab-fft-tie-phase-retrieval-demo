% 参数
dz     = 1e-4;
dx     = 8e-6;  dy = dx;
lambda = 632.8e-9;
eps1   = 1e-5;
eps2   = 1e-3;

% 读图 & 归一化
Ia = im2double(imread('dog=20.1mm.tif'));
I0 = im2double(imread('dog=20mm.tif'));
Ic = im2double(imread('dog=19.9mm.tif'));

% 解相位
Phi = fft_tie(Ia, Ic, I0, lambda, dz, dx, dy, eps1, eps2);


% 预测
U0  = sqrt(I0) .* exp(1i*Phi);
res_a = pred(U0, lambda, dx, dy,  dz, Ia);
res_c = pred(U0, lambda, dx, dy, -dz, Ic);


% 可视化，评估
figure; show_Phi(Phi,'Phase by FFT-TIE');
q = judge(Phi);
fprintf('GMR = %.2f,  LapMean = %.2e\n', q.GMR, q.Lap);

figure;
subplot(2,2,1); show_I(Ia,'原始 Ia');
subplot(2,2,2); show_I(res_a.I_sim, 'ASP 模拟 Ia');
subplot(2,2,3); show_I(Ic, '原始 Ic');
subplot(2,2,4); show_I(res_c.I_sim, 'ASP 模拟 Ic');

fprintf('正向 ASP Ia 误差 = %.2f %%\n', res_a.err);
fprintf('反向 ASP Ic 误差 = %.2f %%\n', res_c.err);