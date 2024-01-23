# FormatPhoneNumber SQL Function

The `FormatPhoneNumber` SQL function is designed to format Azerbaijani phone numbers into a standardized format. Below is an explanation of the code:

## Purpose
The purpose of this function is to take a string representation of a phone number as input and return a formatted phone number as a string. The formatting adheres to the Azerbaijani phone number standards.

## Conditions
The function checks various conditions to determine the appropriate formatting for the given phone number.

1. **Length Check:**
   - If the length of the input phone number is less than 9, the function sets the result to 'Number is too short.'

2. **Number Prefix Checks:**
   - The function checks for specific prefixes in the input number and formats accordingly. These prefixes correspond to Azerbaijani mobile network operators.

   - If the input number starts with '050,' '051,' '070,' '077,' '010,' '099,' or '012,' the function formats the number as `+994 ABC DE FG HI`, where ABC, DE, FG, and HI are the respective segments of the input number.

   - If the input number starts with '50,' '51,' '70,' '77,' '10,' '99,' or '12,' the function formats the number as `+994 0AB DE FG HI`.

3. **Country Code Checks:**
   - If the input number starts with '994,' the function formats the number as `+994 ABC DE FG HI`.

   - If the input number starts with '+994,' the function formats the number as `+994 ABC DE FG HI`.

4. **Invalid Number:**
   - If the input number does not match any of the specified conditions, the function sets the result to 'Invalid phone number format.'

## Example Usage
An example is provided in the code to demonstrate how to use the function:

```sql
DECLARE @result VARCHAR(19);
DECLARE @number VARCHAR(19);

SET @number = '0501112222'

SET @result = dbo.FormatPhoneNumber(@number)

SELECT @result AS Result
```
In this example, the function is used to format the phone number '0501.' The result is then displayed in the Result column.
