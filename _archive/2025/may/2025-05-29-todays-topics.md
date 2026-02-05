---
title: "오늘의 할 일 (5/29)...."
tags: [mlir]
layout: post
author: "Keith"
published: false
---

# Post-LLVM Lowering: Next Steps in MLIR-Based DSP Compiler Project

## 1. Validate Generated Code
- Use test vectors (golden data) to verify correctness of the generated binary
- Compare with high-level model (PyTorch/NumPy) outputs
- Automate regression testing (Python test harness, Bash script, etc.)

## 2. Performance Profiling
- Benchmark latency, throughput of the compiled binary
- Use `perf`, `time`, or hardware counters (if available)
- Identify hotspots for optimization

## 3. ISA-level Mapping & Scheduling
- Design or refine internal custom ISA
- Map MLIR ops (e.g., linalg.matmul) to micro-op sequences or intrinsics
- Implement scheduling logic (ASAP/ALAP/ILP scheduling, software pipelining, etc.)

## 4. Custom Backend Development (if needed)
- If LLVM is not optimal, consider building a custom backend
- Implement target lowering, register allocation, and code emission
- Explore backend generation using TableGen or custom codegen tools

## 5. Integration with Hardware Simulation
- Connect binary to your RTL simulation environment (e.g., Verilator)
- Feed test vectors, collect waveform traces, verify against model
- Build a 3-way verification flow: high-level model, software binary, RTL

## 6. Compiler Optimization Passes
- Customize and chain MLIR passes (tiling, fusion, unrolling)
- Add new dialects if needed (e.g., custom `beamformer`, `tensor`, or `complex`)
- Tune LLVM pass pipeline for your architecture

## 7. Automation & Tooling
- Script end-to-end compilation flow: PyTorch → MLIR → LLVM IR → Binary → Sim/Test
- Add logging, metrics, visualizations
- Build CLI or GUI for compiler invocation

## 8. Documentation & Sharing
- Start documenting internal architecture, IR design, pass structure
- Prepare slide decks, markdown docs, or even small videos
- Optionally share parts of the stack internally (e.g., at a team seminar)

## 9. Long-Term Planning
- Prepare for potential AI processor design phase after MLIR refactoring
- Keep code modular for reuse across projects (e.g., layernorm, matmul blocks)
- Plan final report or presentation comparing legacy vs MLIR-based flow