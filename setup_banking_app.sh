#!/bin/bash

# Variables
PROJECT_NAME="BankingApp"
SRC_DIR="$PROJECT_NAME/src"
MODELS_DIR="$SRC_DIR/models"
MAIN_DIR="$SRC_DIR/main"
GITHUB_REPO_URL="https://github.com/yourusername/BankingApp.git"

# 1. Create project folder and directories
mkdir -p $MODELS_DIR $MAIN_DIR

# 2. Create Java files with code

# Account.java
cat > $MODELS_DIR/Account.java << 'EOL'
package models;

public abstract class Account {
    private String accountNumber;
    private double balance;

    public Account(String accountNumber) {
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposited " + amount + " into account " + accountNumber);
        } else {
            System.out.println("Deposit amount must be positive.");
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Withdrew " + amount + " from account " + accountNumber);
        } else {
            System.out.println("Invalid withdrawal amount.");
        }
    }

    public abstract void displayAccountType();
}
EOL

# SavingsAccount.java
cat > $MODELS_DIR/SavingsAccount.java << 'EOL'
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
EOL

# CheckingAccount.java
cat > $MODELS_DIR/CheckingAccount.java << 'EOL'
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
EOL

# Main.java
cat > $MAIN_DIR/Main.java << 'EOL'
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
EOL

# README.md
cat > $PROJECT_NAME/README.md << 'EOL'
# Simple Banking Application

This is a simple Java-based banking application that allows users to manage savings and checking accounts, deposit and withdraw funds, and check balances. The project demonstrates object-oriented programming (OOP) principles using inheritance and method overriding.

## Features
- Create Savings and Checking accounts
- Deposit and Withdraw money
- Check account balances
- Command-line interface

## How to Run
1. Clone the repository: `git clone https://github.com/yourusername/BankingApp.git`
2. Navigate to the `src` folder: `cd BankingApp/src`
3. Compile the Java code: `javac -d bin models/*.java main/*.java`
4. Run the program: `java -cp bin main.Main`
EOL

# 3. Initialize Git, Commit, and Push to GitHub
cd $PROJECT_NAME
git init
git add .
git commit -m "Initial commit - Java Banking Application"
git remote add origin $GITHUB_REPO_URL
git push -u origin master

echo "Java Banking App created and pushed to GitHub successfully!"
