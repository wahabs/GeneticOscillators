#!/usr/bin/env bash

username="su20";
total_sims=100;

for i in `seq 1 $total_sims`; do
  matlab_cmd="matlab -nodesktop -nosplash -nojvm -r \\\"run_parallel_sim($i, $total_sims)\\\""
  server_num=$(($i/4+1));
  server_num=$(printf "%02i" $server_num);

  cmd=$(printf "ssh -t %s@teer%s.oit.duke.edu \"cd bme_574-engineering_robust_oscillators;\n" $username $server_num);
  close="\" &";
  eval $cmd$matlab_cmd$close
done
