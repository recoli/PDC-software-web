

The tool was installed using::

  module swap PrgEnv-cray PrgEnv-gnu
  wget http://www.cmake.org/files/v3.0/cmake-3.0.2.tar.gz
  tar xvzf cmake-3.0.2
  cd cmake-3.0.2
  ./bootstrap --prefix=/pdc/vol/cmake/3.0.2 && make && make install
