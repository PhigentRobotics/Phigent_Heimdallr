# Instructions


**NOTE**: Vitis Unified Software Platform <ins>2021.1</ins> is required for building this repository. Download it from [here](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vitis/2021-1.html).

**NOTE 2**: Building Kria SOM Vitis platforms from source requires at least 30G of memory <ins>including RAM and Swap</ins>. Make sure you extend your swap beforehand if necessary.


# Contents

This reference design contains the following:

1. platforms

   This folder contains the Kria SOM Vitis platforms. This platform is used to accelerate 
   the Phigent FADNet model which used for stereo camera applications
   Follow the REAMDE inside this folder for build instructions.

2. overlays

   This folder contains the Vitis overlay projects which include the Phigent CNN correlation
   accelerator RTL kernel, Phigent Image Processor RTL kernel, Xilinx DPU
   inference engine RTL kernel，. Follow the README inside this folder for detailed
   build instructions.

3. Makefile

   Top-level Makefile for building the Vitis platforms and overlay projects.
   Type 'make' or 'make help' to print the help text explaining the different
   make targets.

4. README

   This file.

# Documentation

For additional documentation including architecture information and build
tutorials, visit: https://www.hackster.io/PhiGent_Robotics/phigent-heimdallr-91cb92

# Reference

https://github.com/Xilinx/kv260-vitis

# License

(C) Copyright 2022 - 2022 Phigent, Ltd.
