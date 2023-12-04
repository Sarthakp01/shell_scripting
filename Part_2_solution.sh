#!/bin/bash
touch consolidated.csv
echo "Card Type Code,Card Type Full Name,Issuing Bank,Card Number,Card Holder's Name,CVV/CVV2,Issue Date,Expiry Date,Billing Date,Card PIN,Credit Limit" >> consolidated.csv
for i in `find . -type f -name "*.active" -o -name "*.expiry"`;
do
	  card_type_code=`sed -n '1p' $i`
	  card_type_full_name=`sed -n '2p' $i`
	  issuing_bank=`sed -n '3p' $i`
      card_number=`sed -n '4p' $i`
	  card_holder_name=`sed -n '5p' $i`	 
	  cvv=`sed -n '6p' $i`
      issue_date=`sed -n '7p' $i`
	  expiry_date=`sed -n '8p' $i`
	  billing_date=`sed -n '9p' $i`
	  card_pin=`sed -n '10p' $i`
      credit_limit=`sed -n '11p' $i | sed 's/,//g' | sed 's/USD//g'| sed 's/^.//'`
	  echo "${card_type_code:16},${card_type_full_name:21},${issuing_bank:14},${card_number:13},${card_holder_name:20},${cvv:10},${issue_date:12},${expiry_date:13},${billing_date:14},${card_pin:10},${credit_limit:14}">> consolidated.csv
	  done
