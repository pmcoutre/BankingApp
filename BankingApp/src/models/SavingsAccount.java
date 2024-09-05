package models;

public class SavingsAccount extends Account {
    public SavingsAccount(String accountNumber) {
        super(accountNumber);
    }

    @Override
    public void displayAccountType() {
        System.out.println("This is a Savings Account.");
    }
}
