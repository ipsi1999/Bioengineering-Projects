# Bioengineering-Projects
Lab 11: Computational Modeling and Analysis of Biological Networks
1. Objectives

    Learn how to create and simulate computational models of biological networks to understand their mechanisms at a system level.
    Understand mathematical modeling of biological interactions.
    Solve ordinary differential equations (ODEs) using MATLAB.
    Model and analyze the dynamics of cell signaling pathways through simulations.

2. Background
2.1 Systematic Study of Biological Systems
Cellular behavior is influenced by numerous interacting molecules forming complex networks. The phenotype of a cellular system emerges from these complex molecular interactions.

2.2 Mathematical Modeling Techniques

2.2.1 Regulation Circuits

Different types of regulation circuits (such as positive and negative feedback loops) can influence the behavior and dynamics of biological systems. For example, a transcription factor can either repress (negative feedback) or enhance (positive feedback) its own production.

2.2.2 Solving ODEs in MATLAB

Dynamic equations can be solved in MATLAB using built-in ODE solvers like ode15s or ode45. These solvers execute a function file with ODE equations and provide results within a simulation time based on initial conditions and parameters.

2.2.3 Law of Mass Action

The law of mass action models the interactions of biochemical molecules, explaining how the reaction rate is proportional to the concentration of reactants.

2.2.4 Michaelis-Menten Kinetics

Michaelis-Menten kinetics describes the rate of enzymatic reactions by relating the reaction rate to the substrate concentration. This model involves the formation of an enzyme-substrate complex that converts to a product.


The mitogen-activated protein kinase (MAPK) cascades are key components in eukaryotic signal transduction, conserved across various species. These pathways relay extracellular signals to the cell's interior, initiating diverse responses such as cell growth and stress responses. The pathway consists of three levels where kinases phosphorylate downstream targets, and phosphatases inactivate them.
