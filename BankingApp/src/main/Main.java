package main;

import models.CheckingAccount;
import models.SavingsAccount;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        SavingsAccount savingsAccount = new SavingsAccount("12345");
        CheckingAccount checkingAccount = new CheckingAccount("67890");

        boolean running = true;
        while (running) {
            System.out.println("\\nBanking Application Menu:");
            System.out.println("1. Deposit to Savings");
            System.out.println("2. Deposit to Checking");
            System.out.println("3. Withdraw from Savings");
            System.out.println("4. Withdraw from Checking");
            System.out.println("5. Check Savings Balance");
            System.out.println("6. Check Checking Balance");
            System.out.println("7. Exit");

            int choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    System.out.println("Enter deposit amount for Savings:");
                    double depositSavings = scanner.nextDouble();
                    savingsAccount.deposit(depositSavings);
                    break;
                case 2:
                    System.out.println("Enter deposit amount for Checking:");
                    double depositChecking = scanner.nextDouble();
                    checkingAccount.deposit(depositChecking);
                    break;
                case 3:
                    System.out.println("Enter withdrawal amount for Savings:");
                    double withdrawSavings = scanner.nextDouble();
                    savingsAccount.withdraw(withdrawSavings);
                    break;
                case 4:
                    System.out.println("Enter withdrawal amount for Checking:");
                    double withdrawChecking = scanner.nextDouble();
                    checkingAccount.withdraw(withdrawChecking);
                    break;
                case 5:
                    System.out.println("Savings Account Balance: " + savingsAccount.getBalance());
                    break;
                case 6:
                    System.out.println("Checking Account Balance: " + checkingAccount.getBalance());
                    break;
                case 7:
                    running = false;
                    System.out.println("Exiting the application. Goodbye!");
                    break;
                default:
                    System.out.println("Invalid option. Please try again.");
                    break;
            }
        }

        scanner.close();
    }
}
