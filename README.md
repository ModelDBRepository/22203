# Instructions for the demo version

The directory tree contains the code we developed for correcting space-clamp distortions of voltage-clamp recordings. The code is distributed in several sub directories. The example given here is a voltage clamp experiment of a 2 mm cable with an ideal two electrode voltage clamp inserted in the middle of the cable. In the simulated experiment (sub directory **Experiment**) a homogeneous density of the kfast potassium channel (Korngreen and Sakmann 2000) is inserted into the cable and a series of steps from −80 to +70 mV is given. Then the active conductance is removed and the voltage clamp protocol is repeated to calculate the passive response of the cable. This passive response is subtracted from the first set of currents thus performing the process of leak subtraction. The leak-subtracted currents are then copied to the directory where they will be corrected for space-clamp (the **Fit** directory). In addition to this, the simulation is also run in a one-compartment model to obtain the correct kinetics of the current (directory **Kinetics**).

The demo version will run only on computers with NEURON 5.0.0 or later. There are two batch files provided that facilitates the process of model compilation and execution. One is for Unix and the other for Windows (in a DOS console). Due to the limitation of the Microsoft operating system you have to compile manually the nrnmech.dll in the following directories before running the batch file. This is not necessary under Unix.

**Correction.Demo\Kinetics\mod**

**Correction.Demo\Experiment\mod**

**Correction.Demo\Fit\mod**

NOTE: During the execution of the PC.bat batch file you will have to intervene and after each step close NEURON. Unlike in Unix, NEURON stays on after it finished. This stops the execution of the batch file. The execution will resume only after you close NEURON. Generally, the Unix version is more stable.

Regardless of the batch file you select, after some messages and calculations you will get a panel with the following options:

1. Load the leak-subtracted currents recorded from the cylinder and display them.

2. Load the conductance density of the currents recorded from a spherical cell.

3. Run the correction algorithm. This might take a while. On the Silicon Graphics
Unix Origin 2000 this took 20 minutes, sun Sparc10 2.5 hours, 400 MHz Celeron
PC with windows 98 2 hours.

4. This will plot the results of the correction.

In addition to the panel you will see a graph that displays the true kinetics. The values of the time, voltage and the conductance will be updated for every step in the calculation. The value of the conductance will also be displayed on-line on top of the true conductance in a graph that should be opened automatically. For display purposes the conductance shown is the conductance after correction for the initial guess for the activation time constants. If you will press the Verbose button you will also get a text output to the console.

## Description of files:

### Directory **Kinetics**:

| File                 | Description                                                                                             |
|----------------------|-----------------------------------------------------------------------------------------------------|
| cylinder.kin.par     | This HOC file parameters that control the simulation. Edit this file to change the kinetics in a spherical morphology. They are later used for display purposes |
| Kinetics             | This file actually simulates the conductances.                                                     |
| InOut.kin            | Input output routines.                                                                              |
| Routines.kin         | General routines used for generation of the conductances.                                          |
| Cells                | This folder contains only a one compartment model of a cell.                                       |
| mod                  | A directory containing the MOD files of the additional mechanisms that were tested.                |
| Output               | The output is written to this folder                                                                |

### Directory **Experiment**

| File                 | Description                                                                                             |
|----------------------|-----------------------------------------------------------------------------------------------------|
| cylinder.exp.par     | This HOC file contains the parameters that control the simulation. Edit this file to change the simulation. |
| Experiment           | This file actually does the simulation                                                                |
| InOut.exp            | Input output routines for the simulated experiment                                                   |
| Routines.exp         | General routines for the simulated experiment.                                                      |
| ReduceModel.cell     | Used to automatically reduce the number of compartments in a fully reconstructed neuron.            |
| Cells                | This folder contains the files defining the morphology. It now contains only the cylinder morphology. |
| ClampCurrents        | The results of the simulation are written to this folder. The *.iCl files are the input to the fitting algorithm. To apply the correction algorithm to data from an actual experiment you will need to generate a file in the format of the *.iCl files. |
| mod                  | A directory containing the MOD files of the additional mechanisms that were tested.                 |

### Directory **Fit**

| File                  | Description                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------|
| cylinder.fit.par      | This HOC file contains the parameters that control the fit. Edit this file to change the simulation. |
| Fit                   | Main body of the fitting algorithm                                                             |
| Leak                  | Calculates the leak at all voltages and writes it to file                                       |
| Display               | Contains the graphic display functions used to show the results of the fit.                     |
| Algorithm.fit         | Several routines that are called during the minimization stages.                                |
| Minimize.Algorithm.fit| Golden bisection routines from Numerical Recipes                                               |
| InOut.fit             | Input output routines for the fit                                                              |
| InOut.leak            | Input output routines for leak calculation                                                      |
| Routines.fit          | General routines for the fitting algorithm.                                                    |
| Routines.leak         | General routines used for leak generation.                                                     |
| ReduceModel.cell      | Used to automatically reduce the number of compartments in a fully reconstructed neuron.       |
| Cells                 | This folder contains the files defining the morphology. It now contains only the cylinder morphology. |
| ClampCurrents         | The results of the simulation are written to this folder. The *.iCl files are the input to the fitting algorithm. To apply the correction algorithm to data from an actual experiment you will need to generate a file in the format of the *.iCl files. |
| Mod                   | A directory containing the MOD file of the dummy conductance                                    |
| Output                | The results of the calculation are written to this folder                                       |
| SimLeak               | The simulated leak is written to this folder                                                   |

---

NOTE: We separated the code into several files to help with debugging and make the code more modular. However, this is still one program. If you change the code in one file you may have to do this also in one or two other files. SO, be careful when you modify the code in one of these files.

---

2025-05-27 – Standardized to Markdown