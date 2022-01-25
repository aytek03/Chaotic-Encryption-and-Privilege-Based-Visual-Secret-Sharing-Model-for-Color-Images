function [ A ] = changing_secret_key( K )

K = hexToBinaryVector(K); %binary e çevirdik = makalediki deðer.

%K = round(rand(1,232)); %Asýl bu olacak. rastgele, 232 bitlik 0-1'den oluþan rakam
 
 x0=0;
 y0=0;
 u=0;
 w=0;
 
 y1=0;
 y2=0;

for i = 1 : 52
  x0 = x0 + (K(i) * 2^(i-1)) / 2^52;  % x0

end

for i = 53 : 104
  y0 = y0 + (K(i) * 2^(i-53)) / 2^52;  % y0

end

for i = 105 : 156
  u = u + (K(i) * 2^(i-105)) / 2^52;  % u = mü ifadesi

end

for i = 157 : 208
  w = w + (K(i) * 2^(i-157)) / 2^52;  %w

end

for i = 209 : 220
  y1 = y1 + (K(i) * 2^(i-209));  

end

for i = 221 : 232
  y2 = y2 + (K(i) * 2^(i-221));  

end

Y = zeros (1,2);
X = Y;
U = Y;
Y = [y1,y2]; 

for m=1:2
    U(m) = mod(u + w * Y(m),0.4) + 0.5; % mü hesaplanýyor
end

for m = 1:2
    X(m) = mod(x0 + w * Y(m) ,1);
    if X(m) == 0
       X(m) = 0.4;
    end
    Y(m) = mod(y0 + w * Y(m),1);
    if Y(m) == 0
       Y(m) = 0.4;
    end
  A = [ x0,y0,u,w,y1,y2];
end

%Chatic Matrix'ler oluþturulacak.
end