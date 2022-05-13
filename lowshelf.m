function [b a] = lowshelf(G, Fc, Fs)
% Η συνάρτηση lowself υπολογίζει του παράγωντες b και a
% έτσι ώστε να υλοποιείται ένα 2ου βάθμού lowselft φίλτρο
  Q = 1;
  A = 10^(G/40);
  w0=2*pi*Fc/Fs;
  alpha = sin(w0)/2*Q;

  b0 =    A*( (A+1) - (A-1)*cos(w0) + 2*sqrt(A)*alpha );
  b1 =  2*A*( (A-1) - (A+1)*cos(w0)                   );
  b2 =    A*( (A+1) - (A-1)*cos(w0) - 2*sqrt(A)*alpha );
  a0 =        (A+1) + (A-1)*cos(w0) + 2*sqrt(A)*alpha;
  a1 =   -2*( (A-1) + (A+1)*cos(w0)                   );
  a2 =        (A+1) + (A-1)*cos(w0) - 2*sqrt(A)*alpha;

  b = [b0 b1 b2]/a0;
  a = [a0 a1 a2]/a0;
