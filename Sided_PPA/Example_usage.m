
% Sided Polynomial Principal Analysis (Sided PPA) 
% Example usage

%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


load('3dimage_128x128x64.mat')

% Forward transform

[Tim SI]=G_PPA3D_Sided(im,2,0);

% Inverse transform

rec=G_inv_PPA3D_Sided(Tim,SI,2,0);
