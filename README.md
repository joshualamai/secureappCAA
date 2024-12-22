# README

BookManager Application

This repository contains two versions of a book management system: Insecure and Secure. Both versions are implemented using Ruby on Rails. The insecure version demonstrates vulnerabilities, while the secure version addresses these issues to create a safer application.

Features

User login and registration.

Add, edit, and delete books.

Logs for user activities (e.g., login, logout).

Versions

1. Insecure Version

The insecure version demonstrates common web application vulnerabilities, including:

SQL Injection: The application does not sanitize user inputs, allowing attackers to manipulate database queries.

Cross-Site Scripting (XSS): User input is rendered directly without proper encoding, enabling script injection.

Sensitive Data Exposure: Plaintext passwords are stored and visible in the application logs and database.

How to Run the Insecure Version:

Clone the repository:

git clone https://github.com/your-repo/insecure-version.git
cd insecure-version

Install dependencies:

bundle install

Set up the database:

rails db:create db:migrate

Start the Rails server:

rails server

Access the application at http://localhost:3000.

Known Vulnerabilities:

SQL Injection: Malicious inputs like 1' OR '1'='1 can bypass authentication.

XSS: Entering <script>alert('XSS');</script> into form fields will execute scripts.

Plaintext Passwords: Passwords are stored in the database in plaintext.

2. Secure Version

The secure version addresses the vulnerabilities present in the insecure version:

SQL Injection: All database queries use parameterized statements to prevent injection attacks.

XSS Protection: User inputs are sanitized and escaped before rendering in views.

Sensitive Data Protection: Passwords are hashed using bcrypt, and sensitive data is filtered from logs.

How to Run the Secure Version:

Clone the repository:

git clone https://github.com/your-repo/secure-version.git
cd secure-version

Install dependencies:

bundle install

Set up the database:

rails db:create db:migrate

Start the Rails server:

rails server

Access the application at http://localhost:3000.

Security Measures:

SQL Injection Prevention: All user inputs are sanitized.

XSS Mitigation: Proper escaping of user-generated content.

Encrypted Passwords: Passwords are hashed and securely stored.

HTTPS: Forces secure connections.

Usage

Register a new user or log in using an existing account.

Manage your book collection by adding, editing, or deleting books.

View activity logs (in the secure version, only secure logs are stored).

Testing Vulnerabilities

For the insecure version, you can test vulnerabilities such as SQL Injection, XSS, and sensitive data exposure by:

Injecting SQL commands in input fields.

Entering malicious scripts to test XSS.

Inspecting logs or database for plaintext passwords.

For the secure version, confirm that these vulnerabilities are mitigated by trying similar attacks and observing that they fail.

License

This project is open-source and available for educational purposes. Use at your own risk.