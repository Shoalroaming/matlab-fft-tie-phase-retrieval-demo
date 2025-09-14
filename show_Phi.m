function show_Phi(Phi, ttl)
imagesc(Phi); axis image off;
colormap jet; colorbar;
if nargin>1, title(ttl); end
end