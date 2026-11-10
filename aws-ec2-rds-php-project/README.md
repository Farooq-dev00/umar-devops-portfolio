 AWS EC2 + RDS + PHP Web Application

 Project Overview
Deployed a PHP web application on Amazon EC2 connected to an Amazon RDS MySQL database.

 AWS Services Used
- Amazon EC2 – Application hosting
- Amazon RDS – Managed MySQL database
- VPC – Private network connectivity
- Security Groups – Network access control

 Architecture
User → EC2 (Apache + PHP) → Amazon RDS (MySQL)

 Practical Implementation
1. Launched an Amazon Linux EC2 instance.
2. Created an Amazon RDS MySQL database.
3. Configured private connectivity between EC2 and RDS.
4. Installed Apache, PHP and MySQL client.
5. Created a students table.
6. Inserted and retrieved student records.
7. Built a PHP webpage displaying database records.

 Database Operations
- CREATE TABLE
- INSERT INTO
- SELECT

 Result
Successfully deployed a PHP webpage displaying student records retrieved from Amazon RDS.

 Security
- RDS configured without public access.
- Database access restricted through security groups.
- Database credentials must remain private.
