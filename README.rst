b.k
===

A BF interpreter written in K. By BF, I mean that language that goes like this::
   
   + increment value at tape pointer
   - decrement value at tape pointer
   < decrement tape pointer
   > increment tape pointer
   [ jump to the matching right bracket is the value at the tape pointer is 0
   ] jump to the matching left bracket is the value at the tape pointer is not 0
   . print the value at the tape pointer
   , read a character from the screen

We all know what this language is *really* called. ;)

This interpreter is by no means fast...but it works. Pretty well, too, except that I didn't implement the ``,`` character because, as far as I know, reading a single character isn't possible with K unless you resort to C extensions. It's written for `Kona <https://github.com/kevinlawler/kona>`_, NOT kdb+ 3.0. It will NOT run under kdb+ 3.0 (if you figure out how without using q, let me know!).

The whole thing is (without comments and blank lines) 298 characters (289 if you remove all the newlines).
