function [ S1 , S2 ] = Chaotic_Matrix( A , img )

%img = imread('lena_gray_256.tif');
%img = rgb2gray(img);
%img = double(img);
%img = [1 2 ; 3 4];


[M,N] = size(img);

S1 = zeros(M+2,N+2);
S2 = zeros(M+2,N+2);


x1 = A(1);
y1 = A(2);
u1 = A(3);

x2 = A(4);
y2 = A(5);
u2 = A(6);



for m = 1:(M+2)
    for n = 1:(N+2)
        x1 = sin(pi*u1*(y1+3)*x1*(1-x1));
        y1 = sin(pi*u1*(x1+3)*y1*(1-y1));
        S1(m,n) = floor(mod((x1+y1)*2^(30),256));
    end

end


for m = 1:(M+2)
    for n = 1:(N+2)
        x2 = sin(pi*u2*(y2+3)*x2*(1-x2));
        y2 = sin(pi*u2*(x2+3)*y2*(1-y2));
        S2(m,n) = floor(mod((x2+y2)*2^(30),256));
    end

end

%S = [S1 S2] ;
%[S1 , S2 ] = Chaotic_Matrix( A );

end