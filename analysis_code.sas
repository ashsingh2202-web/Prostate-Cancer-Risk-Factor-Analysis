### Project: Prostate Cancer Risk Factor Analysis

### Researcher: Ashima Singh, MPH

### Purpose: Identify clinical predictors of prostate cancer

### Software: SAS 9.4

proc import datafile="dataset.csv"
out=prostate_data
dbms=csv
replace;
getnames=yes;
run;

proc contents data=prostate_data;
run;

### Data Preparation

data prostate_analysis;
set prostate_data;

```
if Gleason in (4,5,6) then GS_n=1;
else if Gleason=7 then GS_n=2;
else if Gleason in (8,9,10) then GS_n=3;

if PSA > 0 then log10PSA = log10(PSA);
```

run;

### Descriptive Statistics

proc means data=prostate_analysis
n mean std median min max;
class PC;
var agedx log10PSA Vol;
run;

proc freq data=prostate_analysis;
tables PC*(race Dpros Dcaps GS_n) / chisq;
run;

proc ttest data=prostate_analysis;
class PC;
var agedx log10PSA Vol;
run;

proc npar1way data=prostate_analysis wilcoxon;
class PC;
var agedx log10PSA Vol;
run;

### Univariable Logistic Regression

proc logistic data=prostate_analysis descending;
model PC = agedx;
run;

proc logistic data=prostate_analysis descending;
model PC = log10PSA;
run;

proc logistic data=prostate_analysis descending;
model PC = Vol;
run;

proc logistic data=prostate_analysis descending;
class race(ref='1') / param=ref;
model PC = race;
run;

proc logistic data=prostate_analysis descending;
class Dpros(ref='1') / param=ref;
model PC = Dpros;
run;

proc logistic data=prostate_analysis descending;
class Dcaps(ref='1') / param=ref;
model PC = Dcaps;
run;

proc logistic data=prostate_analysis descending;
class GS_n(ref='1') / param=ref;
model PC = GS_n;
run;

### Multivariable Logistic Regression

### Model A: Significant Predictors

proc logistic data=prostate_analysis descending;
class Dpros(ref='1')
Dcaps(ref='1')
GS_n(ref='1') / param=ref;

```
model PC = Vol Dpros Dcaps log10PSA GS_n;
```

run;

### Model B: Full Model

proc logistic data=prostate_analysis descending;
class race(ref='1')
Dpros(ref='1')
Dcaps(ref='1')
GS_n(ref='1') / param=ref;

```
model PC = agedx race Dpros Dcaps log10PSA Vol GS_n;
```

run;

### End of Analysis
