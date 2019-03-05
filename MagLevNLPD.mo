model MagLevNLPD
  // Parameters MagLev
  parameter Real R=2.41, L=15.03e-3, m=3.02e-3, k=17.31e-9, alpha=2.44, beta=1.12e-4, gamma=0.26;
  // Equilibrium point (values actually depend on parameters above!)
  parameter Real v_e=0.659957, e_e=2.791198;
  // IC defaulting to values at equilibrium point
  parameter Real d0=0.02, d_der0=0, i0=0.273841;
    // Variables MagLev
  Real d(start=d0, fixed=true), d_der(start=d_der0, fixed=true), i(start=i0, fixed=true), v, f, e;
  constant Real g=9.81;
  // Parameters PD
  parameter Real Kp=15, Td=0.05;
  parameter Real du_set=0 "Desired setpoint OP delta voltage of PD controller";
  // Variables PD
  Real u,y;
equation
  u = du_set - (e - e_e) "Input to the PD controller (negative feedback loop)";
  y = Kp*(u + Td*der(u)) "PD controller equation";
  v = y + v_e "Controller output to the plant";
  // Nonlinear MagLev plant equations
  f = k*i/d^4 "(2.1) force applied by the electromagnet on the levitating magnet";
  e = alpha + beta*1/d^2 + gamma*i "(2.2) voltage across the Hall effect sensor";
  der(d) = d_der;
  m*der(d_der) = m*g - f "(2.3) Newton's second law that";
  v = R*i + L*der(i) "(2.4) Kirchhoff's voltage law";
end MagLevNLPD;
