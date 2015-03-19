function [v,lambda] = pot(A,tol,maxit)
% [v,lambda] = pot(A,tol,maxit) poišče lastni vektor
% za največjo (po absolutni vrednosti) lastno vrednost matrike A

v = rand(size(A,1),1);
v = v/norm(v);

for i=1:maxit
    w = A*v;
    lambda = v'*w; % v'*A*v
    if norm(w-lambda*v,'inf')<tol % A*v-lambda*v == 0
       break;
    end
    v = w/norm(w);
end
lambda = v'*A*v;
i
end
