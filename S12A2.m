clear
h = .01; k = h/250; alpha = 1;
r = alpha.^2*k/h.^2;
if r>=1/2||r<=0
    disp('!!!')
end
a = 1; b = .1;
x = 0:h:a;
t = 0:k:b;
U = zeros(length(t),length(x));
%t=0
U(1,:) = sin(pi*x)+sin(3*pi*x);
for n = 2:length(t)
    U(n,:) = (r)*([0, U(n-1,1:end-1)] + [U(n-1,2:end),0]) + (1-2*r)*U(n-1,:);
    U(n,1) = 0; U(n,end) = 0; 
end
[X, T] = meshgrid(x,t);
Ureal = sin(pi*X).*exp(-T*pi^2) + sin(3*pi*X).*exp(-9*T*pi^2);
for j = 1:length(t)
    plot(X,Ureal(j,:));hold on
    plot(X,U(j,:),'ro');hold off
    axis([0,1,-.5,2])
    drawnow
end
