clear
h = .01; k = h/5; c = 2; r = c*k/h;
if r>=1
    disp('!!!')
end
a = 1; b = 0.5;
x = 0:h:a; t = 0:k:b;
U = zeros(length(t),length(x));
%t=0
U(1,:) = sin(pi*x) + sin(2*pi*x);
%t=k
U(2,:) = U(1,:)+k*0;

for n = 3:length(t)
    U(n,:) = (2-2*r.^2)*U(n-1,:) + r.^2*([0, U(n-1,1:end-1)] + [U(n-1,2:end),0]) - U(n-2,:); 
    U(n,1) = 0; U(n,end) = 0; 
end
[X, T] = meshgrid(x,t);
Ureal = sin(pi*X).*cos(2*pi*T) + sin(2*pi*X).*cos(4*pi*T);
for j = 1:length(t)
    plot(x,Ureal(j,:));hold on
    plot(x,U(j,:),'ro');hold off
    axis([0,1,-2,2]) 
    drawnow
end