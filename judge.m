function q = judge(Phi)
[phix,phiy] = gradient(Phi);
gradMag = hypot(phix, phiy);
q.GMR = mean(gradMag(:)) / std(gradMag(:));
q.Lap = mean(abs(del2(Phi(:))));
end