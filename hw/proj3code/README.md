This directory contains the following subroutines.

 - `gap_setup` - set up the mini finite-element simulation
 - `gap_force` - compute electrostatic force and derivatives w.r.t u and V
 - `gap_plot` - draw a picture of the deformed beam shape
 - `gap_freq` - compute the lowest natural frequency for the displaced case

These codes use a numerical method (finite element analysis) that we
have not discussed in class, as well as physics (beam theory and
parallel-plate approximations of capacitance) that we have not
discussed.  But you don't really need to understand them to explore
the solver technology.

In addition to the finite element analysis and post-processing
routines, you also are provided with the complete code for the
function `gap_solve_fpV`, a fixed-point solver for the voltage control
case, and `gap_demo`, a driver that shows how to use the solver.
You should make an attempt to understand these codes, as you will
be building similar routines.

You are provided with the skeleton for two other solver codes:
`gap_solve_NV`, a Newton solver for the voltage control case, and
`gap_solve_Nd`, a Newton solver for the displacement control case.
You should stick to these interfaces, which are very similar to the
interface for `gap_solve_fpV`.  In addition, you will develop another
solver that builds on this routins: `gap_pullin`, which computes the
displacement vector and voltage associated with the pullin.
