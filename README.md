# MagLevApp

Jupyter notebook accompanying the corresponding conference talk on the 13th Int. Modelica Conference:

Bernhard Thiele, Bernt Lie, Martin Sjölund, Adrian Pop, and Peter Fritzson. Controller Design for a Magnetic Levitation Kit using OpenModelica’s Integration with the Julia Language. In Anton Haumer, editor, 13th Int. Modelica Conference, Regensburg, Germany, March 2019. [doi:10.3384/ecp19157303](https://www.doi.org/10.3384/ecp19157303).

Feedback for improving the notebook or other aspects of the design is welcome...

## Starting the Notebook

*In order to find the Modelica files it is important that the notebook is started with the current working directory being set to the directory in which this README.md is located!*

To achieve this, start the Julia REPL and change the current working directory of the Julia REPL into the directory in which this README.md is located. When start the notebook in the following way:

```julia
using IJulia
notebook(dir=pwd())
```
This will set the notebook's working directory to the current working directory. Now everything should be set up correctly for running the examples in the `MagLevControlDesign.ipynb` notebook.

---------

## Installation Notes

I tested the Jupyter notebook successfully on Windows and Linux. However, it can be a bit tricky to set up the required tools if one hasn't worked with OpenModelica/Julia/Jupyter/OMJulia before. Therefore, some hints from my memory (please let me know if the description is not correct or should be improved):

### OpenModelica

Follow the guide given on OpenModelica's website https://www.openmodelica.org/.

- _Windows_: it should be as simple as executing the delivered installer program. The Windows installer should add the environment variable `OPENMODELICAHOME` which points to the installation. This variable can be used by OMJulia for detecting the OpenModelica installation.
- _Linux_: Using the OpenModelica Debian / Ubuntu packages adds the required `omc` binary to the "path" and OMJulia can find it without the hint of an environment variable.

### Julia

Install Julia from its download site: https://julialang.org/downloads/ (as of 2019-03-10 Julia v1.0.3 and v1.1.0 are featured on the website and it should work with both).

The directory in which the Julia package manager downloads all the packages can become very large (several GB). The packages are stored in a default directory. By adding the environment variable `JULIA_DEPOT_PATH` and pointing it to the desired path one can select an alternative directory.

Once installed:

- _Windows_: Double clicking on the Julia executable will open the interactive command-line REPL (read-eval-print loop). It is convenient to create a link for starting the executable. In this case one can specify a "Working Directory" in the link options. This will become the current working directory when starting the Julia command line session (e.g., use the directory there you store your Julia scripts). The current working directory can be retrieved in a Julia session by entering `pwd()`.
- _Linux_: Just start the binary from a shell

### Jupyter / IJulia / Python

The Julia kernel for [Jupyter](https://jupyter.org/) is provided by the Julia package [IJulia](https://github.com/JuliaLang/IJulia.jl). The IJulia Github site provides very helpful highly-recommended installation-related information.

The simplest approach is to let IJulia install all the Jupyter related dependencies including Jupyter itself and a Python installation which is private to Julia below its `JULIA_DEPOT_PATH` directory. Using this approach all one has to enter at the Julia REPL is basically:

```julia
using Pkg
Pkg.add("IJulia")
using IJulia
notebook()
```
### OMJulia

Installation instructions for [OMJulia](https://github.com/OpenModelica/OMJulia.jl) are given on its Github site. Basically, one just has to do:

```julia
using Pkg
Pkg.clone("https://github.com/OpenModelica/OMJulia.jl")
using OMJulia
```

If OMJulia fails to automatically install all dependencies the appearing errors will indicate which packages are missing. These packages can then be installed manually using the package manager.
