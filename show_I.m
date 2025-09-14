function show_I(I, ttl)
imagesc(I,[0 1]); axis image off;
colormap gray;
if nargin>1, title(ttl); end
end