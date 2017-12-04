
function [S]=entropi(CvA,T,Na,Nb,dimA1,dimA2,kb)




for i = 1:(length(T)-1)
    etellerandet = CvA./T;
    deltaS(i) = trapz(T(i:(i+1)),etellerandet(i:(i+1)));
     
     
end
S(length(deltaS)+1)= kb*(-Na*log(Na)-Nb*log(Nb)+dimA1*dimA2*log(dimA1*dimA2)-(dimA1*dimA2-Na-Nb)*log(dimA1*dimA2-Na-Nb));

for j = length(deltaS):-1:1
    S(j)= S(j+1)-deltaS(j);
end
end