#!/usr/bin/env bash

username="su20";

echo -n "Enter password: "
read -s password

for i in `seq 1 45`; do
  echo $(printf "Login %i/45" $i);
  eval $(printf "sshpass -p '%s' ssh %s@teer%02i.oit.duke.edu \"exit\"" $password $username $i);
done
