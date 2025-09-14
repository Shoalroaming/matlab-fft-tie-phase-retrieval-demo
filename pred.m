function res = pred(U0, lambda, dx, dy, dz, Imeas)
U_pred = asp(U0, lambda, dx, dy,  dz);
I_sim     = abs(U_pred).^2;
err       = rrmse(I_sim, Imeas);
res.U_pred=U_pred;
res.I_sim=I_sim;
res.err=err;
end