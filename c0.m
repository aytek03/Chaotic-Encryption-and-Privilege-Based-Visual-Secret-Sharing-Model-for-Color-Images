function [ x ] = c0( n )

%n rakamý için genelleþtirilmiþtir.
% beyaz için collector matrix oluþturma = CO

%C0 için CL0 ve CR0 olarak sol-sað kýsýmlarýna bölünüyor.
%n rakamý satýr sayýsý. pay sayýsý.

m1 = n *(n-1)/2; % sol tarafýn sütun sayýsý

x1 = ones (n, m1); % sol matris oluþturuldu. 

m2 = n *(n-1)*(n-2)/2;  % sað tarafýn sütun sayýsý

x2 = logical(zeros(n, m2)); % sað matris oluþturuldu. 

a = randperm(m1); 
%1 ile m1 arasýndaki rakamlarý (rastgele oluþturuyor)1'er kez kullanýp array'e atýyor.

for i = 1:n 
    for j = 1 : (n-i)
    
    x1(i,a(1)) = 0;
    
    a(1) = []; %eleman siliyoruz
    end
end
x1 = logical (x1); % sýfýrlarý logical zero'lara çeviriyoruz

x = [x1,x2];
end