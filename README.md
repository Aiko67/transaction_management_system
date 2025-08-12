# Transaction Management System

## Overview
This is a simple web application built with Ruby on Rails that lets you manage financial transactions. It stores transaction data in a CSV file instead of a database. You can view all transactions and add new ones through a web interface.

---

## How to Run the Application

### 1. Install Ruby and Rails

- Ruby is the programming language used.
- Rails is the web framework built with Ruby.

If you don't have Ruby installed, download it here:  
https://www.ruby-lang.org/en/downloads/

After installing Ruby, open your Terminal or Command Prompt and install Rails by running:

gem install rails

To check Rails is installed, type:

rails -v

You should see something like: `Rails 8.0.2`.

---

### 2. Download or Clone the Project

- Download the project folder from your source, or  
- Use Git to clone the project:

git clone https://github.com/Aiko67/transaction_management_system.git

---

### 3. Navigate to the Project Folder

In your Terminal, go to the project directory:

cd path/to/transaction_system

Replace with your actual folder path.

---

### 4. Install Dependencies

Run:

bundle install

This installs all required libraries (called gems).

---

### 5. Create the CSV File

Create a file named `transactions.csv` inside the project folder.

Add this header line to the file:

Transaction Date,Account Number,Account Holder Name,Amount,Status

Add sample transactions:

2025-03-01,7289-3445-1121,Maria Johnson,150.00,Settled

2025-03-02,1122-3456-7890,John Smith,75.50,Pending

2025-03-03,3344-5566-7788,Robert Chen,220.25,Settled

Save the file.

---

### 6. Run the Rails Server

Start the server by running:

rails server

or simply

rails s

---

### 7. Open in Browser

Go to:

http://localhost:3000

You will see the list of transactions.

---

### 8. Add Transactions

- Click **Add Transaction** to fill the form.  
- Enter all required fields.  
- Account Number must have 12 digits and be formatted like `1234-5678-9012`.  
- Amount must be a positive number with two decimals.  
- Submit to add the transaction.

If there are errors, messages will appear so you can fix them.

---

### 9. Stop the Server

Press `Ctrl + C` in the Terminal to stop the server.

---

## Notes

- This app uses a CSV file for storage; no database setup needed.  
- You can edit the `transactions.csv` file manually to reset data.  
- Make sure to run commands in the project folder.

---

Feel free to ask for help if you get stuck!

---

**Happy coding!**
