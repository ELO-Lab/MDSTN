# On the Investigation of Multimodal Evolutionary Algorithms Using Search Trajectory Networks
[![MIT licensed](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE.md)

Bao Thai Tran, Ngoc Hoang Luong

## Run MEAs
```
make
./run_experiments
```

After performing experiments of MEAs, the directory structure of results should be:
```
results
└─── 0_0
│   └─── p1
│       └─── run0
│           │    population00001_elites.dat
│           │    ...
│ ...
```
where,
- `0_0` contains results obtained by using the algorithm `0_0`.
- `p1` is the problem 1 in the CEC2013 niching benchmark.
- `run0` is a run when solving the problem 1.
- `population00001_elites.dat` contains all potential solutions found by the algorithm in the iteration 1.

## Plot MDSTNs

### Data
`results` contains only raw data which must be extracted to drawable data via `src/mdstn/extract_data.py`

There are two variables in this file `extract_data.py` which should be noticed such as `algo` and `prob_ids`:
- `algo` is a dictionary whose key is name of folder containing results of an algorithm and value is the algorithm's name.
- `prob_ids` is a list of indices of problems solved by the algorithm.

After making the necessary adjustment, the user takes command `python src/mdstn/extract_data.py` and obtains the `cec2013` folder contains multiple files `algo_prob_dims.txt`.

### Single
- Convert `algo_prob_dims.txt` to an appropriate extension `algo_prob_dims.RData` by
```
Rscript src/mdstn/alg-create.R <path to folder containing .txt> <number of runs>
```
Example: `Rscript src/mdstn/alg-create.R cec2013/p1 50`

- Plot an MDSTN for each algorithm by
```
Rscript src/mdstn/alg-plot.R <path to folder containing .RData> <scale factor>
```
Example: `Rscript src/mdstn/alg-plot.R cec2013/p1-stn 1.0`

### Merge
- Combine to a merged data file `.RData` by
```
Rscript src/mdstn/merged-create.R <path to folder containing .RData>
```
Example: `Rscript src/mdstn/merged-create.R cec2013/p1-stn`

- Plot a merging MDSTN for multiple algorithms by
```
Rscript src/mdstn/merged-plot.R <path to merged file .RData> <scale factor>
```
Example: `Rscript src/mdstn/merged-plot.R cec2013/p1-stn-merged.RData 1.0`

- Plot a dynamic merging MDSTN for multiple algorithms by
```
Rscript src/mdstn/merged-plot-gif.R <path to merged file .RData>
```
Example: `Rscript src/mdstn/merged-plot-gif.R cec2013/p1-stn-merged.RData 1.0`

## Acknowledgement

We would like to express our gratitude to the authors of [HillVallEA](https://github.com/scmaree/HillVallEA) and [CEC2013 Niching Benchmark](https://github.com/mikeagn/CEC2013) which are the baseline which allows us to implement our new ideas; to the authors of [STN](https://github.com/gabro8a/STNs) for their graph modeling concepts.