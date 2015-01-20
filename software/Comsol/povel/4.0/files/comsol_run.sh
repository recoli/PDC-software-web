#!/bin/bash

module add mesa comsol/4.0
comsol -f ${SP_HOSTFILE} -nn yourNumberOfNodes batch -inputfile yourInput.mph -outputfile yourOutput -batchlog yourLogfile
