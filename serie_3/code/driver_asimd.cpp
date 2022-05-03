#include <cstdint>
#include <cmath>
#include <chrono>
#include <tuple>
#include <omp.h>
#include <iostream>

extern "C" {
  uint64_t peak_asimd_fmadd_sp( uint64_t i_n_repetitions );
  uint64_t peak_asimd_fmadd_dp( uint64_t i_n_repetitions );
  uint64_t peak_asimd_fmla_sp( uint64_t i_n_repetitions );
  uint64_t peak_asimd_fmla_dp( uint64_t i_n_repetitions );
  uint64_t latency_src_asimd_fmla_sp( uint64_t i_n_repetitions );
  uint64_t latency_src_asimd_fmul_sp( uint64_t i_n_repetitions );
  uint64_t distance_latency_src_asimd_fmla_sp( uint64_t i_n_repetitions );
  uint64_t latency_dst_asimd_fmla_sp( uint64_t i_n_repetitions );
  uint64_t latency_dst_asimd_fmul_sp( uint64_t i_n_repetitions );
  

}

/**
 * Measures the performance (time) of the given microkernel.
 *
 * @param i_kernel benchmarked kernel.
 * @param i_n_repetitions number of performed repetitions.
 * @return duration required for the performed repetitions.
 **/
double timeKernel( uint64_t (*i_kernel)(uint64_t),
                   uint64_t   i_n_repetitions ) {
  std::chrono::high_resolution_clock::time_point l_tp0, l_tp1;
  std::chrono::duration< double > l_dur;

#pragma omp parallel
  {
#pragma omp barrier
#pragma omp master
    {
      l_tp0 = std::chrono::high_resolution_clock::now();
    }
    (*i_kernel)( i_n_repetitions );
#pragma omp barrier
#pragma omp master
    {
      l_tp1 = std::chrono::high_resolution_clock::now();
    }
  }

  l_dur = std::chrono::duration_cast< std::chrono::duration< double> >( l_tp1 - l_tp0 );

  return l_dur.count();
}

/**
 * Benchmarks the performance (repetitions, time, gflops) of the given microkernel.
 *
 * @param i_kernel benchmarked kernel.
 * @param i_time_target targeted total execution time; the number of actual repetitions is adjusted accordingly.
 * @param i_n_repetitions_initial initial number of performed repetitions.
 * @return (repetitions, time, gflops).
 **/
std::tuple< uint64_t,
            double,
            double > benchKernel( uint64_t (*i_kernel)(uint64_t),
                                  double     i_time_target = 10.0,
                                  uint64_t   i_n_repetitions_initial = 1000000 ) {
  // get number of threads and print
  int l_n_threads = 1;

#pragma omp parallel
  {
   #pragma omp master
   {
     l_n_threads = omp_get_num_threads();
   } 
  }

  std::cout << " threads: " << l_n_threads << std::endl;

  // get number of flops per iter
  uint64_t l_n_flops = i_kernel(1);

  // get time required for initial number of reps
  double l_dur = timeKernel( i_kernel,
                             i_n_repetitions_initial );

  // derive number of reps for targeted duration
  double l_scaling_time = i_time_target / l_dur;
  uint64_t l_n_repetitions_adj = i_n_repetitions_initial * l_scaling_time;
  if( l_n_repetitions_adj == 0 ) {
    l_n_repetitions_adj = 1;
  }

  // benchmark kernel
  l_dur = timeKernel( i_kernel,
                      l_n_repetitions_adj );

  // derive gflops
  double l_gflops = l_n_repetitions_adj;
  l_gflops *= l_n_flops / l_dur;
  l_gflops *= l_n_threads;
  l_gflops *= 1.0E-9;

  return std::make_tuple( l_n_repetitions_adj,
                          l_dur,
                          l_gflops );
}

int main() {
  std::cout << "running ASIMD microbenchmarks" << std::endl;

  // common benchmark data
  uint64_t l_n_repetitions = 0;
  double l_time = 0;
  double l_gflops = 0;

  // benchmark asimd fmadd sp
  std::cout << "peak_asimd_fmadd_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( peak_asimd_fmadd_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;

  // benchmark asimd fmadd dp
  std::cout << "peak_asimd_fmadd_dp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( peak_asimd_fmadd_dp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;

  // benchmark asimd fmla sp
  std::cout << "peak_asimd_fmla_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( peak_asimd_fmla_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;

  // benchmark asimd fmla dp
  std::cout << "peak_asimd_fmla_dp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( peak_asimd_fmla_dp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;


  // benchmark latency src asimd fmla sp
  std::cout << "latency_src_asimd_fmla_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( latency_src_asimd_fmla_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;

  // benchmark latency src asimd fmul sp
  std::cout << "latency_src_asimd_fmul_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( latency_src_asimd_fmul_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;

  // benchmark distance_latency_src_asimd_fmla_sp
  std::cout << "distance_latency_src_asimd_fmla_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( distance_latency_src_asimd_fmla_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;


  // benchmark latency_dst_asimd_fmla_sp
  std::cout << "latency_dst_asimd_fmla_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( latency_dst_asimd_fmla_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;


  // benchmark latency_dst_asimd_fmul_sp
  std::cout << "latency_dst_asimd_fmul_sp" << std::endl;

  std::tie( l_n_repetitions,
            l_time,
            l_gflops ) = benchKernel( latency_dst_asimd_fmul_sp );

  std::cout << "  repetitions: " << l_n_repetitions << std::endl;
  std::cout << "  duration: " << l_time << " seconds" << std::endl;
  std::cout << "  GFLOPS: " << l_gflops << std::endl;



  std::cout << "finished ASIMD microbenchmarks" << std::endl;

  return EXIT_SUCCESS;
}
