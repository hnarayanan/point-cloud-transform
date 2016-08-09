# Determine transformation parameters (R: rotation matrix, T:
# translation vector, c: scaling factor) given two sets of points {x_i}
# and {y_i} (i = 1, 2, ..., n), in m-dimensional space.
#
# y_i = c*R*x_i + t

# Read the point data
x = csvread("input.csv");
y = csvread("output.csv");
[n, m] = size(x);

# Define means, standard deviations and covariances
mu_x = mean(x);
mu_y = mean(y);
sigma_x_squared = 0;
sigma_y_squared = 0;
Sigma_xy = 0;
for i = 1:n
  sigma_x_squared += sumsq(x(i, :) - mu_x)/n;
  sigma_y_squared += sumsq(x(i, :) - mu_x)/n;
  Sigma_xy += (y(i, :) - mu_y)'*(x(i, :) - mu_x) / n;
endfor

# Take the singular value decomposition of the covariance matrix
[U, D, V] = svd(Sigma_xy);

if(det(Sigma_xy) >= 0)
  S = eye(m);
else
  S = diag([ones(m - 1, 1)', -1]);
endif

# Compute the transformation parameters
R = U*S*V'
c = 1/(sigma_x_squared)*trace(D*S)
t = mu_y' - c*R*mu_x'