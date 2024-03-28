# On the Investigation of Multimodal Evolutionary Algorithms Using Search Trajectory Networks
[![MIT licensed](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.md)

Bao Thai Tran, Ngoc Hoang Luong

## Run MEAs
```
make
./run_experiments
```

## Plot MDSTNs

### Data
The directory structure of results after performing experiments should be:
```
results
└─── 0_0
│   └─── p1
│       └─── run0
│           │    population00001_elites.dat
│           │    ...
└─── 0_1
    └─── p1
```
where,
- `0_0` contains results of algorithm `0_0`.
- `p_1` is the problem 1 in cec2013 benchmark.
- `run0` is a run for solving the problem.
- `population00001_elites.dat` contains potential solutions found by the algorithm in the iteration 1.

Data for plotting MDSTN can be obtained by 
```
python src/mdstn/extract_data.py
```
There are two variables in file `extract_data.py` which should be noticed such as `algo` and `prob_ids`:
- `algo` is a dictionary whose keys are name of folder containing results of an algorithm and values are its name.
- `prob_ids` is a list of indices of problems solved by the algorithm.

After extracting, multiple files `algo_prob_dims.txt` will be placed in the folder `cec2013`.

### Single
Convert to an appropriate extension `*.RData` by
```
Rscript src/mdstn/alg-create.R <path to folder containing .txt> <number of runs>
```

Plot an MDSTN for each algorithm by
```
Rscript src/mdstn/alg-plot.R <path to folder containing .RData> <scale factor>
```

### Merge
Combine to one data file `.RData` by
```
Rscript src/mdstn/merged-create.R <path to folder containing .RData>
```

Plot a merging MDSTN for multiple algorithms by
```
Rscript src/mdstn/merged-plot.R <path to merged file .RData>
```

Plot a dynamic merging MDSTN for multiple algorithms by
```
Rscript src/mdstn/merged-plot-gif.R <path to merged file .RData>
```

## Acknowledge

[benchmark](https://github.com/mikeagn/CEC2013)

[meas](https://github.com/scmaree/HillVallEA)

[stn](https://github.com/gabro8a/STNs)