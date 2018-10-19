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

prcp_prague[year > 1960]

prcp_athens[year > 1990 & year < 2000]

prcp_oslo[year == 1921]

prcp_oslo[feb > 50 & mar > 50]

prcp_oslo[feb > 50, feb]

prcp_oslo[feb > 50, year]

prcp_oslo[feb > 50, .(year, dec, jan, feb)]

prcp_prague[jun < 30 & jul < 30, .(year, jun, jul)]
