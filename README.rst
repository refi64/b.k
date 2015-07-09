b.k
===

A Brainf*** interpreter written in K. You know, the language that goes like this::
   
   + increment value at tape pointer
   - decrement value at tape pointer
   < decrement tape pointer
   > increment tape pointer
   [ jump to the matching right bracket is the value at the tape pointer is 0
   ] jump to the matching left bracket is the value at the tape pointer is not 0
   . print the value at the tape pointer
   , read a character from the screen

This interpreter is by no means fast...but it works. Pretty well, too, except that I didn't implement the ``,`` character because, as far as I know, reading a single character isn't possible with K2 unless you resort to C extensions. This is written for `Kona <https://github.com/kevinlawler/kona>`_ and K2, NOT kdb+ 3. It will NOT run under kdb+ 3 (if you figure out how without using q, let me know!).

The whole thing is (without comments and blank lines) 357 characters (336 if you remove unnecessary newlines).
