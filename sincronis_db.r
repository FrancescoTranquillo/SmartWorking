rm(list = ls())
library(tidyverse)
library(here)
library(readr)
library(esquisse)

ingclinicapsd <- read.csv("Downloads/ingclinicapsd.csv",
                           header = T,
                           stringsAsFactors = T)
head(ingclinicapsd)


reparti <-as.character(ingclinicapsd$Reparto)
piano <- str_extract(reparti,
                     pattern= "(\\d)")
blocco <- str_extract(reparti,
                      pattern = "(?<=\\d)[A-Z]")
reparto <- str_extract(reparti,
                       pattern = "(?<=\\/).*")

mappa <- tibble("Piano"=factor(piano), "Blocco"=blocco, "Reparti/Servizi"=reparto) %>% unique() %>% na.exclude()

blocco_A <- mappa[which(mappa$Blocco=="A"),c(1,3)]
blocco_B <- mappa[which(mappa$Blocco=="B"),c(1,3)]
blocco_C <- mappa[which(mappa$Blocco=="C"),c(1,3)]
blocco_E <- mappa[which(mappa$Blocco=="E"),c(1,3)]

spread(mappa, Piano, 'Reparti/Servizi')



