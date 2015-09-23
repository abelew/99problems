(* problem 01 calls for the last element of a list. *)
(* pascal it turns out is very foreign to my way of thinking, so this bears stepping through a little. *)

program get_last(input, output);  (* This program block is finished when we hit 'end.'.  That is sensible enough. *)
(* We can put variables into the program definition, but I am not entirely certain what happens to them (input/output) *)
(* After we state the definition of a program, we set up constants, types, and variables for it *)

{ constants are defined with const ;p  -- also curlies are good for comments, too }
const
   size = 5;

type { It isn't yet entirely clear to me why one uses the type definition for setting up the array here. }
   { nor am I certain if you must set the size of every array }
   a = array [1..size] of integer;
   { Once the size and type of the array is set, I can fill it as a var and set the type of my result, which is weird because in the function definition which follows I also set the type of the result I think, so why do I have to do it here, too? }
var
   arr:  a = (100, 22, 31, 17, 503);
   result: integer;  

{ Now I can have my function definition, it takes as input a variable of type arr which is a and returns an integer }
function get_last(var arr: a): integer;
{ Inside my function I set i just for the hell of it and element }
var
   i :1..size;
   element: integer;
begin
   { After the variables are set I can begin my function, and things look a bit more like a normal programming language }
   i := 0;
   for i := 1 to size do
      element := arr[i];
   { until we get here, the return for the function is named as the function, which is just damn odd imo. }
   get_last := element
end;

begin  
   { Now I am in what is analagous to main() in C and so I run my function with my array from above }
   result := get_last(arr) ;
   (* and print the result *)
   writeln( 'The final entry is: ', result);
end.
