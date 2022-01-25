function [ x ] = c0( n )

%n rakam� i�in genelle�tirilmi�tir.
% beyaz i�in collector matrix olu�turma = CO

%C0 i�in CL0 ve CR0 olarak sol-sa� k�s�mlar�na b�l�n�yor.
%n rakam� sat�r say�s�. pay say�s�.

m1 = n *(n-1)/2; % sol taraf�n s�tun say�s�

x1 = ones (n, m1); % sol matris olu�turuldu. 

m2 = n *(n-1)*(n-2)/2;  % sa� taraf�n s�tun say�s�

x2 = logical(zeros(n, m2)); % sa� matris olu�turuldu. 

a = randperm(m1); 
%1 ile m1 aras�ndaki rakamlar� (rastgele olu�turuyor)1'er kez kullan�p array'e at�yor.

for i = 1:n 
    for j = 1 : (n-i)
    
    x1(i,a(1)) = 0;
    
    a(1) = []; %eleman siliyoruz
    end
end
x1 = logical (x1); % s�f�rlar� logical zero'lara �eviriyoruz

x = [x1,x2];
end