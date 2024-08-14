#!/bin/bash
# FILENAME: ext 

#SBATCH -A standby --gpus-per-node=1
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --constraint=h
#SBATCH -t 4:00:00

#This file is to extract the snapshots in .g96 format of a trajectory of a MD simulation. In this case is going from time 10 to 10000 in steps of 10.
module load ngc/default
module load gromacs/2021.3

mkdir snp

# Loop fro time steps from 10 to 10000 in steps of 10
for t in `seq 10 10 10000`
do
    echo "0" | gmx traj -s prd.tpr -f prd.trr -b ${t} -e ${t} -oxt snp_${t}.g96
    
    mv snp_${t}.g96 snp

done

