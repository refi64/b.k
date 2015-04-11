p:,/0:`
/ remove non-valid chars
/ the interpreter is slightly slower without this
/ (it's pretty slow regardless, though...)
pm:{~7=("+";"-";"<";">";"[";"]";".")?x}'p
p:(pm[>pm]?0)#p@>pm
/ build the bracket map (bm)
bm:(#p)#0
l:()
{c:p@x;:[c="[";l,:x;c="]";{e:*-1#l;l::-1 _ l;bm[x]:e;bm[e]:x}[x]]}'!#p

/ program counter
pc:0
/ tape
t:,0
/ tape pointer
tp:0
/ a helper to increment the tape
it:{tp+:1;:[tp=#t;t,:0]}
/ the main loop (a glorious, 152-character line)
while[pc<#p;c:p@pc;:[c="+";t[tp]+:1;c="-";t[tp]-:1;c="<";tp-:1;c=">";it[];c="[";:[t[tp]=0;pc:bm@pc];c="]";:[~t[tp]=0;pc:bm@pc];c=".";`0:_ci t@tp];pc+:1]
