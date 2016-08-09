# Define some fake data to check the algorithm

# Dimensionality of the space
m = 3;

# Number of observations
n = 100;

# Create some random set of points {x_i}
x = rand(n, m);

# Construct transformed set of points {y_i}
theta = 0.2;
psi = 0.42;
phi = -1.9;
R_test = [ cos(theta)*cos(psi), -cos(phi)*sin(psi) + sin(phi)*sin(theta)*cos(psi),  sin(phi)*sin(psi) + cos(phi)*sin(theta)*cos(psi);
	   cos(theta)*sin(psi),  cos(phi)*cos(psi) + sin(phi)*sin(theta)*sin(psi), -sin(phi)*cos(psi) + cos(phi)*sin(theta)*sin(psi);
	  -sin(theta)        ,   sin(phi)*cos(theta)                             ,  cos(phi)*cos(theta)]

c_test = 2.3
t_test = [4, 3, -2.5]

y = zeros(n, m);

for i = 1:n
  y(i, :) = c_test*R_test*x(i, :)' + t_test';
endfor

csvwrite("input.csv", x)
csvwrite("output.csv", y)