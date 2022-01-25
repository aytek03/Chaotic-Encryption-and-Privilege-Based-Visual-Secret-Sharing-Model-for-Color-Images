function [ S ] = two_SIMM( )


M=150; % kaotik matrisin uzunluðu ve geniþliði
N=150;

x=0.3; %initial values. paper daki deðerler
y=0.4;

a=1;
b=5;

S = zeros(M,N); %kaotik matris oluþturuldu

%u = 0.9; % mü deðeri. ilk deðer.
figure, hold on % tüm noktalar ayný grafikte olsun diye hold on

for m = 1:M
    for n = 1:N
        
        x = a*sind(180*y)*sin(b/x); %formül
        y = a*sind(180*x)*sin(b/y);
        
        %S(m,n) = floor(mod((x+y)*2^(30),256));
    
   % plot(x,y,'r'); %2014te bu satýr iþlemiyor
   plot(x,y,'r.','MarkerSize',0.01) % kýrmýzý noktalar için
   %plot(x,y,'.','MarkerSize',0.01)
   
    axis ([-1.0 1.0 -1.0 1.0]); % axis([enkucukx enbuyukx enkucuky enbuyuky] bu noktalar arasýndaki deðerler gösteriliyor
    end
end
end

