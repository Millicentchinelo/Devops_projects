# Bash Script For Generating a Multiplication Table

**Objective**: Create a Bash script that generates a multiplication table for a number entered by the user. This project will help you practice using loops, handling user input, and applying conditional logic in Bash scripting.

>>Write a Bash script that generates a multiplication table for a given number. The script should prompt the user to enter a number and then display the multiplication table for that number up to 10. Your task is to use both styles of for loops to achieve this: the list form and the C-style form.

```
#!/bin/bash

echo "WELCOME TO OUR MINI-CALCULATOR"
#Prompt the user to enter a number for the multiplication table
read -p "Enter a number for the multiplication: " num

shopt -s nocasematch #command to make the inputs case insensitive

#while-loop to check if num is greater than zero and if to repeat the multiplication table
while [[ $num -gt 0 || again == y ]]
do
        #Ask if they want a full table or a partial table
        read -p "Do you want a full table or a partial table? (Enter 'f' for full,'p' for partial): " table
        # Ask the user if they want to see the table in ascending or descending order
        read -p "Do you want you table in ascending or descending order? (Enter 'a' for ascending, or 'd' for descending): " style
        if [[ $table == f ]]
        then


                if [[ $style == d ]]
                then
                        #Full table in descending order
                        echo "The full multiplication table for $num in descending order: "
                        for i in {10..1}

                        do
                                echo "$num * $i = $( expr $i \* $num)  "

                        done

                        #using c-style of for-loop to repeat the same multiplication table

                        echo " " # Add a newline for spacing
                        echo "Using c-style to reprint mutiplication table in descending order: "

                        for ((i=10; i>=1; i--))
                        do
                                echo "$i * $num = $((i*$num))"
                        done
                else
                        #Full table in ascending order
                        echo "The full multiplication table for $num in ascending order: "
                        for i in {1..10}
                        do
                                echo "$num * $i = $( expr $i \* $num)  "

                        done

                        #using c-style of for loop to repeat the same multiplication table


                        echo " " # Add a newline for spacing
                        echo "Using c-style to reprint mutiplication table in ascending order: "

                        for ((i=1; i<=10; i++))
                        do
                                echo "$i * $num = $((i*$num))"
                        done
                fi

        elif [[ $table == p ]]
        then
                #Creating partial multiplication table
                #If partial, prompt for the start and end numbers of the range
                read -p "Enter the starting number: " s_num #input for starting number
                read -p "Enter the ending number: " e_num   #input for ending number

                #incase of non-interger input for s_num and e_num
                if [[ -n ${s_num//[0-9]/} || -n ${e_num//[0-9]/} ]] 
                then
                        echo " Value entered is invalid, Please Enter a number between 1 to 10 "
                
                elif [[ $style == d ]]
                then

                        if [[ $s_num -gt 0  && $e_num -le 10 ]]
                        then
                                #Generate and display the multiplication table according to the specified range
                                #For valid range and printing in descending order
                                echo "The partial multiplication table for $num starting from $e_num to $s_num in descending order: "
                                for i in $(seq $e_num -1 $s_num)
                                do
                                        echo "$num * $i = $(expr $i \* $num) "

                                done

                                #using c-style of for loop to repeat the same multiplication table in descending order

                                echo " " # Add a newline for spacing
                                echo "Using c-style to reprint mutiplication table in descending order: "

                                for ((i=$e_num; i>=$s_num; i--))
                                do
                                        echo "$i * $num = $((i*$num))"
                                done

                        else

                                #For when an invalid range is chosen and we still need to output in descending order
                                echo "You choose an invalid range"
                                sleep 1
                                echo "The full multiplication table for $num in descending order: "
                                for i in {10..1}
                                do
                                        echo "$num * $i = $( expr $i \* $num)  "
                                done
                                #using c-style of for loop to repeat the same multiplication table

                                echo " " # Add a newline for spacing
                                echo "Using c-style to reprint mutiplication table in descending order: "

                                for ((i=10; i>=10; i--))
                                do
                                        echo "$i * $num = $((i*$num))"
                                done

                        fi
                else
                        if [[ $s_num -gt 0  && $e_num -le 10 ]]
                        then
                                #For valid range and printing in ascending order
                                echo "The partial multiplication table for $num starting from $s_num to $e_num in ascending order: "
                                for i in $(seq $s_num $e_num)
                                do
                                        echo "$num * $i = $(expr $i \* $num) "

                                done

                                #using c-style of for loop to repeat the same multiplication table


                                echo " " # Add a newline for spacing
                                echo "Using c-style to reprint mutiplication table: "

                                for ((i=$s_num; i<=$e_num; i++))
                                do
                                        echo "$i * $num = $((i*$num))"
                                done

                        else
                                #For when invalid range input is given and we still need to print in ascending order
                                echo "You choose an invalid range"
                                sleep 1
                                echo "The full multiplication table for $num: "
                                for i in {1..10}
                                do
                                        echo "$num * $i = $( expr $i \* $num)  "
                                done

                                #using c-style of for loop to repeat the same multiplication table


                                echo " " # Add a newline for spacing
                                echo "Using c-style to reprint mutiplication table: "

                                for ((i=1; i<=10; i++))
                                do
                                        echo "$i * $num = $((i*$num))"
                                done

                        fi

                fi
        else
                #for invalid table input
                echo "You choose an invalid multiplication table. Please try again"
                sleep 1


        fi



        #To ask users if they will want to check multplication of another number i.e reuse the multiplication table
        read -p "Do you want to use the calculator again? (Enter 'y' for YES, or 'n' for NO): " again

        if [[ $again != y ]] #condition to check if to repeat the while-loop
        then
                break

        fi
        read -p "Enter a number for the multiplication: " num
done

#incase of error of invalid number or non-interger input
if [[ $num -lt 0 || -n ${num//[0-9]/} ]]
then
        echo "$num is an invalid value, Please Enter a number greater than Zero "
fi

#Closing Note
echo "Thank you for using our mini-calculator"
sleep 1
```
