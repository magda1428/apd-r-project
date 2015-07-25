


cit1 <- read.csv("apddb_col.csv", sep=";", quote = "", 
                row.names = NULL, 
                stringsAsFactors = FALSE)
cit2 <- read.csv("apddb_col2.csv", sep=";", quote = "", 
                row.names = NULL, 
                stringsAsFactors = FALSE)

cit<-rbind(cit1,cit2[1:])

cit[cit=='brak']=NA
cit[cit=='(brak)']=NA
cit[cit=='(brak informacji)']=NA
cit$degree[cit$degree=="Licencjat"]=1
cit$degree[cit$degree=="Magisterium"]=2

cit$lang[cit$lang=="polski [PL]"]="pl"
cit$lang[cit$lang=="angielski [EN]"]="en"
