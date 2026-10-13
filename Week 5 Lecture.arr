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
voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcode
  source:csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end
