library(data.table)

dir.create('data')
dir.create('data/raw')
dir.create('results')
dir.create('scripts')
list.files()


download.file('https://climexp.knmi.nl/data/pa11518.dat', './data/raw/precip_prague.dat')
download.file('https://climexp.knmi.nl/data/pa16714.dat', './data/raw/precip_athens.dat')
download.file('https://climexp.knmi.nl/data/pa1489.2.dat', './data/raw/precip_oslo.dat')

prcp_prague <- read.table('./data/raw/precip_prague.dat')
prcp_athens <- read.table('./data/raw/precip_athens.dat')
prcp_oslo <- read.table('./data/raw/precip_oslo.dat')

prcp_prague <- data.table(prcp_prague)
prcp_athens <- data.table(prcp_athens)
prcp_oslo <- data.table(prcp_oslo)

c_names <- c("year", "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec")
colnames(prcp_prague) <- c_names
colnames(prcp_athens) <- c_names
colnames(prcp_oslo) <- c_names

save(prcp_athens, prcp_oslo, prcp_prague, file = ('./data/scripts/data_prep.R') )
