# 🏆 NHL Hart Memorial Trophy Winner Prediction

## Overview
This project uses statistical learning techniques to predict the NHL Hart Memorial Trophy recipient, awarded to the league’s Most Valuable Player (MVP). It focuses on developing machine learning models to rank players based on their performance metrics.

The project was completed as part of the STAT 445 course at St. Francis Xavier University.

---

## Objectives
- Correctly predict the 2018–19 Hart Memorial Trophy recipient.
- Predict the top 10 players most likely to receive votes for the 2018–19 season.

---

## Dataset
- **Training data**: 2021–22 NHL season stats  
  - Started with 1,004 players, filtered down to 380 based on criteria.
- **Testing data**: 2018–19 NHL season stats  
  - Started with 906 players, filtered down to 359.

### Data Cleaning Steps:
- Removed duplicates (players traded mid-season had multiple entries).
- Filtered to players with:
  - Minimum 50 games played.
  - Average ice time per game of 15+ minutes.

> **Note**: Dataset files are included in the `/data/` folder (or linked externally if omitted).

---

## Variables Used
- GP: Games Played  
- G: Goals  
- A: Assists  
- plus_minus: Plus/Minus  
- PIM: Penalty Minutes  
- PS: Point Shares  
- TOI: Time on Ice  
- OPS/DPS: Offensive/Defensive Point Shares  
- vote_percent: % of votes received (response variable)

---

## Methods
- **Models Applied**:
  - Linear Regression  
  - Ridge Regression  
  - Lasso Regression  
  - Subset Selection  

- **Evaluation Metric**:
  - Mean Squared Error (MSE)
  - Comparison of predicted top 10 vs. actual top 10 MVP candidates

---

## Results
- The models correctly predicted Nikita Kucherov as the 2018-19 MVP.
- Ridge Regression improved rankings for top 10 candidates.
- Subset Selection produced the lowest MSE (≈31.78).

> See the `reports/` folder for the full HTML report and detailed analysis.

---

## Deliverables
- 📄 [Final Report (HTML)](reports/MWallace_S445_FinalProject.html)  
- 📊 [Presentation (PPTX)](presentations/S445_Final_Project_Presentation.pptx)

---

## Tools & Technologies
- R (tidyverse, glmnet, leaps)  
- Excel  
- ggplot2  
- R Markdown

---

## Author
Miranda Wallace  
Master of Data Science Student, Memorial University of Newfoundland 
