# sales-taxes
This is a CLI application for processing taxes for a given amount of input
It is written in ruby

### Build Status
[![Build Status](https://travis-ci.org/walimike/sales-taxes.svg?branch=main)](https://travis-ci.org/walimike/sales-taxes)

## How to use it
1. clone this repo and cd into `sales-taxes`
2. run `ruby run.rb`
3. You will be prompted to enter a commodity e.g. `1 box of imported chocolates at 11.25`
4. Provide the commodities one by one as preempted by the app
5. Once you are done, click enter with an empty line(the app provides instructions)

## Expected behaviour
The app then prints a receit depending on the user input

### Challenge

Basic sales tax is applicable at a rate of 10% on all goods, except books,

food, and medical products that are exempt. Import duty is an additional

sales tax applicable on all imported goods at a rate of 5%, with no exemptions.


When I purchase items I receive a receipt which lists the name of all the

items and their price (including tax), finishing with the total cost of the

items, and the total amounts of sales taxes paid. The rounding rules for

sales tax are that for a tax rate of n%, a shelf price of p contains

(np/100 rounded up to the nearest 0.05) amount of sales tax.
