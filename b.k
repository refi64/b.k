p:,/0:`"/dev/stdin" / read the input
p:?["+-<>[].";]'p / give each char it's character id
p@:&~7=p / filter out non-valid chars

/ build the bracket map (bm)
bm:(#p)#0 / generate an empty set of cells
l:() / left stack
{
  c:p@x / get the current op
  / if it's a left bracket, add it to the left stack
  / if it's a right bracket, pop one off the left stack and assign the brackets
  :[c=4;l,:x;c=5;{e:*-1#l;l::-1_ l;bm[x]:e;bm[e]:x}x]
}'!#p; / for each index in the program

pc:0 / program counter
t:,0 / tape
tp:0 / tape pointer

/ dispatch functions
oi:{t[tp]+:1} / +
od:{t[tp]-:1} / -
of:{tp-:1} / <
ob:{tp+:1;:[tp=#t;t,:0]} / >
ol:{:[t[tp]=0;pc::bm@pc]} / [
or:{:[~t[tp]=0;pc::bm@pc]} / ]
op:{`0:_ci t@tp} / .

disp:(oi;od;of;ob;ol;or;op) / dispatch table
while[pc<#p;disp[p@pc][];pc+:1] / main loop
