clc
clear all
bit=[1 1 1 1]
bd=1;
fs=100;
T=bd*length(bit);
state=[0 5 0 -5];
k=1;
t=0:bd/fs:T
x=zeros(1,length(t));
for i=1:length(bit);
  if(bit(i)==0)
   x((i-1)*fs+1:i*fs)=state(k);
 else
     k=k+1;
     if(k>4)
        k=1;
     endif
     x((i-1)*fs+1:i*fs)=state(k);
  endif
endfor
plot(t,x);
xlim([0,T]);
ylim([-10 ,10])
xlabel('Time');
ylabel('Value');
title('MLT-3 Line coding');


