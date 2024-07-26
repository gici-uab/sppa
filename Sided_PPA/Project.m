
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%

function [im,med]=Project(im,u)

[y x z]=size(im);


 


plus=N_plus_PV(u);

im=reshape(im,y*x,z);
med=fix(mean(im,1));
im=im-repmat(med,size(im,1),1);
im=integermap(im,plus);

im=reshape(im,y,x,z);


end




