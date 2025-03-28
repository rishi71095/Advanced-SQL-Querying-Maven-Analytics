## Overview

As part of my continuous learning, I recently completed the Advanced SQL Querying course from Maven Analytics, where I explored advanced SQL techniques and applied them to a real-world baseball analytics project.

For this project, I analyzed decades of player statistics using the Sean Lahman Baseball Database to uncover insights into salary trends, team impact, and player performance evolution. To achieve this, I leveraged:

*   Multi-Table Analysis: Combining data across multiple tables with JOINs (INNER, LEFT, RIGHT, CROSS, and SELF JOINs)
    
*   Subqueries & CTEs: Breaking down complex queries to track player transfers, salary progression, and team dynamics
    
*   Window Functions: Calculating rankings, cumulative salaries, and running totals for performance analysis
    
*   Functions by Data Type: Manipulating dates, strings, and numerical data to ensure accuracy and consistency
    
*   Pivoting & Rolling Calculations: Using CASE statements and window functions to analyze historical trends
    

This project not only strengthened my SQL expertise but also reinforced the power of data-driven insights in sports analytics.

## About the data

Full Sean Lahman's Baseball data is available at: [https://www.kaggle.com/datasets/freshrenzo/lahmanbaseballdatabase](https://www.kaggle.com/datasets/freshrenzo/lahmanbaseballdatabase). This project uses some tables from that dataset and is available as .sql file to use if you need to create that database and tables.

## Project Premise

*   You've just been hired as a Data Analyst Intern for Major League Baseball (MLB), who has recently gotten access to a large amount of historical player data.
    
*   You have access to decades worth of data including player statistics like schools attended, salaries, teams played for, height and weight, and more.
    
*   Your task is to use advanced SQL querying techniques to track how player statistics have changed over time and across different teams in the league.
    

## Questions

### Part 1

a) In each decade, how many schools were there that produced MLB players?

![image](https://github.com/user-attachments/assets/9822e887-8013-4e1a-bd01-c06d5fc77e26)

b) What are the names of the top 5 schools that produced the most players?

![image](https://github.com/user-attachments/assets/fb06b73e-0c1c-430b-bfd7-15eb7c79269e)

c) For each decade, what were the names of the top 3 schools that produced the most players?

### Part 2

a) Return the top 20% of teams in terms of average annual spending

![image](https://github.com/user-attachments/assets/bb8468ba-fe99-4a3c-8029-f0575af55cfb)

b) For each team, show the cumulative sum of spending over the years

c) Return the first year that each team's cumulative spending surpassed 1 billion

### Part 3

a) For each player, calculate their age at their first (debut) game, their last game, and their career length (all in years). Sort from longest career to shortest career.

b) What team did each player play on for their starting and ending years?

c) How many players started and ended on the same team and also played for over a decade?

### Part 4

a) Which players have the same birthday?

b) Create a summary table that shows for each team, what percent of players bat right, left and both.

![image](https://github.com/user-attachments/assets/22e23b8d-24c6-4ff3-a50c-2549c63f719e)

c) How have average height and weight at debut game changed over the years, and what's the decade-over-decade difference?

![image](https://github.com/user-attachments/assets/dbce2aa8-7465-4b5e-8c8d-6f14b3bb4c8e)
