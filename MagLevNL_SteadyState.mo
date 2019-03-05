model MagLevNL_SteadyState
  parameter Real R=2.41, L=15.03e-3, m=3.02e-3, k=17.31e-9, alpha=2.44, beta=1.12e-4, gamma=0.26;
  parameter Real d0 = 0.02 "Prescribed equilibrium position";
  parameter Real v(start=0.5, fixed=false) "Unknown equilibrium voltage accross the electromagnet";
  output Real e;
  Real i, d, d_der, f;
  constant Real g=9.81;
equation
  f = k*i/d^4;
  e = alpha + beta*1/d^2 + gamma*i;
  der(d) = d_der;
  m*der(d_der) = m*g - f;
  v = R*i + L*der(i);
initial equation
  d = d0;
  der(d) = 0;
  der(d_der) = 0;
  der(i) = 0;
end MagLevNL_SteadyState;
