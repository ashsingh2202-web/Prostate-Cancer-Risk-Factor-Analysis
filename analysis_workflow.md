# Statistical Analysis Workflow

## Software

SAS 9.4

---

## Data Preparation

The original dataset was imported into SAS and reviewed for completeness and consistency.

Data management procedures included:

* Variable validation
* Missing data assessment
* Creation of derived variables
* Transformation of PSA values using log10 transformation
* Categorization of Gleason scores into clinically meaningful groups

### Derived Variables

**Gleason Score Categories**

* GS1: Gleason 4–6
* GS2: Gleason 7
* GS3: Gleason 8–10

**Log-Transformed PSA**

A log10 transformation was applied to PSA values to improve distributional characteristics and model performance.

---

## Descriptive Analysis

Descriptive statistics were generated separately for prostate cancer cases and non-cases.

### Continuous Variables

Variables summarized included:

* Age at diagnosis
* PSA level
* Log-transformed PSA
* Prostate volume
* Gleason score

Summary measures included:

* Mean
* Standard deviation
* Median
* Minimum
* Maximum

### Categorical Variables

Variables summarized included:

* Race
* Digital Rectal Examination findings
* Capsular involvement
* Gleason score category

Frequency distributions and percentages were calculated for each group.

---

## Statistical Testing

### Continuous Variables

Group comparisons were performed using:

* Student's t-test
* Mann–Whitney U test

### Categorical Variables

Associations were evaluated using:

* Chi-square tests
* Fisher's Exact tests when appropriate

---

## Univariable Logistic Regression

Separate logistic regression models were developed for each predictor.

Variables evaluated included:

* Age at diagnosis
* PSA level
* Log-transformed PSA
* Prostate volume
* Race
* Digital Rectal Examination findings
* Capsular involvement
* Gleason score category

For each model, the following were estimated:

* Odds Ratio (OR)
* 95% Confidence Interval (CI)
* P-value

---

## Multivariable Logistic Regression

Two multivariable logistic regression models were developed.

### Model 1

Included predictors demonstrating statistical significance in univariable analyses.

### Model 2

Included all candidate predictors regardless of statistical significance.

Adjusted Odds Ratios (AORs), confidence intervals, and p-values were used to evaluate independent associations with prostate cancer status.

---

## Outcome

The primary outcome variable was prostate cancer status.

The analysis identified PSA level, digital rectal examination findings, and Gleason score category as the strongest predictors of prostate cancer in both univariable and multivariable models.

---

## Reproducibility Note

To protect academic integrity and avoid distribution of course-specific code, repository contents provide a high-level overview of the statistical workflow rather than complete SAS scripts. The workflow accurately reflects the analyses conducted in the original project.
