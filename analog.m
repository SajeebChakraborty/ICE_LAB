fc=2;
a=5;
phi=90;
fs=100;
T=1;
t=0:1/fs:5*T;

y=a*sin(2*pi*fc*t+phi);
z=10*sin(2*pi*5*t+0);
x=y+z;

subplot(3,1,1);
plot(t,y);
subplot(3,1,2);
plot(t,z);

subplot(3,1,3);
plot(t,x);
