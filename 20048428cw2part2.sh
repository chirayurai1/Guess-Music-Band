password="123" #initializing variable password as 0
tr=0 #initializing variable tr as 0
a=0 #initializing variable a as 0
func1 ()
{
    echo "GREAT! You have entered the correct band."
	echo "AC/DC are an Australian rock band formed in Sydney in 1973. 
	AC/DC is an Australian heavy metal band known for its dramatic, high-energy performances,
	which made them one of the most popular stadium acts of the 1980s."
	echo
	((b++))
}

func2 ()
{
	d=0
	echo
	echo "Choose one: "
	echo $1 $2 $3
	array1=($1 $2 $3)
	while [ $d -eq 0 ]
	do
		echo "Enter a band member you want to choose: "
		select mem in ${array1[@]}
		do
			case $mem in
				"FM")
					echo " Sorry! there is no information about Freddie Mercury. "
					echo
                	((d++))
					break
					;;
				"AY")
					cat AngusYoung.txt 
					echo
					echo
                	((d++))
					((a++))
					break
					;;
				"JL")
                	cat JohnLennon.txt 
					echo
					echo
                	((d++))
					((a++))
					break
					;;
				"DH")
					cat DebbieHarry.txt 
					echo
					echo
                	((d++))
					((a++))
					break
					;;
				"KC")
                	echo " Sorry! there is no information about Kurt Cobain. "
					echo
                	((d++))
					break
					;;
				*)
					echo "INVALID INPUT! TRY AGAIN"
					echo
					;;
			esac
		done
	done
}


if [ -z $1 ] || [ -z $2 ];
then
	echo "Please don't forget to enter your name and id."
else
	while (( $tr < 3 ))
	do
		echo "Enter the secret key: "
		read key
		if [ $key -eq $password ];
		then
			echo "HELLO "$2 $1
            date
			while [ $a -eq 0 ]
			do
				b=0
				c=0
				echo
				echo "BANDS NAMES"
				echo "1. Beatles(BEA)"
				echo "2. AC/DC(AD)"
				echo "3. Queen(QUE)"
				echo "4. Blondie(BLO)"
				echo "5. Nirvana(NIR)"
				echo
				until [ $b -eq 1 ]
				do
					echo "Enter a code: "
					read ch
					if [ $ch == "AD" ]
					then
						func1
					else
						echo "    INVALID INPUT! TRY AGAIN    "
						echo
					fi
				done
				while [ $c -eq 0 ]
                do
					echo
                	echo "BAND MEMBERS"
                	echo "1. John Lennon(JL)"
                	echo "2. Angus Young(AY)"
                	echo "3. Freddie Mercury(FM)"
                	echo "4. Debbie Harry(DH)"
                	echo "5. Kurt Cobain(KC)"
					echo
                    echo "Enter three code: "
                    read a1 a2 a3
					if [[ $a1 != "JL"  && $a1 != "AY" && $a1 != "FM" && $a1 != "DH" && $a1 != "KC" ]] ||
					[[ $a2 != "JL" && $a2 != "AY" && $a2 != "FM" && $a2 != "DH" && $a2 != "KC" ]] ||
					[[ $a3 != "JL" && $a3 != "AY" && $a3 != "FM" && $a3 != "DH" && $a3 != "KC" ]]
					then 
						echo "INVALID INPUT! TRY AGAIN"
						echo
					elif [[ $a1 == $a2 ||  $a1 == $a3 ]]
					then
						echo "REPEATED INPUT! TRY AGAIN"
						echo
					else
						((c++))
						func2 $a1 $a2 $a3
					fi
                done
				if [ $a -gt 0 ]
				then
					echo "Do you want to continue? 'y'(yes) or 'n'(no): "
					read x
					if [ $x == "y" ] || [ $x == "yes" ]
					then
						a=0
					else
						exit 1
					fi
				fi
			done
		else
			((tr++))
		fi
	done
fi