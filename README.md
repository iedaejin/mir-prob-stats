# Probability and Statistics — MIR Labs

Labs for **Probability and Statistics (for Policy Analysis)**, Master in International Relations (MIR), SPEGA, IE University, Term 1, SEP-2026 S-2.

Each `Lab_*` folder is one Posit Cloud assignment. Upload that folder only.

## What is in a lab folder

| File | Use |
|---|---|
| `tutorial.Rmd` | Open it and click **Run Document**. Answer the questions, type your name, and download the `.txt`. That file is the submission. |
| `lab.qmd` | Optional longer notebook. Render it to HTML to read the analysis. Do not submit it. |
| `lab_submission.R` | Leave it in the folder. The tutorial loads it. Do not run it yourself. |
| `data/` | The dataset for these sessions, plus `SOURCE.txt`. |

```r
install.packages(c("learnr", "tidyverse"))
rmarkdown::run("tutorial.Rmd")
```

Inference and regression use base R (`lm`, `t.test`, `confint`, `predict`).

## Labs

Sessions 8, 15, and 21–22 are exams and have no folder.

| Folder | Sessions | Practice | Data |
|---|---|---|---|
| `Lab_00_Welcome_to_R` | 1 | Import, inspect rows, summarise, one plot | `UNpop.csv` |
| `Lab_01_Causal_Questions_and_Description` | 2–3 | A causal question versus a description | `resume.csv` |
| `Lab_02_Correlation` | 4–5 | A scatter plot and a correlation | `congress.csv` |
| `Lab_03_Regression` | 6–7 | One least-squares line as description and prediction | `face.csv` |
| `Lab_04_Probability` | 9–10 | A long-run share, and one conditional probability | `FLVoters.csv` |
| `Lab_05_Inference` | 11–12 | A mean, an interval, and a p-value | `STAR.csv` |
| `Lab_06_Reversion_and_Causation` | 13–14 | Reversion to the mean across two elections | `pres08.csv`, `pres12.csv` |
| `Lab_07_Randomized_Experiments` | 16–17 | A difference in means as an effect of assignment | `social.csv` |
| `Lab_08_Confounding` | 18–19 | The same coefficient before and after covariates | `social.csv` |
| `Lab_09_Mechanisms` | 20 | The effect is not the same size in every subgroup | `social.csv` |

The files are the datasets named for those sessions in [mir-prob-stats-QQS](https://github.com/iedaejin/mir-prob-stats-QQS), copied unchanged from [kosukeimai/qss](https://github.com/kosukeimai/qss) (Imai and Webb Williams, *Quantitative Social Science*, Princeton University Press). Copyright in the data remains with the authors, under [GPL-2.0](https://github.com/kosukeimai/qss/blob/master/LICENSE). See `LICENSE` and each lab's `data/SOURCE.txt`. The lab text is course material. It is not a work of the QSS authors.

`shared_data/` and `R/` are copies for the repository. A Posit assignment does not need them.
