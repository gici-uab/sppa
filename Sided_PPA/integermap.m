% Integer-to-integer mapping
% Forward
%-------------------------------------------------------------------------%
% Input:   X      -      nxd data matrix  to be projected
%                        (n samples and d dimensions)
%          plus   -      struct array that contains the 3 TERM's ( L U S) 
%                        and the permutation matrix P.
%                                  
%
% Output:  Y      -      nxd projected data matrix
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat

function [Y4]=integermap(X,plus)

X=X';
P=plus.P;
Y1=P'*X;
L=plus.L;
for i=1:size(X,2)
     Y2(:,i)=upterm(L',Y1(:,i));
end



U=plus.U;
for i=1:size(X,2)
     Y3(:,i)=lowterm(U',Y2(:,i));
end


S=plus.S;
for i=1:size(X,2)
     Y4(:,i)=upterm(S',Y3(:,i));
end


Y4=Y4';

end