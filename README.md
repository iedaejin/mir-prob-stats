# Probability and Statistics — MIR Labs (Fall 2026)

These labs are designed for a Master in International Relations course and follow the syllabus session order.

## Posit Cloud workflow
1. Create one Posit Cloud assignment per lab folder.
2. Upload the folder contents to a new RStudio project.
3. Students open `tutorial.Rmd` and click **Run Document** (needs the `learnr` and `tidyverse` packages).
4. They answer the questions, type their name, and download the `.txt`.
5. They upload that text file. It contains their name, the date, and each answer.

The longer `lab.qmd` notebooks stay in each folder as optional guided analysis. The file to submit is the `.txt` from the tutorial.

```r
install.packages(c("learnr", "tidyverse"))
rmarkdown::run("tutorial.Rmd")
```

## Packages
All labs use only:
- `tidyverse`

The statistical functions used for inference/regression are from base R (`lm`, `t.test`, `confint`, `predict`).

## Data
All supplied data are synthetic teaching examples. They are not empirical evidence.

Rows in `country_indicators.csv` are labeled Country 01, Country 02, and so on. They are not real states. Do not describe a row as a fact about a real country. The `region` column is only a grouping label in this file.

## Lab sequence
- Lab 00 — Welcome to R (Session 1)
- Lab 01 — Causal Questions & Describing Data (Sessions 2–3)
- Lab 02 — Correlation (Sessions 4–5)
- Lab 03 — Regression for Description & Prediction (Sessions 6–7)
- Lab 04 — Probability Through Simulation (Sessions 9–10)
- Lab 05 — Estimation, Uncertainty & Hypothesis Testing (Sessions 11–12)
- Lab 06 — Reversion to the Mean & Correlation vs Causation (Sessions 13–14)
- Lab 07 — Randomized Experiments (Sessions 16–17)
- Lab 08 — Controlling for Confounders (Sessions 18–19)
- Lab 09 — Mechanisms (Session 20)
