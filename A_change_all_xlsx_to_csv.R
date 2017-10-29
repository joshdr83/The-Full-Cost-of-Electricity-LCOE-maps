A_change_all_xlsx_to_csv <- function(){
	
	wd <- getwd()
	setwd('LCOE_data_inputs')
	
	system(command = 'in2csv COAL_BIT.xlsx > COAL_BIT.csv')	system(command = 'in2csv COAL_SUB.xlsx > COAL_SUB.csv')	system(command = 'in2csv CSP.xlsx > CSP.csv')	system(command = 'in2csv NGCC.xlsx > NGCC.csv')	system(command = 'in2csv NGCT.xlsx > NGCT.csv')	system(command = 'in2csv NUKE.xlsx > NUKE.csv')	system(command = 'in2csv SOLAR_PV_RES.xlsx > SOLAR_PV_RES.csv')	system(command = 'in2csv SOLAR_PV_UTILITY.xlsx > SOLAR_PV_UTILITY.csv')	system(command = 'in2csv WIND_ON.xlsx > WIND_ON.csv')	system(command = 'in2csv COAL_BIT_CCS.xlsx > COAL_BIT_CCS.csv')	system(command = 'in2csv COAL_SUB_CCS.xlsx > COAL_SUB_CCS.csv')	system(command = 'in2csv NGCC_CCS.xlsx > NGCC_CCS.csv')
#	system(command = 'in2csv SOLAR_PV_UTILITY_low_finance.xlsx > SOLAR_PV_UTILITY_low_finance.csv')
#	system(command = 'in2csv WIND_ON_low_finance.xlsx > WIND_ON_low_finance.csv')
	
	
	setwd(wd)
	
}