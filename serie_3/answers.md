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

2,5 GHZ / 3 * 1 * 4 = 3,333333333 GFLOPS  

Die 3 steht für die Latenz, welche die Anzahl an Taktschlägen angibt, bis die Pipeline voll geladen ist.  
Der Faktor 1 steht für eine Operation (Multiplikation zweier Zahlen). Da die Instruktion FMUL ist.  
Der Faktor 4 steht für double precision, da in ein Vektorregister 4 Double Werte passen.  

FMLA latency:  
Der Neoverse N1 Prozessor hat eine Frequenz von 2,5 GHZ  

2,5 GHZ / 4 * 2 * 4 = 5 GFLOPS  

Die 4 steht für die Latenz, welche die Anzahl an Taktschlägen angibt, bis die Pipeline voll geladen ist.  
Der Faktor 2 steht für zwei Operation (Multiplikation und Addition zweier Zahlen). Da die Instruktion FMLA ist.  
Der Faktor 4 steht für double precision, da in ein Vektorregister 4 Double Werte passen.  


3. Rewrite the peak performance microbenchmark peak_asimd_fmla_sp.s of Section 1. Replace all FMA ops by fmla v0.4s, v0.4s, v1.4s as described above. Name your kernel latency_src_asimd_fmla_sp.s and benchmark it! What do you observe?

Benchmark Ergebnisse:  

latency_src_asimd_fmla_sp  
 threads: 160  
  repetitions: 154757384  
  duration: 6.43874 seconds  
  GFLOPS: 922.957  

peak_asimd_fmla_sp  
 threads: 160  
  repetitions: 1589824360  
  duration: 8.14069 seconds  
  GFLOPS: 7499.27  

Die Anzahl an GFLOPS ist für den Kernel "peak_asimd_fmla_sp" ~8.13 Mal so hoch wie für den neu erstellten Kernel "latency_src_asimd_fmla_sp".
Im neu erstellten Kernel "latency_src_asimd_fmla_sp" erreichen wir pro Thread ~5.77 GFLOPS (=922.957/160).

4. Repeat the previous task, but use fmul v0.4s, v0.4s, v1.4s. Name the kernel latency_src_asimd_fmul_sp.s  

latency_src_asimd_fmul_sp  
 threads: 160  
  repetitions: 213506680  
  duration: 6.64802 seconds  
  GFLOPS: 616.624  

Hier haben wir noch weniger GFLOPS als bei FMLA. Dies könnte daran liegen, dass wir bei FMUL nur eine Operation (Multiplikation) und bei FMLA zwei Operationen (Multiplikation und Addition) haben.  


5. Given the benchmark latency_src_asimd_fmla_sp.s. How does the situation change if you increase the distance of the read-after-write dependences?

Die Distanz zwischen den read-after-write Abhängigkeiten (siehe Kernel "distance_latency_src_asimd_fmla_sp") wurde in folgender Form erhöht:  

        fmla v0.4s, v0.4s, v1.4s  
        fmla v2.4s, v2.4s, v3.4s  
        fmla v0.4s, v0.4s, v1.4s  
        fmla v2.4s, v2.4s, v3.4s  

Das Benchmarken dieses Kernels hat folgendes ergeben:  

distance_latency_src_asimd_fmla_sp  
 threads: 160  
  repetitions: 288612141  
  duration: 5.99895 seconds  
  GFLOPS: 1847.44  

Die hier erzielte Anzahl an GFLOPS entspricht ziemlich genau dem doppelten der erreichten GFLOPS von der Variante des Kernels "latency_src_asimd_fmla_sp.s".  
1847.44 ~ 2*922.957 = 1845.95  
Hier hängen die Operationen immer von der übernächsten Operation ab und nicht mehr von der nächsten. Daher war diese Erhöhung der GFLOPS zu erwarten.  


6. Now introduce a data dependence only by means of the destination register, i.e., repeat the line fmla v0.4s, v30.4s, v31.4s for FMA ops. What do you observe? What happens if you use fmul v0.4s, v30.4s, v31.4s? Name the kernels latency_dst_asimd_fmla_sp.s and latency_dst_asimd_fmul_sp.s respectively.

Die Benchmarks der beiden erstellten Kernels ergeben folgende Werte:

latency_dst_asimd_fmla_sp  
 threads: 160  
  repetitions: 474319151  
  duration: 9.59818 seconds  
  GFLOPS: 1897.64  

latency_dst_asimd_fmul_sp  
 threads: 160  
  repetitions: 920067735  
  duration: 4.76566 seconds  
  GFLOPS: 3706.79  

Die GFLOPS vom Kernel latency_dst_asimd_fmla_sp sind etwas mehr als 2 Mal so hoch wie bei dem Kernel latency_src_asimd_fmla_sp (1897.64 GFLOPS und 922.957 GFLOPS). Damit liegen die GFLOPS aber immer noch deutlich unter den GFLOPS vom Kernel peak_asimd_fmla_sp, wo wir 30 unabhägige SP ASIMD-FMA Operationen haben.

Bei dem zweiten Kernel der SP Multiplikation ("latency_dst_asimd_fmul_sp") werden 3706.79 GFLOPS erreicht. Das sind deutlich mehr als die beim Kernel "latency_src_asimd_fmul_sp" aus Aufgabe 4, wo gerade einmal 616.624 GFLOPS erreicht werden.

