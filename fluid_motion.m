Rho = input('please enter the fluid density [kg/m^3] = ');
Muo = input('Please enter fluid dynamic viscosity [(kg/m.s] = ');
v = input('Please enter the velocity of fluid [m/s] = ');
D = input('Please enter the diameter of the pipe [m] = ');
L = input('Please enter the length of the pipe [m] = ');
E = input('Please enter the roughness of the pipe [m] = ');
g = 9.81;
Re = Rho*v*D/Muo;
if(Re < 2500)
	f = 64/Re;
	hL = f*(L/D)*(v^2/(2*g));
	fprintf('Laminar flow \nFriction head loss hL= %g \n', hL);
elseif(Re >= 4000)
	if(((E/D)*Re^0.9) <= 31)
		f = 0.25*(log(5.74/Re^0.9))^-2;
		hL = f*(L/D)*(v^2/(2*g));
		fprintf('Smooth turbulent flow \nFriction head loss hL= %g \n', hL);
    elseif(((E/D)*Re^0.9) >= 448)
		f = 0.25*(log((E/D)/3.7))^-2;
		hL = f*(L/D)*(v^2/(2*g));
		fprintf('Fully rough turbulent flow \nFriction head loss hL= %g \n', hL);
	else 
		f = 0.25*(log((E/D)/3.7 + log(5.74/Re^0.9)))^-2;
		hL = f*(L/D)*(v^2/(2*g));
		fprintf('Transient rough turbulent flow \nFriction head loss hL= %g \n', hL);
	end
else
	fprintf('Uncertain critical Zone');
end
