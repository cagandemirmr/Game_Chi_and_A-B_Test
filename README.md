# 🎮 Game Analysis with A/B Testing and Chi-Square Test

## 📌 Project Overview
This project focuses on analyzing game-related user data to evaluate the effectiveness of different onboarding variants using **A/B testing** and the **Chi-Square test**. The goal is to determine whether variant changes influence user engagement and purchases. For this analysis, I utilized **SQL** to gather insights and perform statistical tests.

---

## 📂 Data Import and Setup
- Imported CSV files into SQL tables using the `CREATE TABLE` statement and loaded data using the file paths.
- The dataset consists of artificially generated data using ChatGPT, simulating user behaviors and actions in a game environment.

![Data Import](https://github.com/user-attachments/assets/9462f787-fe4d-4c21-a3c1-bae1578719e1)

---

## 📊 About the Dataset

### 1. Experiment Assignments (`exp_analysis`)
- **Rows**: 100,172
- **Columns**: 4 (`exp_name`, `user_id`, `exp_date`, `variant`)
- **Details**:
  - `exp_name`: Contains a single experiment labeled "Onboarding".
  - `user_id`: Contains **100,172 distinct values**.
  - `exp_date`: Ranges from **2020-01-01** to **2020-02-19**, with 50 unique dates.
  - `variant`: Two groups - **Variant 1** and **Control Group**.

### 2. Game Actions (`game_actions`)
- **Rows**: 124,185
- **Columns**: 3 (`user_id`, `action`, `action_date`)
- **Details**:
  - `action`: Includes "onboarding complete" and "email_optin".
  - `user_id`: **87,124 distinct values**.
  - `action_date`: Ranges from **2020-01-01** to **2020-02-19**, with 50 unique dates.

### 3. Game Purchases (`game_purchases`)
- **Rows**: 12,897
- **Columns**: 3 (`user_id`, `purch_date`, `amount`)
- **Details**:
  - `user_id`: **9,969 distinct values**.
  - `purch_date`: Ranges from **2020-01-01** to **2020-03-11**, with 70 unique dates.
  - `amount`: Contains 6 distinct purchase values: **2.99, 10, 25, 50, 100, 999**.

![Data Summary](https://github.com/user-attachments/assets/bfdcbec4-530d-4563-b220-d062bb2e04bd)

---

## 🧪 A/B Testing & Chi-Square Analysis

### 1. Initial Chi-Square Test
- Conducted a **Chi-Square test** online to compare the success rates between **Variant 1** and the **Control Group**.
- **Result**: Variant 1 was significantly more successful.

![Chi-Square Result](https://github.com/user-attachments/assets/b8a54e15-0217-4110-a2fd-e119da9e37ae)

### 2. Calculating Statistical Metrics
- Used SQL functions (`AVG`, `STDDEV`) to compute **mean** and **standard deviation** for further statistical analysis.

![Metrics Calculation](https://github.com/user-attachments/assets/38c7e657-1e3a-4807-a017-7074245697f5)

### 3. Updated Chi-Square Test
- Recalculated the Chi-Square test with SQL-derived metrics.
- **Result**: No significant difference between **Variant 1** and **Control** after recalculating.

---

## 🎯 Hypothesis Testing

### 1. Onboarding Completion Analysis
- Joined the `game_actions` table to assess the total number of users who completed onboarding.
- **Result**: The null hypothesis was rejected, indicating a significant difference between the two variants.

![Onboarding Analysis](https://github.com/user-attachments/assets/936f0a90-29c8-4f3a-a080-2f19f422bb39)

### 2. Success Metric: Purchase Behavior
- Redefined the success metric as **user purchases** and reran the analysis.
- **Result**: Significant difference between the two variants based on purchase behavior.

![Purchase Analysis](https://github.com/user-attachments/assets/7364925b-6b08-4f50-9457-0b68e05cdf5d)

### 3. 7-Day Interval Analysis
- Performed an analysis to evaluate differences over a 7-day interval.
- **Result**: No significant difference between the variants in a week-by-week comparison.

![7-Day Analysis](https://github.com/user-attachments/assets/d6d550a9-9c61-4fcb-9d35-e2222e212674)

### 4. Time Period Analysis
- Analyzed differences between two distinct time periods.
- **Result**: Significant differences observed, but reliability may be affected by external factors.

![Time Period Analysis](https://github.com/user-attachments/assets/4ed2b317-00de-4e97-9f18-7ce25ad4c1f2)

### 5. Country-Based Analysis (Canada vs. USA)
- Compared user behavior between Canada and the USA.
- **Result**: Differences were noted, but conclusions may be unreliable due to varying population sizes and demographic factors.

![Country Analysis](https://github.com/user-attachments/assets/71d84b24-312a-4b6d-8f3b-f4bfdbda2f95)

---

## 📊 Insights and Conclusions
1. **Variant 1** initially appeared to be more effective than the Control group based on onboarding actions.
2. However, when shifting the metric to actual **purchases**, the difference between the variants became less clear.
3. The time-based analysis revealed fluctuations that could be due to external factors, making it necessary to control for variables like seasonality or promotional events.
4. Country-specific analyses suggest that demographic factors may influence game engagement and purchases.

---

## 🛠️ Tools and Technologies
- **SQL**: Data extraction, transformation, and analysis.



