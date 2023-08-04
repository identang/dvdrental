# DVD Rental Database Analysis

## Introduction
This repository showcases my skills in SQL data analysis, specifically using the PostgreSQL Sample Database from [postgresqltutorial.com](https://www.postgresqltutorial.com/). The project involves analyzing the DVD rental database to gain valuable insights and make data-driven decisions for a hypothetical DVD rental company.

## Queries
### 1. Most Popular and Profit Making Film Category
- Query: `most_popular_profitable_categories.sql`
- Description: This query identifies the most popular and profitable film categories by counting the number of rentals and calculating the total revenue for each category.
- Business Impact: By knowing which film categories are both popular among customers and generate significant revenue, the company can optimize its film selection and promotional efforts. This insight can lead to increased customer satisfaction, higher rental rates, and ultimately, improved profitability.

### 2. Top Category Among Existing Films
- Query: `top_category_among_films.sql`
- Description: This query identifies the top film category among the existing films by counting the number of films in each category.
- Business Impact: Understanding the most prevalent film category allows the company to align its inventory and marketing strategies accordingly. By focusing on the most in-demand category, the company can attract a larger customer base and improve overall rental frequency, leading to increased revenue.

### 3. Correlation between Top Category and Profitable Film Category
- Query: `correlation_top_category_profitable.sql`
- Description: This query calculates the correlation between the top film category and the most profitable film category.
- Business Impact: Identifying the correlation between popularity and profitability enables the company to target specific film categories that align with both metrics. This insight guides decision-making in stocking and promoting films that are likely to be both popular among customers and generate substantial revenue.

### 4. Categories with High Replacement Cost
- Query: `categories_high_replacement_cost.sql`
- Description: This query identifies film categories with relatively high replacement costs based on the average replacement cost per category.
- Business Impact: Knowing which film categories have high replacement costs allows the company to allocate resources efficiently and make informed decisions about pricing. By understanding the replacement cost dynamics, the company can adjust rental fees and focus on cost-effective film categories to maximize profitability.

### 5. Favourite Category of Each Customer
- Query: `favourite_category_each_customer.sql`
- Description: This query identifies the favourite film category for each customer based on the number of rentals in each category.
- Business Impact: Personalizing the customer experience based on their favourite film category enhances customer satisfaction and loyalty. By recommending films from their preferred category, the company can foster stronger customer relationships, resulting in increased customer retention and repeat business.

### 6. Top 10 Customers by Spending
- Query: `top_10_customers_by_spending.sql`
- Description: This query identifies the top 10 customers who have spent the most on rentals.
- Business Impact: Recognizing and rewarding high-value customers builds customer loyalty and fosters positive word-of-mouth. By offering personalized promotions and incentives to these top customers, the company can encourage higher spending and customer referrals, driving revenue growth.

### 7. Top 20 Films by Revenue
- Query: `top_20_films_by_revenue.sql`
- Description: This query identifies the top 20 films that have generated the most revenue.
- Business Impact: Understanding which films are the most profitable enables the company to optimize inventory management and marketing efforts. By promoting these successful films and acquiring similar ones, the company can attract more customers and increase overall revenue.

### 8. Geographical Distribution of Customers
- Query: `geographical_distribution_of_customers.sql`
- Description: This query provides the geographical distribution of customers based on the city they reside in.
- Business Impact: Understanding the geographic concentration of customers helps the company target specific regions for marketing campaigns and identify potential expansion opportunities. By tailoring marketing strategies to regional preferences, the company can increase customer acquisition and market share.

### 9. Categorizing Customers based on Rental Quantity
- Query: `categorizing_customers_by_rental_quantity.sql`
- Description: This query categorizes customers based on their rental quantity, segmenting them into Loyal, Supportive, Occasional, and Casual groups.
- Business Impact: Segmenting customers allows the company to design targeted marketing campaigns and loyalty programs that match the preferences and behaviors of each segment. By providing personalized offers and incentives, the company can increase customer engagement and retention across different customer groups.

## How to Use
1. Clone this repository to your local machine.
2. Make sure you have PostgreSQL installed and the DVD rental database set up.
3. Use a PostgreSQL client or the command-line tool to execute the SQL files containing the queries.
4. Review the results of each query to gain insights into the DVD rental business.
