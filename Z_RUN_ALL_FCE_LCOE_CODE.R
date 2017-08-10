Z_RUN_ALL_FCE_LCOE_CODE <- function(){
	
	
	## source the functions
	source('A_change_all_xlsx_to_csv.R')
	source('B_make_min_cost_map_without_ext.R')
	source('C_make_min_cost_map_with_ext.R')
	source('D_make_min_cost_map_exclusions_without_ext.R')
	source('E_make_min_cost_map_exclusions_with_ext.R')
	
	## run the functions
	A_change_all_xlsx_to_csv()
	B_make_min_cost_map_without_ext()
	C_make_min_cost_map_with_ext()	D_make_min_cost_map_exclusions_without_ext()	E_make_min_cost_map_exclusions_with_ext()
	
}