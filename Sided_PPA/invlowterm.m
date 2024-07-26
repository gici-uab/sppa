
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function x=invlowterm(A,y)



x(1,1)=y(1)/A(1,1);


for i=2:size(y,1)
    ies=i;
   % x(i,1)=y(i);
    b=0;
    for j=1:i-1
          b=b+A(i,j)*x(j);
    end
   
    x(i,1)=(1/A(i,i))*(y(i,1)-round(b));
    
end

end