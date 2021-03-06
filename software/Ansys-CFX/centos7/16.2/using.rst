

Submitting a CFX job on Tegner
------------------------------

If you want to run Ansys CFX v16.2 on a single node on Tegner you can do so by creating a simple script (e.g. *cfx_run.sh*) which includes:

.. literalinclude:: files/cfx_run.sh
  :language: bash

and submit it from Tegner's login node

.. code-block:: bash

 sbatch cfx_run.sh

In this example, we requested two nodes for one hour and have chosen to run on full processors per node with *cfx5solve*. Note the above *Benchmark.def* should be replaced by your definition file and *NUM_PART* by the partition count. If the NUM_PART is NOT specified, a partition file (.par) is assumed to be created in the same directory.

Formation on how to submit jobs on Tegner, see `Job Submission on Tegner <https://www.pdc.kth.se/resources/computers/tegner/how-to/run>`_ .

