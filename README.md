# MD_tutorial_ligand_gasphase
This tutorial was developed to run molecular dynamic (MD) calculations with GROMACS for a ligand (or small molecule) in gas phase.

1. Obtain your force field (FF), ligand.itp format for GROMOS, and your ligand.gro structure file.
   NOTE: Please see the QForce tutorial to obtain FF for your molecule, or use https://github.com/Slipchenko-Group/Tutorials/blob/main/GAFF2_param/README.md to get your FF through ANTECHAMBER.
2. Copy the topol.top, prd.mdp, run.sh files in this repository.
   topol.top: this is your topology file, where the system topology is contained: definition of molecular structures, parameters, and interactions for the simulation.
   prd.mdp: parameters defined for the production run
   run.sh: bash script to run GROMACS in the background
3. ``` gmx_mpi edit config -f ligand.gro -box 1000 1000 1000 -center 500 500 500 ``` # to define box
4. ``` sbatch run.sh ```  # to run md
5. When your production run is done, copy the ext_snp.sh file from this repository. This will extract 1000 snapshots from the MD calculation.
6. ``` sbatch ext_snp.sh ```
7. Analyze according to your goals.
