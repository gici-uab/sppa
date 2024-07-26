

% Sided Polynomial Principal Analysis (Sided PPA) 
% Inverse
%-------------------------------------------------------------------------%
% Input:   Tim   -      3-D transformed image
%          SI    -      side information
%          order -      polynomial order
%          k     -      the k last components used as predictor variables.
%
% Output:  im   -      recovered image
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat
%-------------------------------------------------------------------------%

function  [Tim SI]=G_PPA3D_Sided(im,order,k)

d=size(im,3);


aux_dat=im;
m=mod(d,k+1);

it=(size(im,3)/(k+1));
ss=size(im,3);
 if m>0
  Tim=im;
for i=1:it
    i
    
     ini=i;
     fini=ss-(i-1)*k;

   
    aux_dat = Tim(:,:,ini:fini);

    [Pim U1 W med] =G_PPA1D(aux_dat,order,k);

    SI(i).U=U1;
    SI(i).W=W;
    SI(i).med=med;
    
    zp=size(Pim,3);
    
    
%     ini=d-i*k+1;
%     fini=ini+k-1;
%     
%     if zp < k+1
%         
%         dif=k+1-zp;
%         ini=ini+dif;
%     end
    
   
    
    
    %Tim(:,:,i) = Pim(:,:,1);
      Tim(:,:,ini:fini) = Pim;
%     Tim(:,:,ini:fini) = Pim(:,:,zp-k+1:zp);
    
     
    
       
    aux_dat = Pim(:,:,2:zp-k);
    toc
end
 else

    
 h = waitbar(0,'Please wait...');

for i=1:it
   waitbar(i/it)

   
    
    [Pim U1 W med] =G_PPA1D(aux_dat,order,k);

    SI(i).U=U1;
    SI(i).W=W;
    SI(i).med=med;
    
    zp=size(Pim,3);
    
    
    ini=d-i*k+1;
    fini=ini+k-1;
    
    if zp < k+1
        
        dif=k+1-zp;
        ini=ini+dif;
    end
    
%     ini=d-i*k-1;
%     fini=ini+k-1;
    
    %[ini fini]
    
    
    Tim(:,:,i) = Pim(:,:,1);
    
    Tim(:,:,ini:fini) = Pim(:,:,zp-k+1:zp);
    
    
    
       
    aux_dat = Pim(:,:,2:zp-k);
    
end
close(h) 


 end
end

