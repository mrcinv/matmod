function [t, s, se_sekata] = presek_daljic (A, B, C, D)
  ## Funkcija vrne parametre t in s presečišča daljic AB in CD
 
  ## sistem enačb za t in s
 M = [B-A C-D];
 b = [C-A];

 if abs (det (M)) < 10*eps
    t = NaN; s = NaN;
    se_sekata = false;
    return
 end
 
 ts = M\b;                      # rešimo sistem
 ## preverimo, če je presečišče na obeh daljicah
 if all (0 <= ts) & all (ts <= 1)
   t = ts(1);
   s = ts(2);
   se_sekata = true;
 else
   t = NaN;
   s = NaN;
   se_sekata = false;
 end
endfunction

%!test
%! [t,s, se_sekata] = presek_daljic ([0;0], [1;1], [0; 1], [1;0]);
%! assert ([t,s, se_sekata], [0.5, 0.5, true], eps)
