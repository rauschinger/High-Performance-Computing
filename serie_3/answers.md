Tasks:

1. Locate the AArch64 ASIMD instructions fmul and fmla in the Arm Neoverse N1 Software Optimization Guide. What are their key metrics (used pipelines, latency, throughput)?

FMUL:
used pipelines: V means FP/ASIMD 0/1
latency: 3
throughput: 2

FMLA:
used pipelines: V means FP/ASIMD 0/1
latency: 4
throughput: 2



2. Assume a workload which is bound by fmul’s latency, meaning that a pipeline only works on a single instruction at a time. In that case, how many GFLOPS can you get out of a single FP/ASIMD pipeline? How does the situation change if you are bound by fmla’s latency?



3. Rewrite the peak performance microbenchmark peak_asimd_fmla_sp.s of Section 1. Replace all FMA ops by fmla v0.4s, v0.4s, v1.4s as described above. Name your kernel latency_src_asimd_fmla_sp.s and benchmark it! What do you observe?



4. Repeat the previous task, but use fmul v0.4s, v0.4s, v1.4s. Name the kernel latency_src_asimd_fmul_sp.s


5. Given the benchmark latency_src_asimd_fmla_sp.s. How does the situation change if you increase the distance of the read-after-write dependences?


6. Now introduce a data dependence only by means of the destination register, i.e., repeat the line fmla v0.4s, v30.4s, v31.4s for FMA ops. What do you observe? What happens if you use fmul v0.4s, v30.4s, v31.4s? Name the kernels latency_dst_asimd_fmla_sp.s and latency_dst_asimd_fmul_sp.s respectively.