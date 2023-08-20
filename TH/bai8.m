a = 6;
b = 8;
A  = randi([-2 12], 3, 5);
TMP = (A(:))';
GTa = a*ones(1,length(TMP));
CMPGTa = TMP > GTa;
B = TMP(CMPGTa);
%%%%%%%%%%%%%%
LEb = b*ones(1, length(TMP));
CMPLEb = TMP <= LEb;
C = TMP(CMPLEb);