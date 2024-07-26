% PLUS factorization  with quasi-complete pivoting
%-------------------------------------------------------------------------%
% Input:   A      -      orthogonal matrix
%          
%
% Output:  plus   -      struct array that contains the 3 TERM's ( L U S) 
%                        and the permutation matrix P.
%-------------------------------------------------------------------------%
% naoufal amrani,  Group on Interactive Coding of Images
% webpage: www.gici.uab.es
% email: naoufal.amrani@deic.uab.cat


function  [plus]= N_plus_PV(A)


AA=A;

n=size(A,1);
d=ones(1,n);

P=1:n;
%P2=1:n;

e=eye(n);
S=e;

for i=1:n-1
   
        M=[];
        
        for j=i+1:n
           
            M(:,j-i) = abs((A(i:n,i)-1)./A(i:n,j));
        end
  
        [kk hh] = find(M==min(M(:)));
        
            k=kk(1);
            h=hh(1);
           

            k=k+i-1; 
            h=h+i;
       
        aux=P(i);   P(i)=P(k);  P(k)=aux;

        aux_w=A(i,:);   A(i,:)=A(k,:);  A(k,:)=aux_w;
        

 
    
    s = (A(i,i) - 1)/A(i,h);
    
    A(1:n,i)= A(1:n,i) - s*A(1:n,h);
    
  
    
    S(h,i)=s;
    
  
    k=(i+1):n;
    A(k,i)=A(k,i)/A(i,i);
    A(k,k)=A(k,k)-kron(A(k,i),A(i,k));
    
    
    
end

L=eye(n)+tril(A,-1);
U=triu(A);
%S=eye(n)+[zeros(n-1,1);1]*[S,0];
e=eye(n);
P=e(:,P);



plus.P=P;
plus.L=L;
plus.U=U;
plus.S=S;
end
