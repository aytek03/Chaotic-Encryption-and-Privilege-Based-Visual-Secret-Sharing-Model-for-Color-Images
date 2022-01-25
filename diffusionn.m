function [ C ] = diffusionn( P, S, tip )

% Bit Manipulation Diffusion

%eðer resim binary image ise

if max(P(:))<2
    S(:,:) = mod(S(:,:),2);
end

[Q,W] = size(P);
C = zeros(Q,W);
switch tip
    case 'encrypt'
        for i = 1:Q
            for j = 1:W
                if i ==1 && j == 1
                    C(i,j) = bitxor(P(i,j),bitxor(P(Q,W),S(i,j)));
                elseif j == 1
                    C(i,j) = bitxor(P(i,j),bitxor(C(i-1,W),S(i,j)));
                else
                    C(i,j) = bitxor(P(i,j),bitxor(C(i,j-1),S(i,j)));
                end
            end
        end
    case 'decrypt'
        for i = Q:-1:1
            for j = W:-1:1
                if i == 1&& j == 1
                    C(i,j) = bitxor(P(i,j),bitxor(C(Q,W),S(i,j)));
                elseif j == 1
                    C(i,j) = bitxor(P(i,j),bitxor(P(i-1,W),S(i,j)));
                else
                    C(i,j) = bitxor(P(i,j),bitxor(P(i,j-1),S(i,j)));
                end
            end
        end
end
end