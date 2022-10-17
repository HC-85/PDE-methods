clear;close gcf
h = .1;
xa = 0; xb = 4;
ya = 0; yb= 4;
xa0 = 80; xb0 = 0;
ya0 = 180; yb0 = 20;
X = xa:h:xb;
Y = ya:h:yb;
L = [0 1 0;1 0 1;0 1 0]/4;
U = zeros(round((xb-xa)/h),round((yb-ya)/h));
tic
for n = 1:10000
    U(1,2:end-1,n) = ya0;
    U(end,2:end-1,n) = yb0;
    U(2:end-1,1,n) = xa0;
    U(2:end-1,end,n) = xb0;
    V = conv2(L,U(:,:,n));
    U(:,:,n+1) = V(2:end-1,2:end-1);
    if abs(sum(U(:,:,n+1)-U(:,:,n),'all'))<1 && n>max(size(U,1),size(U,2))/2
        disp(n)
        break
    end
end
toc

for n = 1:size(U,3)
    surf(U(:,:,n)) 
    axis vis3d
    xticks([]);yticks([]);zticks([])
    view(100 + n/5,15)
    drawnow
end