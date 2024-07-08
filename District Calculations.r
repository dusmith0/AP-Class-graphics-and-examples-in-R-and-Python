#### Takes imput for files from two different District Assessments and assesses their combined scales grade. 

library(readxl)
Tdist <- read_excel("C:/Users/dustin.smith/Documents/Codes/R/R-Path Files/2022_2023 DAs/ExportView (30).xlsx")
Ddist <- read_excel("C:/Users/dustin.smith/Documents/Codes/R/R-Path Files/2022_2023 DAs/ExportView (31).xlsx")

#### Designed to work on two averaged scores files set as Ddist and Tdist
finalscore2 <- function(pre,post,adj){
	colnames(Ddist)[8]<- "PercentScoreD"
	colnames(Tdist)[7]<- "PercentScoreT"
	df <- merge(Tdist[c(1,7)],Ddist[c(1,8)],all=TRUE,na="0")
	df$Final <- c(((df$PercentScoreD+adj)+(df$PercentScoreT+adj)/2))
	df$AdjGrade <- ifelse(df$Final<.36, 65, ifelse(.39 <= df$Final | df$Final <62, 75, ifelse(.62<= df$Final | df$Final <.77, 85, 95)))
}

#### General excel files (Goes District then T-test)
finalscore2 <- function(pre,post,adj){
	colnames(pre)[8]<- "PercentScoreD"
	colnames(post)[7]<- "PercentScoreT"
	df <- merge(post[c(1,7)],pre[c(1,8)],all=TRUE,na="0")
	df$Final <- c((((df$PercentScoreD+adj)+(df$PercentScoreT+adj))/2))
	df$AdjGrade <- ifelse(df$Final<.36, 65, ifelse((df$Final <.62), 75, ifelse((df$Final <.77), 85, 95)))
return(df)}

#### Designed for a single score, it is set for two different hard coded sections where the percent score is.
finalscore <- function(test){
	colnames(Ddist)[8]<- "PercentScore"
	#colnames(Tdist)[7]<- "PercentScore"#
	df <- test[c(1,7)]
	#df <- test[c(1,8)]#
	df$AdjGrade <- ifelse(df$PercentScore<.36, 65, ifelse(.39 <= df$PercentScore | df$PercentScore <62, 75, ifelse(.62<= df$PercentScore | df$PercentScore <.77, 85, 95)))
}
	


