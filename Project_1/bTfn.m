function B = bTfn(fOrder,wo)
if (mod(fOrder,2)~=0)
   % for k = 1:((fOrder-1)/2)
    B = (1+s)*(s^2 + 2*s*cos(((2*k + 2*fOrder -1)/(2*fOrder)) + 1 ));    
    %end
else
    for k = 1:(fOrder/2)
     B = (s^2 + 2*s*cos(((2*k + 2*fOrder -1)/(2*fOrder)) + 1 ));
    end
end
    