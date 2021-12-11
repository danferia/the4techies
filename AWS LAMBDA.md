LAMBDA created on aws
created a lambda specific policy 
had two seperate python code for a stop and start function 
for automation to be able to stop and start multiple instances we had created two tags 
Tag one is Start = yes 
Tag two Stop = yes 
Any instance that contains these tags can be stopped an started with the function 
It is scheduled to stop once monday-friday at 1 am then restart at 6 am PST monday-friday
