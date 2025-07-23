#  Sales Analytics Project using Power BI & SQL Server

This project showcases a complete sales analytics solution using Power BI and SQL Server. The analysis covers sales trends, customer segmentation, product performance, and goal achievements. The data was imported, modeled, visualized, and interpreted to provide clear business insights and actionable recommendations.

---

##  Project Overview

-  Imported 5 Excel datasets into SQL Server.
-  Answered 20+ business questions using T-SQL.
-  Imported data into Power BI and transformed it via Power Query.
-  Created a star schema model: Fact table + Dimension tables.
-  Built an interactive dashboard with KPIs, time trends, and smart visuals (Q&A, Decomposition Tree, Narrative).
-  Delivered actionable insights and business recommendations.

---

##  Tools & Technologies

- Microsoft Power BI  
- Microsoft SQL Server  
- Power Query  
- T-SQL  
- DAX  
- Excel

---

## 📁 Data Structure

- `Fact_Sales`: ID, Date, Amount, ProductID, Status, StoreID, Unit
- `Dim_Customer`: ID, Gender, Age Group
- `Dim_Product`: Product, ProductID, Category, CategoryID, Segment, SegmentID, Price, Price Range
- `Dim_Store`: StoreID, Store Name, Type, Longitude, Latitude
- `Store_Goals`: StoreID, Net Sales Goal, Region, High Goal, Region Filter, Geography

---

## 📌 Key Insights

1. **Total Sales** reached $3.42M, with an **achievement rate of 1646%**.
2. **Flat Plains** region led with $1.35M, while **Atlantic** lagged behind at $0.89M.
3. **Office 365** was the best-selling product ($0.43M), whereas **Neon Blue** had the lowest sales ($0.02M).
4. **Magenta segment** performed strongly ($0.16M).
5. **Male customers** accounted for 72.52% of sales ($2.48M), while **females** contributed 27.48% ($0.94M).
6. **21–25 age group** drove the highest sales ($1.4M); **31–35** was the lowest at $0.37M.
7. Internal and external stores both contributed significantly, with **Fama** and **Contoso** as top performers.

---

## 💡 Recommendations

-  Focus on boosting sales in underperforming regions like Atlantic.
-  Increase marketing efforts targeting female customers.
-  Continue targeting 21–25 age group and engage 31–35 with promotions.
-  Promote top-performing products (Office 365, Magenta); assess improvement strategies for Neon Blue.
-  Replicate success from Flat Plains stores (e.g., Fama) in other regions.

---

## 📎 Project Files

| File | Description |
|------|-------------|
| `Sales-Analysis.pbix` | Power BI dashboard file |
| `Sales-Analysis.pdf` | Final report with insights |
| `SQL_Questions.pdf` | 20+ business questions & answers |
| `SQLQuery1.sql` | SQL scripts used |
| `*.xlsx` | Raw datasets (Sales, Products, Customers, Stores, Goals) |



