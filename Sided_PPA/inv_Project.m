

%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%

function [im]=inv_Project(im,u,med)

[y x z]=size(im);


 


 plus=N_plus_PV(u);
% % 
% % 
% 


 parfor i=1:y

% 
     A=im(i,:,:);
     A=reshape(A,x,z);
% 
     A=invintegermap(A,plus);
    % A=A*u';
     im(i,:,:)=A;
% 
%    
 end
 
 im=reshape(im,y*x,z);
im=im+repmat(med,size(im,1),1);
im=reshape(im,y,x,z);

end




