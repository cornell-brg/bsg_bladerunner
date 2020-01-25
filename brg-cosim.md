## Setup COSIM on brg-vip

 - Setup environment
   ```bash
   source setup-brg.sh
   source setup-hb.sh
   ```
   These scripts will load VCS, Vivado, and devtoolset-6 for you.
 - Clone our fork of bsg_bladerunner
   ```bash
   $ git clone git@github.com:cornell-brg/bsg_bladerunner.git
   $ cd bsg_bladerunner
   ```
 - Build COSIM
   ```bash
   $ make setup
   ```
   Note: this step may take up to 1 hour
 - Build XILINX IPs
   ```bash
   $ cd bsg_f1/testbenches
   $ make regression
   ```
   Note: you must be in bsg_bladerunner/bsg_f1/testbenches to run tests on COSIM
   
   Note: this build will failed with an error due to [a bug in Vivado 2019.1](https://www.xilinx.com/support/answers/72404.html), but it's ok to ignore it.
 - Run regression tests
   ```bash
   $ make regression -j
   ```
   All tests should pass.
   
## Add a new app to brg-apps
 - Before you start -- make sure you create your own branch in `bsg_bladerunner/bsg_manycore` and `bsg_bladerunner/bsg_f1` since you need to make changes there.
 - Create a new directory to host your application
   ```bash
   $ cd bsg_bladerunner/bsg_manycore/software/brg-apps
   $ mkdir new_app
   ```
 - Write the kernel and Makefile. You can refer to `vvadd` as an example.
 - Write the host code
   ```bash
   $ cd bsg_bladerunner/bsg_f1/regression/brg-apps
   ```
   You can refer to `test_vvadd.h` and `test_vvadd.c` as examples for how to write host code for your CUDALite kernel.
 - Register your new app by editing `tests.mk` and extend `INDEPENDENT_TESTS`. For example
   ```diff
    # "Independent Tests" use a per-test <test_name>.c file
    INDEPENDENT_TESTS += test_vvadd
   +INDEPENDENT_TESTS += new_app
   ```
 - Run your application
   ```bash
   $ cd cd bsg_f1/testbenches/brg-apps
   $ make regression
   ```
   Note: this will run all apps that are registers with `bsg_bladerunner/bsg_f1/regression/brg-apps/tests.mk`. To run a single app, do `make <APP_NAME>.log`
   
   
