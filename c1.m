function [ x ] = c1( n )

%n rakamý için genelleþtirilmiþtir.
% siyah için collector matrix oluþturma = C1

m = n*(n-1)*(n-1)/2; % sütun sayýsý

x = (zeros(n, m)); % matris oluþturuldu. hepsi sýfýr.

a = randperm(m); 

%1 ile m1 arasýndaki rakamlarý (rastgele oluþturuyor)1'er kez kullanýp array'e atýyor.

for i = 1:n 
    for j = 1 : (n*n - 3*n + 2*i) / 2
    
    x(i,a(1)) = 1;
    
    a(1) = []; %eleman siliyoruz
    end
end
x = logical (x); % sýfýrlarý logical zero'lara çeviriyoruz
end