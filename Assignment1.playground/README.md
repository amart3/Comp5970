Programming Assignment 1

In this assignment you are going to develop a Swift function named “payment”  to calculate the amount of a mortgage payment. Refer to the video below and/or any online source for how the mathematics of the calculation works. You function should take as inputs:

 

The amount of the loan in whole dollars (an Int)
The number of payments (e.g. 360 for 30-year) (an Int)
The interest rate per payment period in percent ( a positive floating-point number)
 

The function should return  the correct value (in dollars and cents, a Float ) of the per-period  payment of principal and interest (ignore escrow accounts, taxes, and insurance) for the following scenarios:

 

72 month loan of $20,000, 4.4% APR, compounded monthly
30 year loan of $150,000, 5% APR, one annual payment each year for 30 years
Note that the interest rate you pass to the function is per payment period. If the period is one year and the interest rate is quoted as an annual rate such an APR, then you just pass the APR. But if you have an annual interest rate and the period is monthly, you would divide the rate by 12 before passing it to the function. 

There are many loan calculators online you can use to check your work.

 

Deliverables

             A playground with the function defined as above.

 

Rubric for Grading

Compiles = 35%

Calculates something  = 15%

Correct argument and return types 10%

Correct answer for 72 month loan of $20,000, 4.4% APR, compounded monthly = 15%

Correct answer for  30 year loan of $150,000, 5% APR, one annual payment each year for 30 years = 15%
