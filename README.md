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
│           │    population00000_elites.dat
│           │    ...
└─── 0_1
    └─── p1
```

Data for plotting MDSTN can be obtained by 
```
python src/mdstn/extract_data.py
```

There are two field which should be noticed such as `algo` and `prob_ids`:
- `algo` is a dictionary whose keys are name of folder containing results of an algorithm and values are its name.
- `prob_ids` is a list of indices of problems solved by the algorithm.

### Single

```
Rscript alg-create.R 
Rscript alg-plot.R
```

### Merge
```
Rscript 
```

## Acknowledge

[benchmark](https://github.com/mikeagn/CEC2013)
[meas](https://github.com/scmaree/HillVallEA)
[stn](https://github.com/gabro8a/STNs)