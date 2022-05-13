function fscale = time(f , time)
Ls= numel(f);


timescalerat = time;


M = 2048;

a = 256;

g = {'blackman',M};

newa = floor23(a/timescalerat);


Lsmallestnewa = dgtlength(1,newa,M);
Lsmallesta = dgtlength(1,a,M);
Lsmallest = dgtlength(1,Lsmallestnewa,Lsmallesta);
L = dgtlength(Ls,Lsmallest,M);
f = postpad(f,L);


[c,~,gnum] = dgtreal(f,g,a,M,'timeinv');


N = size(c,2);
newN = ceil(N*newa/Lsmallestnewa)*Lsmallestnewa/newa;
c = postpad(c,newN,0,2);


gl = numel(gnum);
[chatint] = pghi(abs(c),0.17954*gl^2,newa,M,'timeinv');


fscale = idgtreal(chatint,{'dual',g},newa,M,'timeinv');
fscale = fscale(1:floor(numel(f)*newa/a));


end
