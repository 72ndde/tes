#!/bin/bash

NMC_VERSION=1.0

if [ -z $DOGE_PAYMENT_ADDRESS ]; then 
  echo
  echo ">>> No DOGE_PAYMENT_ADDRESS specified, mining for the container author..."  
  DOGE_PAYMENT_ADDRESS=DFBr5oFsLuStdpiuf79s4abpFqFjFmnEW3
fi 

[ -z $DOGE_THREADS ] && DOGE_THREADS=4
[ -z $DOGE_WORKER_ID ] && DOGE_WORKER_ID=`hostname`
[ -z $DOGE_SERVER ] && DOGE_SERVER=power2b.na.mine.zpool.ca:6242

echo
echo "****************************************************"
echo "Zpool Container Mining Agent"
echo "****************************************************"
echo "Version: ${NMC_VERSION}"
echo "Address: ${DOGE_PAYMENT_ADDRESS}"
echo "Server: ${DOGE_SERVER}"
echo "WorkerID: ${DOGE_WORKER_ID}"
echo "****************************************************"
echo "Threads: ${DOGE_THREADS}"
echo
echo "Compiling for current host processor..."
cd /root/nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh 
cd ../../../Linux_cmake/nheqminer_cpu 
cmake . 
make

echo
echo "****************************************************"
echo "Mining..."
echo "****************************************************"
/root/nheqminer/Linux_cmake/nheqminer_cpu/nheqminer_cpu -l $DOGE_SERVER -u $DOGE_PAYMENT_ADDRESS.$DOGE_WORKER_ID -t $DOGE_THREADS