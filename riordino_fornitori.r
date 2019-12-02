
lista_fornitori <- c("Movi","GE", "Bracco", "Medigas", "Esaote", "Philips","Siemens")
lista_codici <- c("M123", "G123", "B123", "Me123", "E123", "P123", "S123")

tabella <- tibble("Fornitori"=lista_fornitori, "Codici"=lista_codici)

lista1 <- sample(lista_fornitori, size = length(lista_fornitori))

lista2 <- sapply(lista1, function(fornitore)
  as.character(tabella[which(tabella$Fornitori==fornitore),2]))

tabella_ordinata <- tibble(lista1, lista2)

write_excel_csv2(tabella_ordinata, "Downloads/fornitori.xls")