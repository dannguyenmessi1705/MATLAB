A = [1 -1i+3 -3; 4i+3 -4.5 -3i+2; 2i -3 1i+5];
ind = imag(A)==0;
B = A(ind);