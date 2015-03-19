function [Q,L,i] = simpot(A,m,tol,maxit)
% [Q,L] = pot(A,m,tol,maxit) poišče m lastnih vektorjev
% za m največjih (po absolutni vrednosti) lastnih vrednosti matrike A

Q = rand(size(A,1),m);
[Q, R] = qr(A*Q,'0');

for i=1:maxit
    Q1 = A*Q;
    L = diag(diag(Q'*Q1)); % Q'*A*Q
    if norm(Q1-Q*L,'fro')<tol % A*v-lambda*v == 0
       break;
    end
    [Q, R] = qr(Q1,'0');
end
end
