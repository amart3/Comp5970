import UIKit
/**
 *Lawrence "Alex" Martin
 *Lam0097 - 903986867
 *Comp - 5970 - D01 -
 *Assignment 1 - Payment Calculator
 *6/6/2021
 */

/**
 *APR = interestRate
 *Number of Payments = months
 *Amount of Loan or Principal  = loanAmnt
 *If time is in years then should be transfered to years. Exp - 30 years = 360 months
 *Interest rate should be typed as in decimal format. 7.3% = 0.073
*/

func payment(_ time: Int, _ interestRate: Float, _ loanAmnt: Int)-> Float {
    var payment = 0.0
    
    payment = Double((Float(loanAmnt) * interestRate) / (1.0 - pow((1.0 + interestRate), Float(-time))))
    
        return Float((round(100*payment)/100))
}

/**
 *Format is (time, apr, principal)
 *If it's a monthly apr then input apr/12
 *If it's a annual apr then input apr.
*/

//72 month loan of $20,000, 4.4% APR, compounded monthly
print(payment(72, 0.044/12, 20000))

//30 year loan of $150,000, 5% APR, one annual payment each year for 30 years
print(payment(30, 0.05, 150000))

