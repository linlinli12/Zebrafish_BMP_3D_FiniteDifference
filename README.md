# Zebrafish_BMP_3D_FiniteDifference
# Code for running 3D growing domain BMP signaling patterning formation network. 

Subfolders \
Main_code \
run_code.m << for setting up the running folders, type (WT or chd mutant), and set up parameter set files.

Run_grow_noplot_expression.m << for setting up expression profiles, mesh information and simulation parameters.

SphereFiniDiffMod_expression_1.m << function for 2D finite difference scheme of spherical coordinate for BMP signaling network at blastula stage.

Makeup_bmp_4757_121718.mat << bmp expression for 4.7hpf and 5.7hpf ( Run_grow_noplot expression will us this data to interpolate expression map for individual time step)

Makeup_chd_4757_121718.mat << chd expression for 4.7hpf and 5.7hpf ( Run_grow_noplot expression will us this data to interpolate expression map for individual time step)

Parameter_set_1.mat << parameter  information 

Post_analysis \
Compare_result_wt_chd.m << This code is to compare pointwise finite difference simulation results and averaged whole sphere result of experimental pSmad data for both WT and Chd mutant (code was modified to read one single results)
sampleSph_pSmad_chdWT_083118.mat << averaged pSmad map for both WT and Chd mutant at 4.7hpf, 5.3hpf and 5.7hpf, data from prepublished elife paper
