LAMMPS has been built with the following packages:  

ASPHERE, BODY, CLASS2, COLLOID, COMPRESS, CORESHELL, DIPOLE, GRANULAR, KSPACE, MANYBODY, MC, MEAM, MISC, MOLECULE, MPIIO, OPT, PERI, 
POEMS, QEQ, REPLICA, RIGID, SHOCK, SNAP, SRD, USER-AWPMD, USER-CGDNA, USER-CGSDK, USER-DIFFRACTION, USER-DPD, USER-DRUDE, USER-EFF, 
USER-FEP, USER-LB, USER-MANIFOLD, USER-MEAMC, USER-MGPT, USER-MISC, USER-MOLFILE, USER-NETCDF, USER-OMP, USER-PHONON, USER-QTB, 
USER-REAXC, USER-SMTBQ, USER-SPH, USER-TALLY

Using:

::

   $ make yes-<package-name>

Using Intel compiler and FFTW3:

::

  $ module swap PrgEnv-cray PrgEnv-intel
  $ module sw intel/14.0.4.211 intel/18.0.0.128
  $ module add fftw/3.3.4.5

Packages
--------

Some packages need to be compiled separately. For example the MEAM package:

::
  
  $ cd lib/meam

Edit Makefile.ifort

::  
  
  F90 =           ftn
  ARCHIVE =       xiar


Compile with:

::

  $ make -f Makefile.ifort

Special considerations are needed when building with MEAM support. The autogenerated Makefile.lammps under 
$LAMMPS_HOME/lib/mean must be modified:

::

  meam_SYSINC =
  meam_SYSLIB = -lifcore -lsvml -limf
  meam_SYSPATH = -L/pdc/vol/intel/18.0.0.128/compilers_and_libraries_2018.0.128/linux/compiler/lib/intel64_lin


Main program
------------

Basic makefile is MAKE/MACHINES/Makefile.xe6

::

   $ cd src

Update MAKE/MACHINES/Makefile.xe6 so

::

   CCFLAGS =       -O3 -qopenmp -DLAMMPS_MEMALIGN=64 -qno-offload \
   	   -fno-alias -ansi-alias -restrict -qoverride-limits \
                           -std=c++11
   LINKFLAGS =     -O3 -qopenmp
   LIB =           -lstdc++
 
then

::

   $ make -j 6 xe6

