function F=split_matrix(A,n)




[y x]=size(A);

if mod(y,n)~=0
    disp('Error')
end

s=y/n;
d=s*ones(1,n);


f=mat2cell(A,d,x);

parfor i=1:n
    
    F(:,:,i)=f{i};
end

end

