amp_carrier=1;
amp_message=1;

frequency_carrier=5;
frequency_mesage=4;

T=4;
t=0:0.001:T;

m=amp_message/amp_carrier;

message = amp_message*sin(2*pi*frequency_mesage*t);

subplot(3,1,1);
plot(t,message);
title('Message Signal');


carrier= amp_carrier*sin(2*pi*frequency_carrier*t);

subplot(3,1,2);

plot(t,carrier);
title('carrier Signal');

modulation=amp_carrier*sin(2*pi*frequency_carrier*t+(m.*(2*pi*frequency_mesage*t)))

subplot(3,1,3);

plot(t,modulation,'r');
title('Modulated Signal');

