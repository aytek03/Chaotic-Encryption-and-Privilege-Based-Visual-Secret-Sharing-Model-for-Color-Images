function [ A, B ] = algorithm1( ) %K gelcek boþluða

% A = son deðerler. kaotik için lazým

% B = kaotikleri oluþturmak için lazým

K= 'AFE16E25A23D9D178D059526D0B5C63471429DB435794F8A359004B490'; %paperdaki rakam (hex)

%K= 'CBDF65E7EDA08BB1721E318AFA2F771DCE63D87A1774897558D887D196'; % benim yazdýðým makalede


K = hexToBinaryVector(K); %binary e çevirdik = makaledeki deðer.
%K2 = binaryVectorToHex(K1);

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

B = [ x0,y0,u,w,y1,y2]; %kaotik matrisi oluþturmak için ilk deðerler

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
    Y(m) = mod(y0 + w * Y(m) ,1);
    if Y(m) == 0
       Y(m) = 0.4;
    end
  
   
end

x1 = X(1);
x2 = X(2);
y1 = Y(1);
y2 = Y(2);
u1 = U(1);
u2 = U(2);


A = [ x1,y1,u1,x2,y2,u2]; %Kaotik matrislerin ilk durumlarý
%Chaotic Matrix'ler oluþturulacak.
end