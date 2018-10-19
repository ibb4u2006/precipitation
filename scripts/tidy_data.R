load('./data/precip_month.rdata')

prcp_oslo_tidy <- melt(prcp_oslo, id.vars = 'year', value.factor = TRUE)
colnames(prcp_oslo_tidy)[2:3] <- c('month', 'prcp')
setorder(prcp_oslo_tidy, year, month)

prcp_prague_tidy <- melt(prcp_oslo, id.vars = 'year', value.factor = TRUE)
colnames(prcp_prague_tidy)[2:3] <- c('month', 'prcp')

prcp_athens_tidy <- melt(prcp_oslo, id.vars = 'year', value.factor = TRUE)
colnames(prcp_athens_tidy)[2:3] <- c('month', 'prcp')

prcp_oslo_tidy[, station := factor('oslo')]
prcp_athens_tidy[, station := factor('athens')]
prcp_prague_tidy[, station := factor('prague')]

prcp_stations <- rbind(prcp_prague_tidy, prcp_athens_tidy, prcp_oslo_tidy)
prcp_stations[is.na(prcp)]

prcp_stations <- prcp_stations[complete.cases(prcp_stations)]
save(prcp_stations, file = ('./data/precip_stations.rdata'))
