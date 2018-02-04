#!/bin/bash
./run_ppgan.sh
./run_mle.sh
./run_rmtpp.sh
python draw.py hawkes_gaussian
python draw.py hawkes_poly
python draw.py 911calls
