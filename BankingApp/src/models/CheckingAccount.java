package models;

public class CheckingAccount extends Account {
    public CheckingAccount(String accountNumber) {
        super(accountNumber);
    }

    @Override
    public void displayAccountType() {
        System.out.println("This is a Checking Account.");
    }
}
