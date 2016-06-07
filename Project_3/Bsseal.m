function I = Bsseal(b2) 

x = b2;
for k = 1:1000
    I(k) = (((1/factorial(k))*(x/2).^k)).^2;
end
I = 1 + sum(I);
end