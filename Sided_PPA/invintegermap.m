% Integer-to-integer mapping
% Inverse
%-------------------------------------------------------------------------%
% Input:   Y      -      nxd projected data matrix
%                        (n samples and d dimensions)
%          plus   -      struct array that contains the 3 TERM's ( L U S) 
%                        and the permutation matrix P.
%                                  
%
% Output:  X      -      nxd original data matrix
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat

function [Y4]=invintegermap(X,plus)


 

S=plus.S;

parfor i=1:size(X,1)
    
   Y1(i,:)=invupterm(S',X(i,:)')'; 
   
    
end

U=plus.U;

parfor i=1:size(Y1,1)
    
     Y2(i,:)=invlowterm(U',Y1(i,:)')';

end

L=plus.L;

parfor i=1:size(Y2,1)
     Y3(i,:)=invupterm(L',Y2(i,:)')';
end
P=plus.P;
Y4=Y3*inv(P);

end


