# clean plots
rm -r plots
mkdir plots

echo "#threads GFLOPS" > plots/scaling_cores.csv

for config in scaling_cores scaling_pinned_threads
do
  for nthreads in 1 2 3 4 5 6 7 8 9 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 159 160
  do
    peak_asimd_fmadd_sp=$(awk 'NR==5' data/${config}_${nthreads}.txt | awk '{print $2}')
    echo ${nthreads} ${peak_asimd_fmadd_sp} >> plots/${config}_peak_asimd_fmadd_sp.csv

    peak_asimd_fmadd_dp=$(awk 'NR==9' data/${config}_${nthreads}.txt | awk '{print $2}')
    echo ${nthreads} ${peak_asimd_fmadd_dp} >> plots/${config}_peak_asimd_fmadd_dp.csv

    peak_asimd_fmla_sp=$(awk 'NR==13' data/${config}_${nthreads}.txt | awk '{print $2}')
    echo ${nthreads} ${peak_asimd_fmla_sp} >> plots/${config}_peak_asimd_fmla_sp.csv

    peak_asimd_fmla_dp=$(awk 'NR==17' data/${config}_${nthreads}.txt | awk '{print $2}')
    echo ${nthreads} ${peak_asimd_fmla_dp} >> plots/${config}_peak_asimd_fmla_dp.csv
  done

  for bench in ${config}_peak_asimd_fmadd_sp ${config}_peak_asimd_fmadd_dp ${config}_peak_asimd_fmla_sp ${config}_peak_asimd_fmla_dp
  do
    for type in pdf txt
    do
      if [[ ${type} == "pdf" ]]
      then
        terminal=pdf
      else
        terminal=dumb
      fi

    cat   plots/${bench}.csv | gnuplot -p -e "set terminal ${terminal} noenhanced; set xlabel '#cores'; plot '<cat' with lp title 'GFLOPS (${bench})'" > plots/${bench}_${config}.${type}
    done
  done
done