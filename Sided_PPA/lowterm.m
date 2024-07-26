

%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%

function y=lowterm(A,x)



y(1,1)=A(1,1)*x(1,1);

for i=2:size(x,1)
    
    y(i,1)=A(i,i)*x(i);
b=0;
    for j=1:i-1
        b=b+A(i,j)*x(j);
        
    end


   
    y(i,1)=y(i,1)+round(b);
    
end

end