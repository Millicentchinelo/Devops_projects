# Bash Script For Generating a Multiplication Calculator

**Objective**: Create a Bash script that generates a multiplication table for a number entered by the user. This project will help you practice using loops, handling user input, and applying conditional logic in Bash scripting.

## **Project Description**
Your script should prompt the user to enter a number and then ask if they prefer to see a full multiplication table from 1 to 10 or a partial table within a specified range. Based on the user's choice, the script will display the corresponding multiplication table.

## Project Requirements:
- User Input for Number: The script must first ask the user to input a number for which the multiplication table will be generated.
Choice of Table Range: Next, ask the user if they want a full multiplication table (1 to 10) or a partial table. If they choose partial, prompt them for the start and end of the range.
- Use of Loops: Implement the logic to generate the multiplication table using loops. You may use either the list form or C-style for loop based on what's appropriate.
- Conditional Logic: Use if-else statements to handle the logic based on the user's choices (full vs. partial table and valid range input).
- Input Validation: Ensure that the user enters valid numbers for the multiplication table and the specified range. Provide feedback for invalid inputs and default to a full table if the range is incorrect.
- Readable Output: Display the multiplication table in a clear and readable format, adhering to the user's choice of range.
- Comments and Code Quality: Your script should be well-commented, explaining the purpose of different sections and any important variables or logic used. Ensure the code is neatly formatted for easy readability.
- Bonus: Ask the user if they want to see the table in ascending or descending order, and implement this feature using if-else statements combined with your loop of choice.

## Example Script Flow:
1.	Prompt the user to enter a number for the multiplication table.
2.	Ask if they want a full table or a partial table.
•	If partial, prompt for the start and end numbers of the range.
3.	Validate the range inputs and handle invalid or out-of-bound entries.
4.	Generate and display the multiplication table according to the specified range.
5.	Provide clear output formatting for ease of reading. Bonus
6.	Enhanced User Interaction: Incorporate additional checks or features, like repeating the program for another number without restarting the script.
7.	Creative Display Options: Offer different formatting styles for the table display and let the user choose.
8.	Ask the user if they want to see the table in ascending or descending order, and implement this feature using if-else statements combined with your loop of choice.

Below is an example output for a full multiplication:
The full multiplication table for 3:

3 x 1 = 3

3 x 2 = 6

3 x 3 = 9

3 x 4 = 12

3 x 5 = 15

3 x 6 = 18

3 x 7 = 21

3 x 8 = 24

3 x 9 = 27

3 x 10 = 30


```
#!/bin/bash

echo "WELCOME TO OUR MINI-CALCULATOR"
#Prompt the user to enter a number for the multiplication table
read -p "Enter a number for the multiplication: " num

shopt -s nocasematch #command to make the inputs case insensitive

#the until-condition means, until $num is less than zero or $num is a string or $again is equal to n, keep looping
#until-loop is the opposite of while-loop
# -n{num//[0-9]/} checks if there is a string in the above input (if there is a str, it wont loop bcos of the until-condition)

until [[ $num -lt 0 || -n ${num//[0-9]/} || $again == n ]]
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

        if [[ $again == y ]] #asks a question if the input to reuse calculator means positive
        then
                read -p "Enter a number for the multiplication: " num
        fi

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

## TROUBLESHOOTING

- Indentication is very important, always check it i.e always check the spacing especially when indented.
- Test script while still developing the code. Always test at each milestone, that way its easier to debug each step and be sure its functioning appropriately before adding another one.  
- Always take note of colours and colour change, it could help you identify a mistake on time
- Add the sleep 1 command where necessary
