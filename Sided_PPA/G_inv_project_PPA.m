
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%


 
function [im] = G_inv_project_PPA(Pim,U1, W,order,k,med)


%[U ss ds]=svd(U1);
U=U1;
clear   U1 ss ds
tiles=1;
% 
% 
 [y x z]=size(Pim);


Pim=reshape(Pim,y*x,z);


    
     F=split_matrix(Pim,tiles);
   
     for i=1:tiles
         
         M=F(:,:,i);
         
         V=[];

         for j =1:order
             V = [V, M(:,1).^j  M(:,end-k+1:end).^j];
         end
          V=[ones(size(V,1),1) V];
         Pim=reshape(Pim,y*x,z);
        w=W(:,:,i);
       
         M(:,2:end-k) = M(:,2:end-k) +round( V*w);
         
         F(:,:,i)=M;
         
     end
     
     Pim=cat_matrix(F);
     
     
     Pim=reshape(Pim,y,x,z);
      im=inv_Project(Pim,U,med);
 
end