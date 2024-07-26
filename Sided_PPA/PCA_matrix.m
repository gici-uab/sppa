function [u]=PCA_matrix(im)

[y x z]=size(im);

im=reshape(im,y*x,z);
C=cov(im);
%  
% C=zeros(z,z);
% %disp('Covariance Matrix :')
%  parfor i=1:y
%      A=im(i,:,:);
%      A=reshape(A,x,z);
%      A=A-repmat(mean(A),size(A,1),1);
%      c=cov(A);
%       C=C+c;
% % %     
% % %   
%  end
% 
%  C=C/(x*y-1);

[u v]=eig(C);
u=fliplr(u);



end




