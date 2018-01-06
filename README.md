# sums
webapp in sinatra producing addition questions

The language used is ruby with the gem sinatra.
Requirements:
Requires the gems sinatra and json.

A few assumptions have been made.

1. The user is aware of the range so all the options fall also fall into the range 
   provided.
2. The options have to be different from the correct answer from each other so the 
   Range has to allow at least 4 options. So an error is thrown is the user enters
   a range too small
3. If the inputs are not integers(i.e doubles or floats) the to_i function rounds 
   them down
4. If the user enters anything other than a number then it is assumed to be 0. So 
   2 string inputs would lead to a range error but a string and a number (n) would 
   take the range 0 - n
   
   
