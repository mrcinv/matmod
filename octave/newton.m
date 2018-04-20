function x = newton (F, JF, x0, tol, maxit, par)
	## x = newton (F, JF, x0, tol, maxit)
	## Finds the approximate solution to the (system) of equations
	## F(x)=0
	## using Newtons method.
  ##
	## JF - the Jacobian matrix of F,
	## tol - the desired accuracy
	## maxit - the maximum number of iterations allowed
	## par - optional additional parameters that can be passed to
	## the functions F and JF
	k = 0;                        # iteration counter
	err = 2*tol;                  # current error
	while k < maxit && err>tol
		x = x0 - feval (JF, x0, par) \ feval (F, x0, par); # Newtons iteration
		err = norm (x - x0);        # computing the current error
		x0 = x;                     # overwriting the previous approximation
		k = k + 1;                  # iterating counter
	end
