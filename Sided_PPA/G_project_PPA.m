
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%




function [Pim W,med] = G_project_PPA(im,U1,order,k)

%[U ss ds]=svd(U1);

U=U1;
clear   U1 ss ds
tiles=1;


    
[Pim,med]=Project(im,U);
[y x z]=size(Pim);



    
     Pim=reshape(Pim,y*x,z);
    

    
     F=split_matrix(Pim,tiles);
   W=[];
     for i=1:tiles
         
         M=F(:,:,i);
         V=[];
         
         

         for j =1:order
             V = [V, M(:,1).^j, M(:,end-k+1:end).^j];
         end
         V=[ones(size(V,1),1) V];
         Pim=reshape(Pim,y*x,z);
         w=pinv(V)*M(:,2:end-k);
         
        
         
         W(:,:,i)=w;
         M(:,2:end-k) = M(:,2:end-k) - round( V*w);

         F(:,:,i)=M;
         
     end
     
     Pim=cat_matrix(F);
     Pim=reshape(Pim,y,x,z);

         
         
     
     

     
end


