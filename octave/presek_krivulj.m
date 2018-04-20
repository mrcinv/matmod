function P = presek_krivulj (p, pdot, intp, q, qdot, intq, h)
  ## funkcija poišče vsa presečišča dveh parametrično podanih krivulj
  P = [];
  ## poligonske črte
  t = intp(1):h:intp(2);
  s = intq(1):h:intq(2);
  ## presečišča poligonov
  for i = 1:length (t)-1
    for j = 1:length (s)-1
    ## zaporedni točki na krivulji p
      A = p(t(i));
      B = p(t(i+1));
      ## zaporedni točki na krivulji q
      C = q(s(j));
      D = q(s(j+1));
      [t_temp, s_temp, se_sekata] = presek_daljic (A, B, C, D);
      if se_sekata  
      ## Newtonova metoda
      ## začetni približek
          t0 = t(i) + t_temp*h;
          s0 = s(j) + s_temp*h;
          F = @(t_vektor, par) [p(t_vektor(1)) - q(t_vektor(2))];
          JF = @(t_vektor, par) [pdot(t_vektor(1)), -qdot(t_vektor(2))];
          t_vektor = newton(F, JF, [t0; s0], 1e-10, 100, []);
          P = [P p(t_vektor(1))]; % P = q(s);
      end
    end
  end
endfunction



%!demo
%! intp = [0, 2*pi]; t = linspace(0, 2*pi);
%! intq = [-2,2]; s = linspace(-2,2);
%! p = @(t) [2*cos(t)+1; sin(t)]; pdot = @(t) [-2*sin(t); cos(t)];
%! q = @(s) [s.^3+s+1; s]; qdot = @(s) [3*s.^2+1; s.^0];
%! P = presekKrivulj(p, pdot, intp, q, qdot, intq, 0.1)
%! p1 = p(t);
%! plot(p1(1,:),p1(2,:))
%! hold on
%! p2 = q(s);
%! plot(p2(1,:), p2(2,:))
%! plot(P(1,:),P(2,:),'*')
%! hold off
