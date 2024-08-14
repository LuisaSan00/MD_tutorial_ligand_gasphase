#!/bin/bash
# FILENAME: run

#SBATCH -A standby --gpus-per-node=1
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --constraint=h
#SBATCH -t 4:00:00

# This is a file to run gas phase MD for a molecule (no protein)

module load ngc/default
module load gromacs/2021.3

gmx grompp -f prd.mdp -c out.gro -p topol.top -o prd.tpr
gmx mdrun -deffnm prd
