bits=[0 1 0 1 ];
bitduration=1;
T=length(bits)*bitduration;
fs=100;
t=0:bitduration/fs:T;

x=zeros(1,length(t));



# Encoding...

previous=5;

for i=1:length(bits)

    if(bits(i)==1)


      x((i-1)*fs+1:(i*fs-fs/2))=previous;
      x((i*fs-fs/2)+1:i*fs)=-previous;



     else

       previous=-previous;
       x((i-1)*fs+1:(i*fs-fs/2))=previous;
       x((i*fs-fs/2)+1:i*fs)=-previous;


    endif



endfor




plot(t,x,'Linewidth',3);
xlim([0,T]);
ylim([-10 10]);


counter=0;

# Decoding...
previous=5;
for i=1:fs:length(x)-1
  counter=counter+1;
    if(x(i)==previous)
      result(counter)=1;
    else
       result(counter)=0;
       previous=-previous;

    endif
  endfor

  result
