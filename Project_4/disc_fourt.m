function X = disc_fourt(x,n,N)

for k = 0:1:N-1

    X(k+1) = sum(x.*exp(-j*(2.*pi.*k.*n)./N));

end