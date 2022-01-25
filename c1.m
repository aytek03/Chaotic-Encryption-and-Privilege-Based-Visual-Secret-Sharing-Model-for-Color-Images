function [ x ] = c1( n )

%n rakam� i�in genelle�tirilmi�tir.
% siyah i�in collector matrix olu�turma = C1

m = n*(n-1)*(n-1)/2; % s�tun say�s�

x = (zeros(n, m)); % matris olu�turuldu. hepsi s�f�r.

a = randperm(m); 

%1 ile m1 aras�ndaki rakamlar� (rastgele olu�turuyor)1'er kez kullan�p array'e at�yor.

for i = 1:n 
    for j = 1 : (n*n - 3*n + 2*i) / 2
    
    x(i,a(1)) = 1;
    
    a(1) = []; %eleman siliyoruz
    end
end
x = logical (x); % s�f�rlar� logical zero'lara �eviriyoruz
end