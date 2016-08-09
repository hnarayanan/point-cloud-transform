Written by Harish Narayanan in 2011 and released into the public domain.
See LICENSE for details.

Given two files containing your sets of points (input.csv and
output.csv), the linked script computes the transformation parameters
(R: rotation matrix, T: translation vector, c: scaling factor) that
relates the points via:

y_i = c*R*x_i + t

The archive I’ve linked to also contains the paper that describes the
algorithm I’ve implemented, and can be run from the command line as:

octave transformation.m

One can also generate fake data via octave generate_data.m to test the
script.
