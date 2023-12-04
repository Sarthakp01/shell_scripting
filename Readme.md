The attached csv file has randomly generated credit card records.
Column: Card Type Code,Card Type Full Name,Issuing Bank,Card Number,Card Holder's Name,CVV/CVV2,Issue Date,Expiry Date,Billing Date,Card PIN,Credit Limit

PART 1:

Write a shell script to read the file and create a file each record from csv. The files should be in following format.
Suppose the "Card Number" is 3587804193769544 and "Expiry Date"  is 12/2023, then the file name should be 3587804193769544.active. If suppose the "Expiry Date" is passed the current month/year then file name should be 3587804193769544.expired

Details "JC,Japan Credit Bureau,JCB,3587804193769544,Jeffrey J Barnes,337,08/2015,08/2023,2,7675,155600" in file should be as follows:
Card Type Code: JC
Card Type Full Name: Japan Credit Bureau
Issuing Bank: JCB
Card Number: 3587804193769544
Card Holder's Name: Jeffrey J Barnes
CVV/CVV2: 337
Issue Date: 08/2015
Expiry Date: 08/2023
Billing Date: 2
Card PIN: 7675
Credit Limit: $155,600 USD

Note: The Credit Limit should be formatted in United States currency format. Ex: 123456789 => $123,456,789 USD

These files should be segregated in following format. Parent directories should be name by "Card Type Full Name" from the records. Inside each directories, there should be sub-directories based on "Issuing Bank" from records. 
The above created files file should be found in these sub-directories based on "Card Type Full Name" and "Issuing Bank".

PART 2:

Once the above script has executed successfully, and the expected directory structure is created. Then you need to write a new script which should parse all the .active and .expired files from the sub directories and again write the data in the new file consolidated.csv which should have similar structure and row count as the original file "100 CC Records.csv"

So basically a reverse script of the initial script.



