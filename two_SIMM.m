function [ S ] = two_SIMM( )


M=150; % kaotik matrisin uzunlu�u ve geni�li�i
N=150;

x=0.3; %initial values. paper daki de�erler
y=0.4;

a=1;
b=5;

S = zeros(M,N); %kaotik matris olu�turuldu

%u = 0.9; % m� de�eri. ilk de�er.
figure, hold on % t�m noktalar ayn� grafikte olsun diye hold on

for m = 1:M
    for n = 1:N
        
        x = a*sind(180*y)*sin(b/x); %form�l
        y = a*sind(180*x)*sin(b/y);
        
        %S(m,n) = floor(mod((x+y)*2^(30),256));
    
   % plot(x,y,'r'); %2014te bu sat�r i�lemiyor
   plot(x,y,'r.','MarkerSize',0.01) % k�rm�z� noktalar i�in
   %plot(x,y,'.','MarkerSize',0.01)
   
    axis ([-1.0 1.0 -1.0 1.0]); % axis([enkucukx enbuyukx enkucuky enbuyuky] bu noktalar aras�ndaki de�erler g�steriliyor
    end
end
end

