setwd("H:/plink_win64/")

pheno35 <- read.table("Merged_pheno1-35_case-ctrl.txt")
pheno27_eira <- read.table("EIRA_pheno27_case-ctrl.txt")
pheno27_narac <- read.table("NARAC_pheno27_case-ctrl.txt")
pheno35_wtccc <- subset(pheno35, pheno35[,2] %in% pheno27_eira[,2]==F & pheno35[,2] %in% pheno27_narac[,2]==F)
#10489 individuals, including some individuals not belong to wtccc(10470)
#2059 cases, including some cases not belong to wtccc(2040)
pheno16_wtccc <- pheno35_wtccc[,1:18]
pheno11_wtccc <- matrix(rep(0,10489*11), nrow=10489, ncol=11)
#all controls in WTCCC are set as "missing"
pheno27_wtccc <- cbind(pheno16_wtccc, pheno11_wtccc)
names(pheno27_wtccc) <- names(pheno27_eira)
pheno27 <- rbind(pheno27_eira, pheno27_wtccc, pheno27_narac)
write.table(pheno27, "Merged_pheno1-27_case-ctrl.txt", quote=F, row.names=F, col.names=F, sep="\t")
