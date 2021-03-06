

The Star-CCM files can be accessed by loading the appropriate modules. To see which versions of Star-CCM+ are available use the command

.. code-block:: bash

 module avail starccm+

In order to use StarCCM+ at PDC you must provide your own license for the software.  You can either use the environment variable

.. code-block:: bash

 CDLMD_LICENSE_FILE

to set to point to the correct license server (not the PoD server 1999@flex.cd-adapco.com), or get access to STAR-CCM+ through license keys generated "power-on-demand" with additional options in the command line

.. code-block:: bash

 -podkey your_license_key -licpath 1999@flex.cd-adapco.com

where "your_license_key" is the license key.

Running on the Batch system
---------------------------

sample job script

.. literalinclude:: files/run.pbs
  :language: bash

Notice that you have to set the number of cores in two places at the top in the

.. code-block:: bash

 #PBS -l mppwidth=288

line and at the bottom when you specify

.. code-block:: bash

 -np 288

Formation on how to submit jobs on Lindgren, see `Job Submission on Lindgren <https://www.pdc.kth.se/resources/computers/lindgren/how-to/run>`_ .

