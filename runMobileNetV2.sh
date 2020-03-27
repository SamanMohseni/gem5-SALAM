#!/bin/bash
FLAGS=IOAcc,LLVMInterface,CommInterface,NoncoherentDma,ComputeUnit

KERNEL=$M5_PATH/benchmarks/mobilenetv2/sw/main.elf
SYS_OPTS="--mem-size=4GB \
          --kernel=$KERNEL \
          --disk-image=$M5_PATH/baremetal/common/fake.iso \
          --machine-type=VExpress_GEM5_V1 \
          --dtb-file=none --bare-metal \
          --cpu-type=TimingSimpleCPU"
CACHE_OPTS="" #"--caches --acc_cache"
# Script to start up full system simulation
# --debug-flags=$FLAGS
echo "Running Single Accelerator Configuration"
build/ARM/gem5.opt --debug-flags=$FLAGS --outdir=BM_ARM_OUT/mobilenetv2 configs/SALAM/fs_mobilenetv2.py \
$SYS_OPTS --accpath=$M5_PATH/benchmarks $CACHE_OPTS #> BM_ARM_OUT/$BENCH/debug_trace.txt

# Debug Flags List
#
# IOAcc
# ClassDetail
# CommInterface
# ComputeUnit
# LLVMInterface
# ComputeNode
# LLVMRegister
# LLVMOp
# LLVMParse
# LLVMGEP
# LLVMRuntime == ComputeNode + LLVMRegister + LLVMOp + LLVMParse
# NoncoherentDma - bfs, fft, gemm, md-knn, nw, spmv


