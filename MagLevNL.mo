model MagLevNL
  parameter Real R=2.41, L=15.03e-3, m=3.02e-3, k=17.31e-9, alpha=2.44, beta=1.12e-4, gamma=0.26;
  input Real v;
  output Real e;
  parameter Real i0, d0, d_der0;
  Real i(start=i0,fixed=true), d(start=d0,fixed=true), d_der(start=d_der0,fixed=true), f;
  constant Real g=9.81;
equation
  f = k*i/d^4;
  e = alpha + beta*1/d^2 + gamma*i;
  der(d) = d_der;
  m*der(d_der) = m*g - f;
  v = R*i + L*der(i);
end MagLevNL;
