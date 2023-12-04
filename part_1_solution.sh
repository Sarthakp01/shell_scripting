while IFS="," read -r card_type_code card_type_full_name issuing_bank card_number card_holder_name cvv issue_date expiry_date billing_date card_pin credit_limit;
do
	#echo card_type_code ":" $card_type_code >> new.txt

    parent=$(echo $card_type_full_name | sed 's/ /_/g')
    echo $parent
    if test -d $parent
    then
        echo Folder Exist
    else
        mkdir $parent
    fi
    child=$(echo $issuing_bank | sed 's/ /_/g')
    echo $child

    if test -d $parent/$issuing_bank
    then
        echo Folder exits
    else
        mkdir $parent/$child
    fi
    ls
    cur_month=$(date +%m)
    cur_year=$(date +%Y)
    month=${expiry_date:0:2}
    year=${expiry_date:3:6}
    status=none
    echo $cur_year
    if ([ $year -eq $cur_year ] && [ $month -ge $cur_month ]) || [ $year -ge $cur_year ]
    then
        status=active
    else
        status=expired
    fi
    echo $status
    credit_limit=`echo $credit_limit | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' | sed 's/^/$/' | sed 's/$/ USD/'`
    touch $parent/$child/"$card_number.$status"
    cat > "$parent/$child/"$card_number.$status"" <<EOF
Card Type Code: $card_type_code
Card Type Full Name: $card_type_full_name
Issuing Bank: $issuing_bank
Card Number: $card_number
Card Holder's Name: $card_holder_name
CVV/CVV2: $cvv
Expiry Date: $expiry_date
Billing Date: $billing_date
Card PIN: $card_pin
Credit Limit: $credit_limit
EOF
	
done < <(tail -n +2 "100_CC_Records.csv")