
The software was downloaded from its github repository
https://github.com/PacificBiosciences/DAZZ_DB

::

  $ module add gcc
  $ make
  $ make install
  $ find . -perm /a+x -exec cp {} ../amd64_co7/bin \;
