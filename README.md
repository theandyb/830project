# 830 Project
Andy Beck

Fall 2018

University of Michigan Department of Biostatistics

## Data
[Marathon data](https://github.com/jakevdp/marathon-data) courtesy of [Jake Vanderplas](http://vanderplas.com/)

> Here we'll look at using Seaborn to help visualize and understand finishing results from a marathon. I've scraped the data from sources on the Web, aggregated it and removed any identifying information, and put it on GitHub where it can be downloaded

[Boston Marathon Results from 2015 - 2017](https://www.kaggle.com/rojour/boston-results/version/4). I renamed all these files to match the pattern `{YEAR}.csv` (e.g. `2017.csv`) and placed these in a directory called `boston` under the `data/` directory. In addition, I substituted all the blank values (`-` in the files downloaded from Kaggle) with blanks (i.e. I searched for `,-,` and replaced with `,,`).
