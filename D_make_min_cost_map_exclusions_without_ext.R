D_make_min_cost_map_exclusions_without_ext <- function(){
	
	
	current_wd <- getwd()
	
	
	library(maps)
	library(mapproj)
	library(colorRamps)
	library(reshape)
	
	data(county.fips)
	
	## Read in all the data
	coal_bit <- read.csv('LCOE_data_inputs/COAL_BIT.csv')
	coal_sub <- read.csv('LCOE_data_inputs/COAL_SUB.csv')
	ngcc <- read.csv('LCOE_data_inputs/NGCC.csv')
	ngct <- read.csv('LCOE_data_inputs/NGCT.csv')
	nuke <- read.csv('LCOE_data_inputs/NUKE.csv')
	pv_res <- read.csv('LCOE_data_inputs/SOLAR_PV_RES.csv')
	pv_util <- read.csv('LCOE_data_inputs/SOLAR_PV_UTILITY.csv')
	wind <- read.csv('LCOE_data_inputs/WIND_ON.csv')
	csp <- read.csv('LCOE_data_inputs/CSP.csv')
	coal_bit_ccs <- read.csv('LCOE_data_inputs/COAL_BIT_CCS.csv')
	coal_sub_ccs <- read.csv('LCOE_data_inputs/COAL_SUB_CCS.csv')
	ngcc_ccs <- read.csv('LCOE_data_inputs/NGCC_CCS.csv')
	
	## Read in the exclusion data
	coal_ex <- read.csv('LCOE_data_inputs/GIS_coal_ccs.csv')  ## now using CCS exclusions since coal has to be at least partial
	coal_ex[coal_ex == 0] <- NA
	ngcc_ex <- read.csv('LCOE_data_inputs/GIS_ngcc_no_ccs.csv')
	ngcc_ex[ngcc_ex == 0] <- NA
	ngct_ex <- read.csv('LCOE_data_inputs/GIS_ngct.csv')
	ngct_ex[ngct_ex == 0] <- NA
	nuke_ex <- read.csv('LCOE_data_inputs/GIS_nuke.csv')
	nuke_ex[nuke_ex == 0] <- NA
	pv_wind_ex <- read.csv('LCOE_data_inputs/GIS_solar_wind.csv')
	pv_wind_ex[pv_wind_ex == 0] <- NA
	csp_ex <- read.csv('LCOE_data_inputs/GIS_csp.csv')
	csp_ex[csp_ex == 0] <- NA
	
	coal_ccs_ex <- read.csv('LCOE_data_inputs/GIS_coal_ccs.csv')
	coal_ccs_ex[coal_ccs_ex == 0] <- NA
	coal_ccs_ex <- merge(x = coal_ex, y = coal_ccs_ex, by = 'FIPS', all.x = T)
	coal_ccs_ex$can_build <- coal_ccs_ex$can_build.x * coal_ccs_ex$can_build.y
	coal_ccs_ex <- coal_ccs_ex[c('FIPS', 'can_build')]
	ngcc_ccs_ex <- read.csv('LCOE_data_inputs/GIS_ngcc_ccs.csv')
	ngcc_ccs_ex[ngcc_ccs_ex == 0] <- NA
	ngcc_ccs_ex <- merge(x = ngcc_ex, y = ngcc_ccs_ex, by = 'FIPS', all.x = T)
	ngcc_ccs_ex$can_build <- ngcc_ccs_ex$can_build.x * ngcc_ccs_ex$can_build.y
	ngcc_ccs_ex <- ngcc_ccs_ex[c('FIPS', 'can_build')]
	
	

	
	red1 <- rgb(255/255,87/255,20/255)
	blue1 <- rgb(27/255,231/255,255/255) 
	green1 <- rgb(110/255,235/255,131/255)
	orange1 <- rgb(232/255,170/255,20/255)
	yellow1 <- rgb(228/255,255/255,26/255)
	purple1 <- rgb(140/255, 59/255, 108/255)
	
	hotpurple <- rgb(236/255, 5/255, 132/255)
	brown1 <- rgb(125/255, 51/255, 46/255)
	oliveblue <- rgb(60/255, 117/255, 96/255)
	lightolive <- rgb(217/255, 208/255, 171/255)
	weirdblue <- rgb(132/255, 138/255, 255/255)
	darkbluegreen <- rgb(53/255, 79/255, 82/255)
	gray <-  rgb(128/255, 128/255, 128/255)

## LCOE 1 ###

	coal_bit3 <- coal_bit[c('FIPS', 'LCOE1')]
	coal_bit3 <- merge(x = coal_bit3, y = coal_ex, by = 'FIPS', all.x = T)
	coal_bit3$LCOE1b <- coal_bit3$LCOE1 * coal_bit3$can_build
	coal_bit3 <- coal_bit3[c('FIPS', 'LCOE1b')]	
		
	coal_sub3 <- coal_sub[c('FIPS', 'LCOE1')]
	coal_sub3 <- merge(x = coal_sub3, y = coal_ex, by = 'FIPS', all.x = T)
	coal_sub3$LCOE1b <- coal_sub3$LCOE1 * coal_sub3$can_build
	coal_sub3 <- coal_sub3[c('FIPS', 'LCOE1b')]
	
	ngcc3 <- ngcc[c('FIPS', 'LCOE1')]
	ngcc3 <- merge(x = ngcc3, y = ngcc_ex, by = 'FIPS', all.x = T)
	ngcc3$LCOE1b <- ngcc3$LCOE1 * ngcc3$can_build
	ngcc3 <- ngcc3[c('FIPS', 'LCOE1b')]
	
	
	ngct3 <- ngct[c('FIPS', 'LCOE1')]
	ngct3 <- merge(x = ngct3, y = ngct_ex, by = 'FIPS', all.x = T)
	ngct3$LCOE1b <- ngct3$LCOE1 * ngct3$can_build
	ngct3 <- ngct3[c('FIPS', 'LCOE1b')]
	
	nuke3 <- nuke[c('FIPS', 'LCOE1')]
	nuke3 <- merge(x = nuke3, y = nuke_ex, by = 'FIPS', all.x = T)
	nuke3$LCOE1b <- nuke3$LCOE1 * nuke3$can_build
	nuke3 <- nuke3[c('FIPS', 'LCOE1b')]
	
	pv_res3 <- pv_res[c('FIPS', 'LCOE1')]
	
	pv_util3 <- pv_util[c('FIPS', 'LCOE1')]
	pv_util3 <- merge(x = pv_util3, y = pv_wind_ex, by = 'FIPS', all.x = T)
	pv_util3$LCOE1b <- pv_util3$LCOE1 * pv_util3$can_build
	pv_util3 <- pv_util3[c('FIPS', 'LCOE1b')]
	
	wind3 <- wind[c('FIPS', 'LCOE1')]
	wind3 <- merge(x = wind3, y = pv_wind_ex, by = 'FIPS', all.x = T)
	wind3$LCOE1b <- wind3$LCOE1 * wind3$can_build
	wind3 <- wind3[c('FIPS', 'LCOE1b')]
	
	csp3 <- csp[c('FIPS', 'LCOE1')]
	csp3 <- merge(x = csp3, y = csp_ex, by = 'FIPS', all.x = T)
	csp3$LCOE1b <- csp3$LCOE1 * csp3$can_build
	csp3 <- csp3[c('FIPS', 'LCOE1b')]
	
	coal_bit3_ccs <- coal_bit_ccs[c('FIPS', 'LCOE1')]
	coal_bit3_ccs <- merge(x = coal_bit3_ccs, y = coal_ccs_ex, by = 'FIPS', all.x = T)
	coal_bit3_ccs$LCOE1b <- coal_bit3_ccs$LCOE1 * coal_bit3_ccs$can_build
	coal_bit3_ccs <- coal_bit3_ccs[c('FIPS', 'LCOE1b')]
	
	coal_sub3_ccs <- coal_sub_ccs[c('FIPS', 'LCOE1')]
	coal_sub3_ccs <- merge(x = coal_sub3_ccs, y = coal_ccs_ex, by = 'FIPS', all.x = T)
	coal_sub3_ccs$LCOE1b <- coal_sub3_ccs$LCOE1 * coal_sub3_ccs$can_build
	coal_sub3_ccs <- coal_sub3_ccs[c('FIPS', 'LCOE1b')]
	
	ngcc3_ccs <- ngcc_ccs[c('FIPS', 'LCOE1')]
	ngcc3_ccs <- merge(x = ngcc3_ccs, y = ngcc_ccs_ex, by = 'FIPS', all.x = T)
	ngcc3_ccs$LCOE1b <- ngcc3_ccs$LCOE1 * ngcc3_ccs$can_build
	ngcc3_ccs <- ngcc3_ccs[c('FIPS', 'LCOE1b')]
	
	
	names(coal_bit3) <- c('FIPS', 'coal_bit')
	names(coal_sub3) <- c('FIPS', 'coal_sub')
	names(ngcc3) <- c('FIPS', 'ngcc')
	names(ngct3) <- c('FIPS', 'ngct')
	names(nuke3) <- c('FIPS', 'nuke')
	names(pv_res3) <- c('FIPS', 'pv_res')
	names(pv_util3) <- c('FIPS', 'pv_util')
	names(wind3) <- c('FIPS', 'wind')
	names(csp3) <- c('FIPS', 'csp')
	names(coal_bit3_ccs) <- c('FIPS', 'coal_bit_ccs')
	names(coal_sub3_ccs) <- c('FIPS', 'coal_sub_ccs')
	names(ngcc3_ccs) <- c('FIPS', 'ngcc_ccs')
	
	m1 <- merge(x = coal_bit3, y = coal_sub3, by = 'FIPS')
	m2 <- merge(x = m1, y = ngcc3, by = 'FIPS')
	m3 <- merge(x = m2, y = ngct3, by = 'FIPS')
	m10 <- merge(x = m3, y = nuke3, by = 'FIPS')
	m5 <- merge(x = m10, y = pv_res3, by = 'FIPS')
	m6 <- merge(x = m5, y = pv_util3, by = 'FIPS')
	m7 <- merge(x = m6, y = wind3, by = 'FIPS')
	m7a <- merge(x = m7, y = coal_bit3_ccs, by = 'FIPS')
	m7b <- merge(x = m7a, y = coal_sub3_ccs, by = 'FIPS')
	m7c <- merge(x = m7b, y = ngcc3_ccs, by = 'FIPS')
	m8 <- merge(x = m7c, y = csp3, by = 'FIPS')
		
	melt3 <- melt(data = m8, id = 'FIPS')
	melt3 <- melt3[complete.cases(melt3),]	
	
	
	agg3 <- aggregate(melt3$value, by = list(melt3$FIPS), FUN = min)
	merge3 <- merge(x = agg3, y = melt3, by.x = c('Group.1', 'x'), by.y = c('FIPS', 'value'))
	names(merge3) <- c('FIPS', 'LCOE1', 'tech')
	final3 <- merge3[!duplicated(merge3$FIPS),]
	
	## Color match for min-cost map	
	cf <- as.data.frame(cbind(c('coal_bit', 'coal_bit_ccs',	'coal_sub',	'coal_sub_ccs', 'csp', 'ngcc', 'ngcc_ccs', 'ngct', 'nuke', 'pv_res', 'pv_util', 'wind'), c(yellow1, darkbluegreen, orange1, lightolive, weirdblue, red1, brown1, hotpurple, blue1, gray, purple1, green1)))
	final3 <- merge(x = final3, y = cf, by.x = 'tech', by.y = 'V1')
	tech3 <- final3
	names(tech3) <- c('tech' , 'FIPS' ,'LCOE1' , 'color')
	tech_lcoe <- tech3
	cnty.fips <- county.fips$fips[match(map("county", plot=FALSE)$names, county.fips$polyname)]
  	tech_colorsmatched3 <- as.character(tech3$color[match(cnty.fips, tech3$FIPS)])

  
  ###### MAKE SINGLE CHART ######
  
  	setwd('Figures')
  
  pdf(file = paste('Min_cost_map_without_ext_exclusions.pdf', sep = ''), height = 7, width = 9)
  par(mar=c(0,0,1,0)) #, bg = 'black', col = 'white')
  
  map("county", col = tech_colorsmatched3, fill = TRUE, resolution = 0,
    lty = 0, projection = "polyconic")
    
  map("county", col = "gray", fill = FALSE, add = TRUE, lty = 1, lwd = 0.2,
    projection="polyconic")
  map("state", col = "black", fill = FALSE, add = TRUE, lty = 1, lwd = 0.2,
    projection="polyconic")  
  mtext(text = 'Scenario 4: with availability zones and without externalities', cex = 2, line = -1.25) #, col = 'white')
  mtext(text = 'Copyright Joshua Rhodes, Energy Institute, The Univeristy of Texas at Austin', side = 4, line = -1.5, cex = 0.75)
    
	  legend('bottom', legend = c(paste('Coal (BIT) (n = ', as.character(dim(tech3[tech3$tech == 'coal_bit',])[1]), ')', sep = ''), paste('Coal (BIT) CCS (n = ', as.character(dim(tech3[tech3$tech == 'coal_bit_ccs',])[1]), ')', sep = ''), paste('Coal (SUB) (n = ', as.character(dim(tech3[tech3$tech == 'coal_sub',])[1]), ')', sep = ''), paste('Coal (SUB) CCS (n = ', as.character(dim(tech3[tech3$tech == 'coal_sub_ccs',])[1]), ')', sep = ''), paste('CSP (n = ', as.character(dim(tech3[tech3$tech == 'csp',])[1]), ')', sep = ''), paste('NGCC (n = ', as.character(dim(tech3[tech3$tech == 'ngcc',])[1]), ')', sep = ''), paste('NGCC CCS (n = ', as.character(dim(tech3[tech3$tech == 'ngcc_ccs',])[1]), ')', sep = ''), paste('NGCT (n = ', as.character(dim(tech3[tech3$tech == 'ngct',])[1]), ')', sep = ''), paste('Nuclear (n = ', as.character(dim(tech3[tech3$tech == 'nuke',])[1]), ')', sep = ''), paste('Solar PV, resid. (n = ', as.character(dim(tech3[tech3$tech == 'pv_res',])[1]), ')', sep = ''), paste('Solar PV, utility (n = ', as.character(dim(tech3[tech3$tech == 'pv_util',])[1]), ')', sep = ''), paste('Wind (n = ', as.character(dim(tech3[tech3$tech == 'wind',])[1]), ')', sep = '')), fill = c(yellow1, darkbluegreen, orange1, lightolive, weirdblue, red1, brown1, hotpurple, blue1, gray, purple1, green1), ncol = 4, bty = 'n', cex = 0.9)
	    
  dev.off()	

  setwd(current_wd)  
 
 }