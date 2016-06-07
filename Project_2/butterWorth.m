%%%%%%%%%Function for ButterWorth Filter%%%%%%%%%%%%%%%%%

function [butterH] = butterWorth(n,w,w0)

 s =(w0/1i*w);
if (n == 1) %%%% For Order One
   
    butterH = 1/(s+1);
else 
    if mod(n,2) == 0 %%% For Even Order
        butterH =1;
        for t = 1:(n/2)
            butterH = (1/(s^2 -(2*(s)*cos((((2*t+n-1)*pi*0.5)/n))) +1)).*butterH;
            
        end
    else
           butterH =  (1/(s+1)); %%% For Odd Order
        for t = 1:(n-1)/2
            butterH = (1/(s^2 -(2*(s)*cos((((2*t+n-1)*pi*0.5)/n))) +1)).*butterH;
        end
    end
end

%%_________________________End of Code_____________________________________