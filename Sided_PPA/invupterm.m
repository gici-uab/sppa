
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function x=invupterm(A,y)


l=size(y,1);
x(l,1)=y(l)/A(l,size(A,2));


for i=size(y,1)-1:-1:1
    
   % x(i,1)=y(i);
    b=0;
    for j=i+1:size(y,1)
        b=b+A(i,j)*x(j);
        
    end
   
    x(i,1)=(1/A(i,i))*(y(i,1)-round(b));
    
end

end