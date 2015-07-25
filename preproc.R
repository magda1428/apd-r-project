
cit1 <- read.csv("apddb_x1.csv", sep=";", quote = "", 
                row.names = NULL, 
                stringsAsFactors = FALSE)
cit2 <- read.csv("apddb_x2.csv", sep=";", quote = "", 
                row.names = NULL, header=TRUE,
                stringsAsFactors = FALSE)

cit<-rbind(cit1,cit2)

cit[cit=='brak']=NA
cit[cit=='(brak)']=NA
cit[cit=='(brak informacji)']=NA
cit$degree[cit$degree=="Licencjat"]=1
cit$degree[cit$degree=="Magisterium"]=2
cit<-transform(cit, degree=as.numeric(degree))

cit$lang[cit$lang=="polski [PL]"]="pl"
cit$lang[cit$lang=="angielski [EN]"]="en"

#bachelor fields
idxs = grepl("Licencjat z fizyki",cit$field)
cit$field[idxs]="fiz"
idxs = grepl("Licencjat z zastosowań fizyki",cit$field)
cit$field[idxs]="zfbm"
idxs = grepl("Licencjat z astronomii",cit$field)
cit$field[idxs]="ast"
idxs = grepl("Licencjat z inżynierii nano",cit$field)
cit$field[idxs]="in"
#master fields
idxs = grepl("Magisterium z fizyki",cit$field)
cit$field[idxs]="fiz"
idxs = grepl("Magisterium na kierunku fizyka",cit$field)
cit$field[idxs]="fiz"
idxs = grepl("Magisterium na kier. fizyka",cit$field)
cit$field[idxs]="fiz"
idxs = grepl("Magisterium z zastosowań fizyki",cit$field)
cit$field[idxs]="zfbm"
idxs = grepl("Magisterium z astronomii",cit$field)
cit$field[idxs]="ast"
idxs = grepl("Magisterium z inżynierii nano",cit$field)
cit$field[idxs]="in"

cit<-cit[-which((nchar(cit$field)>4)),]
cit<-cit[-which((nchar(cit$field)<2)),]
cit<-cit[-which(is.na(cit$field)),]

# name to gender

# date string to date format
as.Date("11 sty 2012 08:30:00","%d %b %y")
substring