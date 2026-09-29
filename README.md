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

Each lab uses the real dataset named for its sessions in [mir-prob-stats-QQS](https://github.com/iedaejin/mir-prob-stats-QQS). The files are copied unchanged from [kosukeimai/qss](https://github.com/kosukeimai/qss), the supplementary materials for Kosuke Imai and Nora Webb Williams, *Quantitative Social Science: An Introduction in tidyverse* (Princeton University Press).

Copyright in those files remains with the authors. They are included under the [GNU General Public License, version 2](https://github.com/kosukeimai/qss/blob/master/LICENSE); see `LICENSE`. A `data/SOURCE.txt` in each lab repeats that notice so a folder uploaded to Posit Cloud still carries it. The lab text and tutorials are course material for this MIR course. They are not a work of the QSS authors.

| Lab | File | QSS |
|---|---|---|
| 00 | `UNpop.csv` | Ch. 1 |
| 01 | `resume.csv` | 2.1–2.3 |
| 02 | `congress.csv` | 3.6–3.7 |
| 03 | `face.csv` | 4.2 |
| 04 | `FLVoters.csv` | 6.2 |
| 05 | `STAR.csv` | 7.1 |
| 06 | `pres08.csv`, `pres12.csv` | 4.2.4 |
| 07–09 | `social.csv` | 2.4, 4.4.1, 4.4.2 |

Copies also sit in `shared_data/`.

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
