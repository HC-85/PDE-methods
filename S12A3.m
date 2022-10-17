clear
h = 1;
xa = 0; xb = 4;
ya = 0; xy = 4;
L = [0 1 0;1 0 1;0 1 0]/4;
U = [
0 180 180 180 0
80 0 0 0 0
80 0 0 0 0
80 0 0 0 0
0 20 20 20 0
];
surf(U)
pause
for n = 2:1000
    n
    V = conv2(L,U(:,:,n-1));
    U(:,:,n) = V(2:end-1,2:end-1);
    U(1,:,n) = [0 180 180 180 0];
    U(5,:,n) = [0 20 20 20 0];
    U(:,1,n) = [0 80 80 80 0];
    U(:,5,n) = [0 0 0 0 0];
    surf(U(:,:,n))
    drawnow
    pause(.1)
    if sum(U(:,:,n)-U(:,:,n-1),'all')<.001
        disp(n)
        break
    end
end
U(:,:,end)
