# **Amazon-Like E-Commerce Analytics**  
### **Advanced SQL Solutions for Business Optimization**  

## **Project Overview**  
I analyzed a dataset of over 20,000 sales records from an Amazon-like e-commerce platform. This project involves extensive querying of **customer behavior**, **product performance**, and **sales trends** using **PostgreSQL** and **Advanced SQL**.  

Through this project, I tackled key business problems, including revenue analysis, customer segmentation, and inventory management.  

Key highlights:  
- **Data Cleaning:** Removed duplicates, handled null values, and ensured data quality for robust analysis.  
- **Complex SQL Queries:** Solved real-world business problems, optimized inventory, and improved customer retention.  
- **ERD Design:** A comprehensive entity-relationship diagram was created to visualize the database schema and relationships.  

---

## **Schema Structure**  
- The database contains **8 tables**:  
  `customers`, `sellers`, `products`, `orders`, `order_items`, `inventory`, `payments`, and `shippings`.  
- Designed with **primary keys**, **foreign key constraints**, and optimized indexing to maintain data integrity and ensure high query performance.  
- **Constraints** include referential integrity, default values, and uniqueness for fields like `product_id`, `order_id`, and `customer_id`.  

---

## **Key Business Problems Identified**  
1. **Low product availability** due to inconsistent restocking.  
2. **High return rates** for specific product categories.  
3. **Shipping delays** and inconsistencies in delivery times.  
4. **Low customer retention rates** due to high acquisition costs.  

---

## **Solutions Implemented**  
1. **Restock Prediction**: Forecasted product demand using past sales trends to optimize restocking cycles and reduce stockouts.  
2. **Product Performance**: Identified high-return products and suggested bundling and pricing strategies.  
3. **Shipping Optimization**: Analyzed shipping delays to recommend better logistics strategies.  
4. **Customer Segmentation**: Conducted RFM analysis to target "At-Risk" customers and improve retention.  

---

## **Handling Null Values**  
Null values were handled based on context:  
- **Customer addresses:** Missing values replaced with default placeholders.  
- **Payment statuses:** Nulls categorized as "Pending."  
- **Shipping details:** Null return dates left as-is for unreturned shipments.  

---

## **SQL Queries & Techniques**  
This project showcases a range of **Advanced SQL techniques**, including:  
- **Joins** and **subqueries** for combining and filtering data.  
- **Window functions** for advanced analytics (e.g., RFM analysis).  
- **Aggregate functions** to compute KPIs such as AOV, category revenue, and success rates.  
- **Stored Procedures** to automate inventory updates and reduce stock based on sales.  

---

## **Learning Outcomes**  
This project enabled me to:  
- Design and implement a normalized **database schema**.  
- Clean and preprocess real-world datasets for analysis.  
- Use advanced SQL techniques to solve complex data problems.  
- Optimize query performance and handle large datasets efficiently.  

---

## **Entity Relationship Diagram (ERD)**  
The ERD visually represents the relationships between tables, ensuring referential integrity and aiding query optimization.  

### **ERD Diagram (Created by Me)**  
![ERD Created by Me](https://github.com/anuragyadav04/Advanced-Ecommerce-SQL-Analytics/blob/main/Amazon_Schema.jpg)  

### **ERD Diagram (Generated by PostgreSQL)**  
![ERD from PostgreSQL](https://github.com/anuragyadav04/Advanced-Ecommerce-SQL-Analytics/blob/main/Amazon_Schema.png)  

---

## **Conclusion**  
This project demonstrates how SQL can solve real-world business problems in e-commerce, such as customer retention, inventory management, and logistics optimization.  

By completing this project, I have strengthened my ability to leverage SQL for data analysis and decision-making in complex scenarios.  

---

