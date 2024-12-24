% Common Emitter Amplifier with Re
% Modifiers
k = 1000;
m = 10^-3;
u = 10^-6;
% Constrains
Vcc=9;
B= 100;
Rs= 50;
Vce=4.5;
Icq= 1*m;
Ibq = 10*u;
% INSERT GAIN HERE ====>
A_v = 70;
% RE and RC
Re = (Vcc-Vce)/((A_v+1)*Icq);
Rc = A_v*Re;
% Thevenin values
Rth=0.1*(B+1)*Re;
Vth=(Ibq*Rth)+0.7+((B+1)*Ibq*Re);
% R1 and R2
R1 = Rth*(Vcc/Vth);
R2 = Rth*(Vcc/(Vcc-Vth));
% Resistances
rpi= (B*0.026)/Icq;
Rib= rpi + (1+B)*Re;
Ri= (Rth*Rib)/(Rth+Rib);
% Actual gain
Af = (-B*Rc)/(rpi+(B+1)*Re)*(Ri/(Ri+Rs));
% DISPLAY
fprintf('\nResistor w/ voltage gain A_v = %.1f:\n', A_v);
fprintf('R1 = %.2f Ohms\n', R1);
fprintf('R2 = %.2f Ohms\n', R2);
fprintf('RC = %.2f Ohms\n', Rc);
fprintf('RE = %.2f Ohms\n', Re);
fprintf('A_v = %.2f\n', Af);

% Practical Resistor Values(Utilize practical resistor values)
Rp1 = 16800 ;
Rp2 = 1780;
RpC = 4300;
RpE = 100;
Old_gain = Af;

% Practical RC calculation
Rpc = RpC;  % Replace Rc with practical resistor value RpC

% Practical Thevenin values
RPth = 0.1 * (B + 1) * RpE;
VPth = (Ibq * RPth) + 0.7 + ((B + 1) * Ibq * RpE);

% Practical resistances
rPpi = (B * 0.026) / Icq;
RPib = rPpi + (1 + B) * RpE;
RpI = (RPth * RPib) / (RPth + RPib);
RL = 1428.44; 
% Practical actual gain
APf = (-B *  RpC) / (rPpi + (B + 1) * RpE) * (RpI / (RpI + Rs));

% DISPLAY
fprintf('\n Real Resistor w/ voltage gain A_v = %.1f:\n', Old_gain);
fprintf('Rp1 = %.2f Ohms\n', Rp1);
fprintf('Rp2 = %.2f Ohms\n', Rp2);
fprintf('RpC = %.2f Ohms\n', RpC);
fprintf('RpE = %.2f Ohms\n', RpE);
fprintf('Ri = %.2f Ohms\n', RpI);
fprintf('New A_v gain = %.2f\n', APf);

