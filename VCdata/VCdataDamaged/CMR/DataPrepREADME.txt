21 Items   A - U
On Donna
B G H I J K L M S T   U    W   ak BJ BL BM  BP BQ BR BS CC
1 2 3 4 5 6 7 8 9 10  11  12  13 14 15 16   17 18  19  20  21

Data mapping from spreadsheet to db fields

B	term  0
G	cls nbr  1     'reference
H	Subj  2
I	catalog  3
J	descr  4        ' clear ' with blanks to eliminate apostrophes
K	comp LEC  5
L	status  6
M	credits  7
S	session  8
T	start  9
U	end  10
W	section  11
AK	type  12
BJ	notes  13      ' dump ' and replace , with $
BL	last  14         ' dump any '
BM	first  15
BP	username  16
BQ	chair  17             replace , in spreadsheet fild with ;  
BR	chairoutlook 18
BS	canchange  19   replace FT  FULL   pt  ADJ   nada TBA
CC	mdid  20

Actual script in file for data types: Note ALL VARCHAR

            Dim term As String = astrValues(0)  'Term,
            Dim reference As String = astrValues(1)  'reference
            Dim subject As String = astrValues(2)  'Subject,'
            Dim catalog As String = astrValues(3)  'Catalog,
            Dim descr As String = astrValues(4)  'Descr,
            Dim component As String = astrValues(5)  'Component,
            Dim status As String = astrValues(6)  'Status,
            Dim credits As String = astrValues(7)  'Credits,
            Dim session As String = astrValues(8)  'Session,
            Dim startdate As String = astrValues(9)  'StartDate,
            Dim enddate As String = astrValues(10)  'EndDate,
            Dim section As String = astrValues(11)  'Section,
            Dim classtype As String = astrValues(12) 'ClassType,
            Dim sectionNotes As String = replace(astrValues(13), "$",",")  'SectionNotes,
            Dim last As String = astrValues(14)  'Last,
            Dim first As String = astrValues(15)  'First,
            Dim UserName As String = astrValues(16)  'Username
            Dim email As String = username & "@mdc.edu"
            Dim Chair As String = astrValues(17)  'Chair
            Dim chairoutlook As String = astrValues(18)  'Chairoutlook
            Dim instAssign As String = astrValues(19)  'InstrAssig Cls, - CanChANGE
            Dim mdcid As String = astrValues(20)  'MDIC,
            Dim course As String = subject & catalog



Globally prep spreadsheet
..........................................................................................................
Change canCHANGE to FULL, ADJ,TBA
replace #NA with space
replace ' with blank space
in notes, replace , with $
change date field types with 1/1/2019 type
in chair  replace , with ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
After uploading the file, please FIRST run the insert with default PREVIEW selected to validate data conversion and check a couple of sql statements
