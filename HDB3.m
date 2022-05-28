
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
bits = input('prompt');
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
counter = 0;
lastbit = 1;
pulse = 0;
for i=1:length(bits)
  if bits(i)==0
    counter = counter + 1;
    if counter==4
      if(mod(pulse, 2)==0)
        x((i-1-3)*n+1:(i-3)*n) = -lastbit;
        lastbit = -lastbit;
        x((i-1-2)*n+1:(i-2)*n) = 0;
        x((i-1-1)*n+1:(i-1)*n) = 0;
        x((i-1)*n+1:i*n) = lastbit;
        counter = 0;
        pulse = 0;
      else
        x((i-1-3)*n+1:(i-3)*n) = 0;
        x((i-1-2)*n+1:(i-2)*n) = 0;
        x((i-1-1)*n+1:(i-1)*n) = 0;
        x((i-1)*n+1:i*n) = lastbit;
        counter = 0;
        pulse = 0;
      end
    end
  else
    counter = 0;
    x((i-1)*n+1:i*n) = -lastbit;
    lastbit = -lastbit;
    pulse = pulse + 1;
  end
end
plot(t, x, 'Linewidth', 3);
counter = 0;
lastbit = 1;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1;
    if x(i)==lastbit
      result(counter-3:counter) = 0;
    else
      if(x(i)==0)
        result(counter) = 0;
      else
        result(counter) = 1;
        lastbit = -lastbit;
      end
    end
  end
end
disp('HDB3 Decoding:');
disp(result);
