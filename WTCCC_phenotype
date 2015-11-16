setwd("H:/plink-1.07-dos/")
library(openxlsx)

#phenotype file for cases: 2040 individuals
fam <- read.table("UK.fam", header=F)
table(fam[,5]) #missing sex? No
table(fam[,6]) #case=3870;control=8430
pheno <- read.table("UK_pheno1-47.txt", header=T) #2040 cases with phenotypes
key <- read.xlsx("HK ID data decemeber 2014.xlsx", sheet="HK_ID_data_decemeber_2014", startRow=1)
test <- key[,1] == key[,4]
summary(test)
test <- key[,2] == key[,3]
summary(test)
test <- pheno[,1] %in% key[,1]
summary(test)
names(key)[1] <- names(pheno)[1]
pheno_new <- merge(key, pheno, by="Sample")
pheno_new <- pheno_new[,3:51]
id <- fam[,1:2]
names(pheno_new)[1] <- "IID"
names(id)[1] <- "FID"
names(id)[2] <- "IID"
pheno_tmp <- merge(id, pheno_new, by="IID")
pheno_new <- pheno_tmp[,c(2,1,4:50)]
names(pheno_new) #check whether phenotype order agrees with ab order?
#phenotype file for controls: 8430 individuals
control <- subset(fam, fam[,6]==1)
pheno_ctrl <- matrix(c(rep(1,8430*47)) ,nrow=8430, ncol=47)
pheno_ctrl <- cbind(control[,1:2], pheno_ctrl)
#phenotype file for WTCCC: 2040+8430=10470 individuals
names(pheno_ctrl) <- names(pheno_new)
pheno <- rbind(pheno_new, pheno_ctrl)
write.table(pheno, "WTCCC_pheno1-47.txt", quote=F, row.names=F, col.names=F, sep="\t")


