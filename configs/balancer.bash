#!/bin/bash
echo "
-A -t balancer:80 -s rr
-a -t balancer:80 -r load-balance-backend-1:8000 -m
-a -t balancer:80 -r load-balance-backend-2:8000 -m
" | ipvsadm -R
sleep infinity
