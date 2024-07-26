
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%



function [Pim U1 W med] = G_PPA1D(im,order,k)




%%  PCA matrix 

U=PCA_matrix(im);
%U1=[U(:,1) U(:,end-k+1:end)];
U1=U;
clear  U
%% 

[Pim W med] = G_project_PPA(im,U1,order,k);



end












