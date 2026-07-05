# Motor Insurance Management System (MySQL)

## Overview

The **Motor Insurance Management System** is a relational database
project developed using **MySQL**. It models the core operations of a
motor insurance company, including customer management, vehicle
registration, quotation generation, premium calculation, policy
issuance, payment processing, claims, and business reporting.

------------------------------------------------------------------------

## Objectives

-   Design a normalized relational database.
-   Implement business relationships using primary and foreign keys.
-   Store and manage insurance data efficiently.
-   Demonstrate SQL concepts from basic to advanced.
-   Generate business reports using SQL queries.

------------------------------------------------------------------------

## Technologies Used

-   MySQL 8.0
-   MySQL Workbench

------------------------------------------------------------------------

## Database Modules

-   Region Management
-   State Management
-   City Management
-   User & Role Management
-   Login Management
-   Broker Management
-   Sales Agent Management
-   Customer Management
-   Vehicle Management
-   Insurance Quote Management
-   Coverage Management
-   Premium Rate Management
-   Payment Management
-   Policy Management
-   Claim Management
-   Audit Logging

------------------------------------------------------------------------

## Database Objects

### Database

-   1 Database

### Tables (24)

1.  mi_regions
2.  mi_states
3.  mi_cities
4.  mi_vehicle_make
5.  mi_vehicle_model
6.  mi_vehicle_body
7.  mi_vehicle_color
8.  mi_vehicle_category
9.  mi_lov_master
10. mi_coverages
11. mi_user_roles
12. mi_users
13. mi_login_users
14. mi_brokers
15. mi_sales_agents
16. mi_customers
17. mi_vehicles
18. mi_quotes
19. mi_quote_coverages
20. mi_premium_rates
21. mi_payments
22. mi_policies
23. mi_claims
24. mi_audit_log

### Other SQL Objects

-   3 Views
-   3 Indexes
-   4 Stored Functions
-   4 Stored Procedures
-   4 Triggers
-   2 Transactions
-   30 Business Scenarios

------------------------------------------------------------------------

## SQL Concepts Covered

-   Database Creation
-   Table Creation
-   Constraints
-   Primary Keys
-   Foreign Keys
-   Data Insertion
-   INNER JOIN
-   LEFT JOIN
-   Aggregate Functions
-   GROUP BY
-   ORDER BY
-   WHERE
-   HAVING
-   Window Functions (RANK)
-   Views
-   Indexes
-   Stored Functions
-   Stored Procedures
-   Triggers
-   Transactions

------------------------------------------------------------------------

## Business Scenarios

### Customer & Vehicle Analysis

1.  Top Premium Paying Customer
2.  Customer Owning Maximum Vehicles
3.  Customers with Highest Premium Spending
4.  Customers Who Used Online Payment
5.  Customer Policy History

### Broker & Agent Analysis

6.  Broker Generating Highest Premium
7.  Sales Agent Generating Highest Business
8.  Broker-wise Business Report
9.  Agent-wise Business Report
10. Broker Ranking by Business

### Vehicle & Coverage Analysis

11. Vehicle Category with Highest Policies
12. Most Selected Coverage
13. Coverage Generating Highest Premium
14. Average Premium by Vehicle Category
15. Vehicles with Quotes Generated

### Payment & Policy Analysis

16. Successful Payment Details
17. Paid Quotes with Generated Policies
18. Lowest Premium Policy
19. Top 10 Premium Policies
20. Active Policy Report

### Claims Analysis

21. Policies with Registered Claims
22. Highest Claim Amount
23. Claim Summary Report

### Regional Business Analysis

24. City with Highest Customers
25. State with Highest Policies
26. Region with Highest Business

### Dashboard & Analytics

27. Monthly Premium Collection Report
28. Active vs Inactive Customers
29. Customer Ranking by Premium
30. Complete Insurance Dashboard Report

------------------------------------------------------------------------

## Project Highlights

-   Normalized database design
-   Business-oriented table relationships
-   Secure and structured data storage
-   Automated business operations using procedures and triggers
-   Performance optimization using indexes
-   Reusable business logic using functions
-   Business analytics through SQL reporting scenarios

------------------------------------------------------------------------

## Conclusion

This project demonstrates the implementation of a complete Motor
Insurance Management System using MySQL. It combines database design,
SQL programming, and business reporting into a practical application
that showcases both fundamental and advanced database concepts.
