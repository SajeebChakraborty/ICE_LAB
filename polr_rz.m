bits=[0 1 0 0 1 1 1 0];
bitduration=1;
T=length(bits)*bitduration;
fs=100;
t=0:bitduration/fs:T;

x=zeros(1,length(t));



# Encoding...


for i=1:length(bits)

    if(bits(i)==1)


      x((i-1)*fs+1:(i*fs-fs/2))=5;



     else

       x((i-1)*fs+1:(i*fs-fs/2))=-5;


    endif



endfor




plot(t,x,'Linewidth',3);
xlim([0,T]);
ylim([-10 10]);
grid on;

counter=0;

# Decoding...

for i=1:fs:length(x)-1
  counter=counter+1;
    if(x(i)==5)
      result(counter)=1;
    else
       result(counter)=0;

    endif
  endfor

  result
