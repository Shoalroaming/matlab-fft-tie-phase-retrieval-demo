function [err] = rrmse(I1, I2)
err = sqrt(mean((I1(:) - I2(:)).^2)) / mean(I1(:)) * 100;
end
