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


function  [im]=G_inv_PPA3D_Sided(Tim,SI,order,k)

d=size(Tim,3);


it=(size(Tim,3)/(k+1));
it=floor(it);
m=mod(d,k+1);


if m>0
    


   inii=d-it*k+1-1;

    j=0;
    for i=it-1:-1:0

        
    
     ini=i+1;
     q=d-i*(k+1);
    fini=ini+q-1;
    
   
    
    
    aux_dat=Tim(:,:,ini:fini);
    %aux_dat=cat(3,Tim(:,:,inii-j:ini-1),aux_dat);
    U1=SI(i+1).U;
    W=SI(i+1).W;
    med=SI(i+1).med;
%    indx=SI(i).Index;
    
    im1=G_inv_PPA1D(aux_dat,U1,W,order,k,med);
    Tim(:,:,ini:fini)=im1;
    %Tim(:,:,inii-j)=im1(:,:,1);
    
    j=j+1;
end

im=Tim;



else

   inii=d-it*k+1-1;

    j=0;
    for i=it:-1:1
   
    
     ini=d-i*k+1;
    fini=ini+k-1;

    
    aux_dat=Tim(:,:,ini:fini);
    aux_dat=cat(3,Tim(:,:,inii-j:ini-1),aux_dat);
    U1=SI(i).U;
    W=SI(i).W;
    med=SI(i).med;

    
    im1=G_inv_PPA1D(aux_dat,U1,W,order,k,med);
    Tim(:,:,inii-j+1:fini)=im1(:,:,2:end);
    Tim(:,:,inii-j)=im1(:,:,1);
    
    j=j+1;
end

im=Tim;
end
    
    
    
    
    
end


