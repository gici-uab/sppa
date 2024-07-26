
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function y=upterm(A,x)


l=size(x,1);
y(l,1)=A(l,size(A,2))*x(l,1);

for i=size(x,1)-1:-1:1
    
    y(i,1)=A(i,i)*x(i);
b=0;
    
    for j=i+1:size(x,1)
        b=b+A(i,j)*x(j);
        
    end

   
    y(i,1)=y(i,1)+round(b);
    
end

end