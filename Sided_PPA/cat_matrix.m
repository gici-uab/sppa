
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


function A=cat_matrix(F)


for i=1:size(F,3)
    
    f{i,1}=F(:,:,i);
    
end

A=cell2mat(f);

end