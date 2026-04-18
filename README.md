# Healthcare Analytics Pipeline for Readmission Risk Optimization

## Executive Summary: 

Using Python, MySQL, and Power BI, I analyzed hospital readmission data and developed a dashboard to track patient risk patterns and key drivers of readmission. The analysis identified that chronic conditions, higher medication usage, and longer hospital stays significantly contribute to increased readmission rates.

Based on these insights, the following recommendations were made to improve patient outcomes and reduce readmissions:

1. Implement targeted follow-up for high-risk patients
2. Improve post-discharge care for chronic conditions
3. Optimize treatment planning and hospital stay management

# Business Problem:

Hospital readmissions, particularly within 30 days, are a critical indicator of healthcare quality and operational efficiency. High readmission rates increase treatment costs, strain hospital resources, and negatively impact patient outcomes.

This project focuses on analyzing diabetic patient data to identify key factors driving readmissions and uncover high-risk patient segments. The goal is to enable healthcare providers to make data-driven decisions that reduce preventable readmissions, improve patient care, and optimize hospital performance.

<img width="1408" height="768" alt="Gemini_Generated_Image_peatulpeatulpeat (1)" src="https://github.com/user-attachments/assets/9c57a8a7-e11e-43c4-bcbb-f8b033e6df6b" />

# Methodology: 

1. Data Preparation & Exploration : Imported the dataset into Jupyter Notebook, performed data cleaning, feature engineering, and exploratory data analysis (EDA) to understand patterns and prepare an analysis-ready dataset.
2. SQL-Based Business Analysis: Loaded the processed data into MySQL and conducted structured analysis using SQL to answer key business questions, including readmission overview, patient risk drivers, clinical complexity, operational factors, and high-risk patient segmentation.
3. Dashboard & Visualization: Developed an interactive Power BI dashboard (3 report pages) to visualize key insights, highlight high-risk groups, and support data-driven decision-making.

# Project Architecture

<img width="897" height="473" alt="Screenshot 2026-04-18 145114" src="https://github.com/user-attachments/assets/463ba235-9673-4628-9526-fc0d49eb4a37" />

# Skills:

Python: Pandas, NumPy, Matplotlib, data cleaning, feature engineering, EDA, statistical analysis.

SQL: CTEs, Joins, CASE statements, aggregate functions, window functions, business query analysis.

Power BI: DAX, calculated columns, data modeling, dashboard development, data visualization, KPI design.

# Result and Business Recommendation:

## Result Obtained:

- Chronic conditions such as Diabetes and Hypertension/Heart Disease are key drivers of readmission, indicating long-term disease impact.
- Patients with higher medication counts, longer hospital stays, and increased lab procedures show significantly higher readmission rates, reflecting clinical complexity.
- Frequent hospital visitors and certain diagnosis groups contribute disproportionately to readmissions, highlighting high-risk patient segments.
- Demographic factors such as age show influence, while gender and race have limited impact on readmission likelihood.

<img width="1531" height="857" alt="Exective Summary" src="https://github.com/user-attachments/assets/d8feac61-8a6d-46eb-a530-dae00851a6bd" />

## Business Recommendations:

- Target High-Risk Patients: Implement focused care programs for patients with chronic conditions and high clinical complexity.
- Enhance Post-Discharge Care: Introduce follow-up protocols, remote monitoring, and patient education to reduce short-term readmissions.
- Optimize Treatment & Resource Planning: Improve discharge planning and medication management for patients with longer stays and intensive treatment.
- Leverage Predictive Insights: Use data-driven segmentation to proactively identify and manage patients with high readmission risk.

These insights enable healthcare providers to reduce preventable readmissions, improve patient outcomes, and optimize operational efficiency.

# Next Steps:

- Predictive Modeling (Machine Learning): Develop a classification model to predict the likelihood of patient readmission using engineered features and evaluate model performance using appropriate metrics.
- Advanced Feature Engineering & Optimization: Enhance feature set with interaction variables and perform feature selection to improve model accuracy and interpretability.
- Deployment & Automation: Extend the project by building a simple deployment pipeline or integrating the model into a dashboard for real-time risk prediction and decision support.

# Limitations:

- Lack of Temporal Data: Although the dataset spans multiple years (1999–2008), it does not include explicit date or timestamp fields, limiting the ability to perform time-based trend analysis such as yearly or seasonal readmission patterns.
- Limited Clinical Context: The dataset lacks detailed clinical information such as severity of illness, treatment protocols, and physician notes, which may impact the accuracy of insights related to patient outcomes.
- Static Analysis Scope: The analysis is based on historical data and does not incorporate real-time data or predictive modeling, limiting its ability to support proactive decision-making.

# Final Note:

If you found this project insightful or valuable, feel free to ⭐ star the repository.

I would also love to hear your feedback or suggestions to further improve the analysis and make it more impactful.








