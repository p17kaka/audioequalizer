function [b a] = peaking(G, Fc, Fs)
% Η συνάρτηση peaking υπολογίζει του παράγωντες b και a
% έτσι ώστε να υλοποιείται ένα 2ου βάθμού peaking φίλτρο
  Q = 1;
  A = 10^(G/40);
  w0=2*pi*Fc/Fs;
  alpha = sin(w0)/2*Q;

  b0 =   1 + alpha*A
  b1 =  -2*cos(w0)
  b2 =   1 - alpha*A
  a0 =   1 + alpha/A
  a1 =  -2*cos(w0)
  a2 =   1 - alpha/A

  b = [b0 b1 b2]/a0;
  a = [a0 a1 a2]/a0;
