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


Annahme: Es wird nur ein Prozessorkern verwendet und es sollen nur 2 Zahlen bei FMUL und 3 Zahlen bei FMLA verrechnet werden.

FMUL latency:
Der Neoverse N1 Prozessor hat eine Frequenz von 2,5 GHZ. Daher ergibt sich folgende Rechnung:

2,5 GHZ / 3 * 1 * 2 * 4 = 6,66666666666 GFLOPS

Die 3 steht für die Latenz, welche die Anzahl an Taktschlägen angibt, bis die Pipeline voll geladen ist.
Der Faktor 1 steht für eine Operation (Multiplikation zweier Zahlen). Da die Instruktion FMUL ist.
Der Faktor 2 steht für den Throughput, d.h. 2 Operationen pro Instruktion werden durchgeführt.
Der Faktor 4 steht für double precicion, da in ein Vektorregister 4 Double Werte passen.

FMLA latency:
Der Neoverse N1 Prozessor hat eine Frequenz von 2,5 GHZ

2,5 GHZ / 4 * 2 * 2 * 4 = 10 GFLOPS

Die 4 steht für die Latenz, welche die Anzahl an Taktschlägen angibt, bis die Pipeline voll geladen ist.
Der Faktor 2 steht für zwei Operation (Multiplikation und Addition zweier Zahlen). Da die Instruktion FMLA ist.
Der Faktor 2 steht für den Throughput, d.h. 2 Operationen pro Instruktion werden durchgeführt.
Der Faktor 4 steht für double precicion, da in ein Vektorregister 4 Double Werte passen.





3. Rewrite the peak performance microbenchmark peak_asimd_fmla_sp.s of Section 1. Replace all FMA ops by fmla v0.4s, v0.4s, v1.4s as described above. Name your kernel latency_src_asimd_fmla_sp.s and benchmark it! What do you observe?

Benchmark Ergebnisse:

latency_src_asimd_fmla_sp
  repetitions: 146249200
  duration: 6.51655 seconds
  GFLOPS: 861.801


peak_asimd_fmla_sp
  repetitions: 1707509438
  duration: 8.80511 seconds
  GFLOPS: 7446.62

Die Anzahl an GFLOPS ist für den Kernel "peak_asimd_fmla_sp" 8,64 Mal so hoch wie für den neu erstellten Kernel "latency_src_asimd_fmla_sp". 



4. Repeat the previous task, but use fmul v0.4s, v0.4s, v1.4s. Name the kernel latency_src_asimd_fmul_sp.s


5. Given the benchmark latency_src_asimd_fmla_sp.s. How does the situation change if you increase the distance of the read-after-write dependences?


6. Now introduce a data dependence only by means of the destination register, i.e., repeat the line fmla v0.4s, v30.4s, v31.4s for FMA ops. What do you observe? What happens if you use fmul v0.4s, v30.4s, v31.4s? Name the kernels latency_dst_asimd_fmla_sp.s and latency_dst_asimd_fmul_sp.s respectively.