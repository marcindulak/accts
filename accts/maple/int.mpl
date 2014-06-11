# http://www.maplesoft.com/applications/view.aspx?SID=1561&view=html
restart;
p := 20:
f := n -> x^n;
result := NULL:  # Start with an empty exprseq.
for n from 0 to p do
  result := result, int(f(n),x) # Append an operand to the exprseq.
od:
result;  # Show the final exprseq.

# http://www.mapleprimes.com/questions/141346-Multithreading-Loops
restart;
p := 20:
f := n -> x^n;
CodeTools:-Usage([seq](int(f(n), x), n= 0..p, 1));

# TODO: multi-threading version ...
