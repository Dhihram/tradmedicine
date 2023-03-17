 power oneproportion 0.125 0.014, n(10255) power of test
/////*********
clear all
set more off
cd "E:\proposal_thesis"
use "E:\proposal_thesis\afterdefence2.dta"

*description*
des

*missing data*
mdesc


*summarize*
su
sum

*sample size*
count
*/// 10,325

duplicates report pidlink
duplicates drop pidlink,force
count

count
drop if pidlink == ""
gen id= pidlink  //gen new variable for id 
drop pidlink
rename id pidlink

sort pidlink
list



gen id = _n
drop pidlink
rename id pidlink

gen idp = pidlink if ps012new ==1  //for case =1  control = 0 --->missing
replace idp = idp[_n-1] if idp == .
destring idp, replace

proportion yb


*===========================================================
 *Table I crude analysis  outcome vs one independent variable
 *============================================================
 *****  remameber match with age so donot add age in the analysis


**otcome = traditional and herbal medicine
**0= no,1= yes 
tab ps012
gen ps012new=.
replace ps012new= 0 if ps012==3
replace ps012new= 1 if ps012==1
tab ps012new

proportion ps012new
tab ps012new yb,col
clogit yb ps012new, group(idp) or

	**socio-demography

* 1= Generation X and 0 = Millennial
tab dob_yr
gen yb=.
replace yb = 2 if dob_yr<=1981
replace yb = 1 if dob_yr>=1982
tab yb

*1. Gender (1=FEMALE 2=MALE)
tab sex

gen sex2=.
replace sex2 =1 if sex==3
replace sex2 =2 if sex==1
tab sex2


*2. Marital Status, 1= unmarried, 2= married
tab marstat
gen marstat2=.
replace marstat2=2 if marstat == 2
replace marstat2=1 if marstat == 1
replace marstat2=1 if marstat == 3
replace marstat2=1 if marstat == 4
replace marstat2=1 if marstat == 5
replace marstat2=1 if marstat == 6
tab marstat2

*3. ethinicity. 1= jawa, 2= sunda, 3= bali, 4 =Other south sumareta, 5= batak
    *6= Bugis, 7= madura, 8= Sasak, 9= Minang, 10= Banjar, 11= Bima-Dompu, 12= Makassar
    *13= Betawi, 14 = others 
tab dl01f
gen ethnic=.

replace ethnic = 1 if dl01f =="A"
replace ethnic = 2 if dl01f =="B"
replace ethnic = 2 if dl01f =="E1"
replace ethnic = 2 if dl01f =="D1"
replace ethnic = 3 if dl01f =="C"
replace ethnic = 4 if dl01f =="C1"
replace ethnic = 4 if dl01f =="T"
replace ethnic = 4 if dl01f =="S"
replace ethnic = 4 if dl01f =="N"
replace ethnic = 4 if dl01f =="B1"
replace ethnic = 5 if dl01f =="D"
replace ethnic = 5 if dl01f =="M"
replace ethnic = 6 if dl01f =="E"
replace ethnic = 6 if dl01f =="P"
replace ethnic = 6 if dl01f =="F1"
replace ethnic = 6 if dl01f =="A1"
replace ethnic = 7 if dl01f =="G"
replace ethnic = 8 if dl01f =="H"
replace ethnic = 9 if dl01f =="I"
replace ethnic = 10 if dl01f =="J"
replace ethnic = 10 if dl01f =="R"
replace ethnic = 10 if dl01f =="G1"
replace ethnic = 11 if dl01f =="K"
replace ethnic = 11 if dl01f =="O"
replace ethnic = 12 if dl01f =="L"
replace ethnic = 13 if dl01f =="Q"

replace ethnic = 14 if dl01f =="V"
replace ethnic = 14 if dl01f =="A A1V"
replace ethnic = 14 if dl01f =="A B"
replace ethnic = 14 if dl01f =="A B H"
replace ethnic = 14 if dl01f =="A C1"
replace ethnic = 14 if dl01f =="A D1"
replace ethnic = 14 if dl01f =="A D"
replace ethnic = 14 if dl01f =="A E"
replace ethnic = 14 if dl01f =="A G"
replace ethnic = 14 if dl01f =="A I"
replace ethnic = 14 if dl01f =="A J"
replace ethnic = 14 if dl01f =="A K"
replace ethnic = 14 if dl01f =="A L"
replace ethnic = 14 if dl01f =="A N"
replace ethnic = 14 if dl01f =="A Q"
replace ethnic = 14 if dl01f =="A R"
replace ethnic = 14 if dl01f =="A S"
replace ethnic = 14 if dl01f =="A U"
replace ethnic = 14 if dl01f =="A V"
replace ethnic = 14 if dl01f =="B E1"
replace ethnic = 14 if dl01f =="B L"
replace ethnic = 14 if dl01f =="B Q"
replace ethnic = 14 if dl01f =="B Q S"
replace ethnic = 14 if dl01f =="B S"
replace ethnic = 14 if dl01f =="D I"
replace ethnic = 14 if dl01f =="D S"
replace ethnic = 14 if dl01f =="D V"
replace ethnic = 14 if dl01f =="E J"
replace ethnic = 14 if dl01f =="E L"
replace ethnic = 14 if dl01f =="F I"
replace ethnic = 14 if dl01f =="G S"
replace ethnic = 14 if dl01f =="H I"
replace ethnic = 14 if dl01f =="H O"
replace ethnic = 14 if dl01f =="H Q"
replace ethnic = 14 if dl01f =="H S"
replace ethnic = 14 if dl01f =="I Q"
replace ethnic = 14 if dl01f =="G S"
replace ethnic = 14 if dl01f =="J Q"
replace ethnic = 14 if dl01f =="N C1"
replace ethnic = 14 if dl01f =="S C1"
replace ethnic = 14 if dl01f =="F"
replace ethnic = 14 if dl01f =="U"

tab ethnic
*1= others, 2= Javanese, 3= sundanese
gen ethnic2=.
replace ethnic2= 2 if ethnic == 1
replace ethnic2= 3 if ethnic == 2
replace ethnic2= 1 if ethnic == 3
replace ethnic2= 1 if ethnic == 4
replace ethnic2= 1 if ethnic == 5
replace ethnic2= 1 if ethnic == 6
replace ethnic2= 1 if ethnic == 7
replace ethnic2= 1 if ethnic == 8
replace ethnic2= 1 if ethnic == 9
replace ethnic2= 1 if ethnic == 10
replace ethnic2= 1 if ethnic == 11
replace ethnic2= 1 if ethnic == 12
replace ethnic2= 1 if ethnic == 13
replace ethnic2= 1 if ethnic == 14

tab ethnic2

*4.Religion, 1.	Islam, 2= Catholic,3= Protestant, 3= Hindu, 4= Budha, 5=Konghucu 
   *6= others
tab tr12
tab tr12 yb, col

 
*5.educational level ==> 1=elementary , 2=junior high school, 3= senior,4= university
tab dl10
 
gen education=.
replace education = 1 if dl10 ==2
replace education = 2 if dl10 ==3
replace education = 2 if dl10 ==4
replace education = 3 if dl10 ==5
replace education = 3 if dl10 ==6
replace education = 2 if dl10 ==12
replace education = 4 if dl10 ==13
replace education = 3 if dl10 ==15
replace education = 3 if dl10 ==17
replace education = 4 if dl10 ==60
replace education = 4 if dl10 ==61
replace education = 4 if dl10 ==62
replace education = 4 if dl10 ==63
replace education = 1 if dl10 ==72
replace education = 2 if dl10 ==73
replace education = 3 if dl10 ==74
replace education = 4 if dl10 ==95

tab education
tab education yb, col


*6. cencus area, 1=urban, 2=rural 
tab sc05
tab sc05 yb, col

*7. Economic status, 1= poor , 2= medium, 3= rich
tab sw01
drop sw013g
gen sw013g=.
replace sw013g = 1 if sw01==1
replace sw013g = 2 if sw01==2
replace sw013g = 2 if sw01==3
replace sw013g = 3 if sw01==4
replace sw013g = 3 if sw01==5
replace sw013g = 3 if sw01==6
replace sw013g = 1 if sw01==8
tab sw013g
tab sw013g yb, col

*8. life satisfy, 1= satisfy, 2= not satisfied
tab sw00
gen sw002=.
replace sw002= 1 if sw00==1
replace sw002= 1 if sw00==2
replace sw002= 1 if sw00==3
replace sw002= 2 if sw00==4
replace sw002= 2 if sw00==5
tab sw002


	***Physical activity 1= never, 2= yes
*9. vigorous 
tab kk02m1 
gen kk02m1new=.
replace kk02m1new = 1 if kk02m1==3
replace kk02m1new = 2 if kk02m1==1
tab kk02m1new


*10. moderate 1= Yes, 2= Never
tab kk02m2 
tab kk02m2 yb, col

*11. walking 1= never, 2= yes
tab kk02m3
tab kk02m3 yb, col


*12.Health status (self-rated health)** 1= healthy, 2= unhealthy
tab kk01
gen kk01n=.
replace kk01n= 1 if kk01 == 1
replace kk01n= 1 if kk01 == 2
replace kk01n= 2 if kk01 == 3
replace kk01n= 2 if kk01 == 4
tab kk01n

*13.sleep disturbunnce 1=never,2=often,3=always
tab sleepdis

	**symptom 
*14. head ache, 1= Yes, 2= No 
tab ma011

*15. stomach ache 1= no, 2= yes 
tab ma012 
gen ma012new=.
replace ma012new= 1 if ma012 == 3
replace ma012new= 2 if ma012 == 1
tab ma012new
tab ma012new yb, col

*16. fever 1= No, 2= Yes 
tab ma013
gen ma013new=.
replace ma013new= 1 if ma013 == 3
replace ma013new= 2 if ma013 == 1
tab ma013new
tab ma013new yb, col

*17. pain , 1= yes, 2= No
tab pna07xx
tab pna07xx yb, col


*18. Healthcare in adequate for my needs 1. more adequate for my needs, 2= adequate for my needs
	*,3= less than adequate for my needs 
tab sw06
gen sw06new=.
replace sw06new= 3 if sw06 == 1
replace sw06new= 3 if sw06 == 8
replace sw06new= 2 if sw06 == 2
replace sw06new= 1 if sw06 == 3
tab sw06new
tab sw06new yb, col


	**Social activities/supports
*19. community meeting , 1= n0, 2= Yes
tab pm15new1 
tab pm15new1 yb, col

*20. volunteer labor , 1= n0, 2= Yes
tab pm15new2 
tab pm15new2 yb, col

*21. youth group activity, 1= n0, 2= Yes
tab pm15new3 
tab pm15new3 yb, col

*22. religious activity, 1= Yes, 2= No
tab 
gen pm15new4b=.
replace pm15new4b= 1 if pm15new4 == 1 
replace pm15new4b= 2 if pm15new4 == 0
tab pm15new4b
tab pm15new4b yb, col

*23. Health insurance (1=No/2= Yes)
tab ak01
gen ak01new=.
replace ak01new = 1 if ak01 == 3
replace ak01new =2 if ak01 == 1
tab ak01new
tab ak01new yb, col

*24. Tobacco Habit, 1= No, 2= yes
tab km01a
gen km01anew =.
replace km01anew = 1 if km01a == 3
replace km01anew = 2 if km01a == 1
tab km01anew



*===========================================================
 *Table II multivariated analysis ---> adj OR

*===========================================================
* 1= Generation X and 0 = Millennial
tab yb
tab yb ps012new , row
logistic ps012new yb

*1. Gender (1=FEMALE 2=MALE)
tab sex2 ps012new , row
logistic ps012new sex2 

*2. Marital Status, 1= married, 2= unmarried
tab marstat2
tab marstat2 ps012new , row
logistic ps012new marstat2

*3. etnicity 1= others, 2= Javanese, 3= sundanese
tab ethnic2
tab ethnic2 ps012new , row
logistic ps012new i.ethnic2

*4.Religion , 1= non moslem , 2= moeslem in table 2
tab tr12
gen religion=.
replace religion= 2 if tr12 == 1
replace religion= 1 if tr12 == 2
replace religion= 1 if tr12 == 3
replace religion= 1 if tr12 == 4
replace religion= 1 if tr12 == 5
replace religion= 1 if tr12 == 6
replace religion= 1 if tr12 == 96
tab religion 

tab religion  ps012new,row
logistic ps012new religion 

*5. formal education level,1= senior and university , 2= junior, 3= elementary in table 2
gen education2=.
replace education2 = 3 if education== 1
replace education2 = 2 if education== 2
replace education2 = 1 if education== 3
replace education2 = 1 if education== 4
tab education2

tab education2 ps012new,row
logistic ps012new i.education2 

*6. census are, 1=rural,2= urban
gen sc05new=.
replace sc05new = 1 if sc05 == 2
replace sc05new = 2 if sc05 == 1

tab sc05new
tab sc05new ps012new , row
logistic ps012new sc05new

*7.economic status, 1= Rich , 2= medium, 3= poor 

tab sw01
gen sw013g=.
replace sw013g = 3 if sw01 == 1
replace sw013g = 3 if sw01 == 2
replace sw013g = 2 if sw01 == 3
replace sw013g = 1 if sw01 == 4
replace sw013g = 1 if sw01 == 5
replace sw013g = 1 if sw01 == 6
replace sw013g = 2 if sw01 == 8
tab sw013g
tab sw013g ps012new, row
logistic ps012new i.sw013g 

*8. life satisfy, 1= satisfy, 2= not satisfied
tab sw002
tab sw002 ps012new, row
logistic ps012new sw002 

***Physical activity 1= never, 2= yes
*9. vogorous 
tab kk02m1new
tab kk02m1new ps012new , row
logistic ps012new kk02m1new 

*10. moderate 1= never, 2= yes
tab kk02m2new
tab kk02m2new ps012new, row
logistic ps012new kk02m2new

*11. walking 1= never, 2= yes
tab kk02m3new
tab kk02m3new ps012new , row
logistic ps012new kk02m3new 

*12.Health status (self-rated health)** 1= healthy, 2= unhealthy
tab kk01n
tab kk01n ps012new , row
logistic ps012new kk01n 

*13.sleep disturbunnce 1=never,2=often,3=always
tab sleepdis
tab sleepdis ps012new, row
logistic ps012new i.sleepdis 

**symptom 
*14. head ache, 1= No, 2= Yes 
tab ma011new
tab ma011new ps012new, row
logistic ps012new ma011new 

*15. stomach ache 1= no, 2= yes 
tab ma012new
tab ma012new ps012new , row
logistic ps012new ma012new 

*16. fever 1= No, 2= Yes 
tab ma013new
tab ma013new ps012new , row
logistic ps012new ma013new

*17. pain , 1= yes, 2= No
tab pna07xx
tab pna07xx ps012new , row
logistic ps012new pna07xx 

*18. Healthcare in adequate for my needs 1. more adequate for my needs, 2= adequate for my needs
	*,3= less than adequate for my needs 
tab sw06new
tab sw06new ps012new, row
logistic ps012new i.sw06new 

**Social activities/supports
*19. community meeting , 1= n0, 2= Yes
tab pm15new1 
tab pm15new1 ps012new , row
logistic ps012new pm15new1 

*20. volunteer labor , 1= n0, 2= Yes
tab pm15new2 
tab pm15new2 ps012new, row
logistic pm15new2 ps012new 

*21. youth group activity, 1= n0, 2= Yes
tab pm15new3 
tab pm15new3 ps012new, row
logistic pm15new3 ps012new 

*21. religious activity, 1= n0, 2= Yes
tab pm15new4
tab pm15new4 ps012new, row
logistic pm15new4 ps012new 

*22 Health insurance (1=Yes/2= No)
tab ak01
tab ak01 ps012new, row
logistic ps012new ak01 

*23. Tobacco Habit, 1= No, 2= yes
tab km01anew 
tab km01anew ps012new, row
logistic ps012new km01anew 



**************************************************************************
******************* Table III (Initial Model)*****************************

logistic ps012new yb marstat2 i.education2 ethnic2 sc05new kk02m1new kk02m2new kk01n i.sleepdis ma012new ma013new ma011new pna07xx pm15new1 pm15new2 pm15new4b sw06new km01anew
est store a
logistic ps012new yb marstat2 i.education2 ethnic2 sc05new kk02m1new kk02m2new kk01n ma012new ma013new ma011new pna07xx pm15new1 pm15new2 pm15new4b sw06new km01anew
lrtest a
*/// i.sleepdis , p-value= 0.209

est store b
logistic ps012new yb marstat2 ethnic2 sc05new kk02m1new kk02m2new kk01n ma012new ma013new ma011new pna07xx pm15new1 pm15new2 pm15new4b sw06new km01anew
lrtest b
*/// i.education2 , p-value= 0.014

est store c
logistic ps012new yb marstat2 ethnic2 sc05new kk02m1new kk02m2new kk01n ma012new ma013new ma011new pna07xx pm15new1 pm15new4b pm15new2 km01anew
lrtest c
*/// i.sw06new, p-value= 0.068

est store d
logistic ps012new yb marstat2 ethnic2 sc05new kk02m1new kk02m2new kk01n ma012new ma013new ma011new pna07xx pm15new1  pm15new2 km01anew
lrtest d
*///pm15new4b, p-value= 0.051

est store e
logistic ps012new yb marstat2 ethnic2 sc05new kk02m1new kk02m2new kk01n ma012new ma013new ma011new pna07xx pm15new1 km01anew
lrtest e
*///  pm15new2, p-value=  0.046

est store f
logistic ps012new yb marstat2 ethnic2 sc05new kk02m2new kk01n ma012new ma013new ma011new pna07xx pm15new1 km01anew
lrtest f
*/// kk02m1new, p-value=0.005, can not be droped

est store g
logistic ps012new yb marstat2 ethnic2 sc05new kk02m1new kk02m2new kk01n ma013new ma011new pna07xx pm15new1 km01anew
lrtest g
*/// ma012new, p-value= 0.002, can not be droped

est store h
logistic ps012new yb marstat2 ethnic2 sc05new  kk02m2new kk01n ma013new ma011new pna07xx pm15new1 km01anew
lrtest h
*/// kk02m1new, p-value= 0.003

est store i
logistic ps012new yb marstat2 ethnic2 sc05new  kk02m2new kk01n ma013new ma011new pna07xx km01anew
lrtest i
*/// pm15new1, p-value=


logistic ps012new yb marstat2 ethnic2 sc05new  kk02m2new kk01n ma013new ma011new pna07xx km01anew
