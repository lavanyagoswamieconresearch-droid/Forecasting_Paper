
**# Country 1 - India

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="India"
tsset year
gen t = _n  
gen tt = 54
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share
estimates store dfuller

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro sin1 cos1, arima(1,0,3)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro sin1 cos1, ar(1) ma(2)
predict estimated3, xb
estat ic
tsline renewable_share estimated3

/*
arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro if tin(1965,2018), ar(1) ma(2) 
	estimates store myarma11
	  forecast create mymodel1, replace
		forecast estimates myarma11
			tsappend, add(12)
				forecast solve, prefix(arma11_) begin(2019) end(2024) static
				   tsline renewable_share arma11_renewable_share, xline(54)

estimates store arima
predict resids_renew, resid
wntestq resids_renew
estimates store wntestq
corrgram resids_renew

outreg2 [dfuller arima wntestq] using results.doc, replace word(2) addtop(Dickey-Fuller Test,ARIMA Estimation,White Noise Test) addnote(Note: This document contains the results of the Dickey-Fuller test, ARIMA estimation, and the white noise test for residuals.)
*/

**# Country 2 - Germany

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="Germany"
tsset year
gen t = _n  
summ t
gen tt = 33
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro, arima(1,0,3)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share gdppercapita, arima(1,0,3)
predict estimated3, xb
estat ic
tsline renewable_share estimated3
predict resids_renew, resid
wntestq resids_renew
corrgram resids_renew

**# Country 3 - United States

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="United States"
tsset year
gen t = _n  
summ t
gen tt = 36
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share L2.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro, arima(1,0,2)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro, arima(4,0,0)
predict estimated3, xb
estat ic
tsline renewable_share estimated3
predict resids_renew, resid
wntestq resids_renew
corrgram resids_renew

**# Country 4 - Japan

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="Japan"
tsset year
gen t = _n  
summ t
gen tt = 54
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share L2.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices elec_from_hydro, arima(2,0,1)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share crude_oil_prices elec_from_hydro sin1 cos1, ar(1 4)
predict estimated3, xb
estat ic
tsline renewable_share estimated3
predict resids_renew, resid
wntestq resids_renew
corrgram resids_renew

**# Country 5 - Brazil

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="Brazil"
tsset year
gen t = _n  
summ t
gen tt = 34
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share L2.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices solar_prices gdppercapita  elec_from_hydro, arima(2,0,0)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share crude_oil_prices solar_prices gdppercapita elec_from_hydro, arima(2,0,2)
predict estimated3, xb
estat ic
tsline renewable_share estimated3
predict resids_renew, resid
wntestq resids_renew
corrgram resids_renew

**# Country 6 - South Korea

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="South Korea"
tsset year
gen t = _n  
summ t
gen tt = 33
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share L2.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices solar_prices gdppercapita  elec_from_hydro, arima(1,0,2)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share crude_oil_prices solar_prices gdppercapita elec_from_hydro, arima(1,0,0)
predict estimated3, xb
estat ic
tsline renewable_share estimated3
predict resids_renew, resid
wntestq resids_renew
corrgram resids_renew

**# Country 7 - South Africa

use "E:\Ashoka_Textbooks\Spring 2024\Economic Forecasting and Analysis [ECO-3402]\Project\Data\Six_country_merged.dta", clear
keep if entity=="South Africa"
tsset year
gen t = _n  
gen tt = 48
** Generating Fourier series with frequency = 1
gen sin1 = sin(2*_pi*t/tt)
gen cos1 = cos(2*_pi*t/tt)
** Dickey-fuller test to check for unit root
dfuller renewable_share
dfuller d.renewable_share

**Basic fit controlling for structural break (smooth)
reg renewable_share L.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
predict estimated1, xb
estat ic

pac estimated1
ac estimated1

arimasoc d.renewable_share
arimasoc estimated1

arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro, arima(1,0,2)
predict estimated2, xb
estat ic

**final model after considering above + trial_and _error 
arima renewable_share crude_oil_prices elec_from_hydro, arima(1,0,0)
predict estimated3, xb
estat ic
predict resids_renew, resid
wntestq resids_renew
corrgram resids_renew
tsline renewable_share estimated3


outreg2 using arima_output.doc, replace

eststo clear
eststo output1: reg renewable_share L.renewable_share L2.renewable_share sin1 cos1 crude_oil_prices gdppercapita elec_from_hydro solar_prices wind_elec
eststo output2:arima renewable_share crude_oil_prices gdppercapita solar_prices elec_from_hydro sin1 cos1, arima(4,0,0)


esttab output* using "output_UnitedStates.csv", replace
