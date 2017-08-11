# The-Full-Cost-of-Electricity-LCOE-maps
# Created by Joshua Daniel Rhodes, 2016

This repo holds the code needed to recreate the LCOE maps used in the Full Cost of Electricity Project. It assumes the user is familiar with R.

The first version of these maps are the same as found in this academic journal artice: http://www.sciencedirect.com/science/article/pii/S0301421516306875
	- All derivations should cite the above as the source

There is an online version of these maps that coudn be found here: http://calculators.energy.utexas.edu/lcoe_map/#/county/tech
	** note the change log on the map to indicate changes from the origional values found in the paper above.

Running the code: \
	1. The language used is R: https://cran.r-project.org/ \
	2. You will need the following R libraries to run the code: maps, mapproj, colorRamps, reshape \
	3. You can just run the Z_RUN_ALL_FCE_CODE.R function to run it all at the same time. \
	4. The first function (A_change_all_xlsx_to_csv.R) converts all the xlsx files in the LCOE_data_inputs folder to csv files to be read into R (you will need the command line tool in2csv installed on your computer for this, R based solutions are too slow for files of this size I have found). \
		4.1 You can change how the maps will look by first changing the xlsx files so that the values, i.e. CAPEX values, influcence the LCOE values \
	5. The next fuctions create the maps (from the newly created csv files) that are the Figures 2-4 and the first figure of the Supplimentary Information section of the above mentioned journal article. 


There are 4 base maps included in the prepackaged code above. The minimum cost technology map for 1) no avability zones and no externalities (known the code/data as LCOE1), 2) with avability zones and no externalities, 3) no avability zones and with externalitites (known in the code/data as LCOE3), and 4) with avability zones and with externalities.

Create custom maps from the code: \
	1. Edit the desired values in the xlsx files. \
	2. Edit the figure title code. \
		2.1 Example:  mtext(text = 'Scenario 1: without availability zones and without externalities', cex = 1.9, line = -1.25) #, col = 'white') \	
	3. Save all files \
	4. Run either the master code (Z_RUN_ALL_FCE_CODE.R), or the code for the single file that you wish to create.
		