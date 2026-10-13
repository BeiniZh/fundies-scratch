use context dcic2024

include csv
include data-source

#|
   plan a task before coding it
   finding and cleanig dirty data
   visualisation
|#

#task plan is a to-do list yu can chek off
#|
   input = the columns you start from
   output = a comcrete example of what you want at the end
   steps = small enough that each one is a single function or table operation
   tools = the operaion for each step: filter-with, transform-column
|#

#load voters data
#Not specifying the specific data type is ok, although that will be a better approach

voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcode
  source:csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end

#voter-data.row-n(0)["voterID"]在右边输入，可以得到结果
#confirm the party problem
filter-with(voter-data,lam(r):r["Party"] == "Labour" end).length() 
# =>4

voter-data.row-n(3)["Party"]
#=>Labour

order-by(count(voter-data,"Party"),"count",false)

#reading on value with get-column
fun get-column(r :: Row, colname :: String):
  doc:"returns the value in row r for the column colname"
  r[colname]
where: 
  get-column(voter-data.row-n(3),"Party") is "Labuor"
  get-column(voter-data.row-n(0),"VoterID") is "1"
end

filter-with(voter-data, lam(r):get-column(r,"Party") == "Labour" end).length()

get-column(voter-data.row-n(3),"Party")


#Only extract the 6th-10th digits of the string because only the 6th-10th is the year of teh DOB, all other before the 6th is the day and month.

with-year = build-column(voter-data,"BirthYear",lam(r):string-substring(get-column(r,"DOB"),6,10)end)

get-column(with-year.row-n(0),"BirthYear")

#fixing the typo
fun fix-labour(s :: String) -> String:
  doc:"corrects the one known misspelling of Labour"
  if s == "Labuor" : "Labour"
  else if s == "": "None" 
  else: s 
  end
   
where:
  fix-labour("Labuor") is "Labour"
  #fix-labour("") is "None"
  fix-labour("Green Party") is "Green Party"
end

#try using transform-column

fixed = transform-column(voter-data,"Party",fix-labour)

#this will display the bar plots
decending-order-fixed = order-by(count(fixed,"Party"),"count",false)
freq-bar-chart(decending-order-fixed,"Party")
