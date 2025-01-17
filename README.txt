Introduction
This supplement provides the MATLAB source code accompanying the manuscript 
"A criterion characterizing accumulated neurotoxicity of Aβ oligomers in Alzheimer’s disease" 
by Andrey V. Kuznetsov

Last updated: January 2025

Please put the files in the same folder.


Numerical solution of Eqs. (4)-(6) with initial conditions given by Eq. (7). This code is used to generate Figs. S1-S6 in the Supplementary Materials.

integB_Bt_k1.m funCABD_int.m
integB_Bt_k2.m funCABD_int.m
integB_Bt_qA.m funCABD_int.m


Numerical calculation of the neurotoxicity criterion given by Eq. (8). This code is used to generate Figs. 2-5 in the paper.

integB_k1.m funCABD_int.m
integB_k2.m funCABD_int.m
integB_qA.m funCABD_int.m


Numerical calculation of the plot of neurotoxicity criterion vs theta1/2,B. This code is used to generate Figs. 6-8 in the paper.

integB_k1_theta12.m funCABD_int.m
integB_k2_theta12.m funCABD_int.m
integB_qA_theta12.m funCABD_int.m


Numerical calculation of the dimensionless sensitivity coefficients. This code is used to generate Figs. 9-11 in the paper.

integB_sensitivity_k1_var_k1.m funCABD_int.m
integB_sensitivity_k2_var_k2.m funCABD_int.m
integB_sensitivity_qA_var_qA.m funCABD_int.m
