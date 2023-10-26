all: Boxplot_age.png Boxplot_age_smoke.png Hist_smoke_cancer.png

Boxplot_age.png: Dataset_load_cleaning.R figure1.R
	Rscript Dataset_load_cleaning.R
	Rscript figure1.R
	
Boxplot_age_smoke.png: Dataset_load_cleaning.R figure2.R
	Rscript Dataset_load_cleaning.R
	Rscript figure2.R
	
Hist_smoke_cancer.png: Dataset_load_cleaning.R figure3.R
	Rscript Dataset_load_cleaning.R
	Rscript figure3.R