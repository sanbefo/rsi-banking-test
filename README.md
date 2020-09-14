# RSI Banking Test

## How to run the program

Use the following command in the folder where the code is located.

```console
ruby agent.rb
```

## How is the program structured?

The program creates 3 banks, 30 accounts distributed randomly to all the banks, not necessarily evenly, and then tries to create 50
records/transactions, and they only get saved in case the transaction has all the necessary requirements set in the instructions.
When a record is saved, the sender has its amount reduced and the receiver has its amount increased in the correspondent quantity.

At the end of the program, there is a report created with all the information of the transfers for each bank, if the transfer involves 
two banks, then the transfer is reported in both banks. It also reflects how the accounts finish the simulation, with all the corresponding data.

## Questions

### How would you improve your solution?
First of all use a data base, and the rails logic would allow for some validations, which would also help for creating several tests because 
the program would be more complex.

### How would you adapt your solution if transfers are not instantaneous?
Create a timeout so that the user would know that if the transaction is not validated within a certain amount of time, then it is discarded and
he/she should try again
