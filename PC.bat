cd Kinetics 
neuron -dll mod/nrnmech.dll cylinder.kin.par Kinetics 
cd ..\Experiment 
neuron -dll mod/nrnmech.dll cylinder.exp.par Experiment  
copy ClampCurrents\cylinder.iCl ..\Fit\ClampCurrents 
cd  ..\Fit 
neuron -dll mod/nrnmech.dll cylinder.fit.par Leak  
neuron -dll mod/nrnmech.dll cylinder.fit.par Fit -  
 
