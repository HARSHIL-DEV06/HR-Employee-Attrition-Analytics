# 📊 HR Employee Attrition Analytics Dashboard

> **End-to-end HR analytics project** — from raw MySQL data to an interactive Power BI dashboard — uncovering the root causes of employee attrition in a 1,470-employee organization.

---

## 🎯 Problem Statement

Employee attrition is one of the most expensive HR challenges — replacing a single employee can cost **50–200% of their annual salary**. This project answers a critical business question:

> **"Which employees are most at risk of leaving, and why?"**

Using a real-world IBM HR dataset of **1,470 employees**, I conducted a full-stack analytics investigation across SQL, Python, Excel, and Power BI to surface actionable retention insights for HR leadership.

---

## 🛠️ Tech Stack

| Layer | Tools Used |
|-------|-----------|
| **Database** | MySQL |
| **Querying** | SQL (GROUP BY, Aggregations, Filtering) |
| **EDA & Visualization** | Python — Pandas, Matplotlib, Seaborn, SQLAlchemy |
| **Excel Reporting** | Pivot Tables, Conditional Formatting (Red-Yellow-Green) |
| **BI Dashboard** | Power BI (DAX Measures, KPI Cards, Slicers) |
| **Export** | openpyxl (Python → Excel) |

---

## 📁 Repository Structure

```
hr-attrition-analytics/
│
├── HR_Analytics_Dashboard.pbix     # Power BI dashboard file
├── analyzer.ipynb                  # Python EDA notebook
├── database_queries.sql            # 10 analytical SQL queries
├── HR_Employee_Attrition.xlsx      # Excel Pivot Table report
├── HR_Attrition_Report.pdf         # Full PDF report with findings
└── README.md
```

---

## 🔍 Analytics Workflow

### Stage 1 — Data Extraction via SQL (MySQL)

Wrote **10 targeted SQL queries** to interrogate the dataset from multiple business angles:

| # | Business Question | Key Finding |
|---|-------------------|-------------|
| Q1 | Which job roles have highest attrition? | Sales Representatives top the list |
| Q2 | Do low earners leave more often? | Attriting employees earn significantly less on average |
| Q3 | Does frequent business travel cause attrition? | `Travel_Frequently` group shows highest exit count |
| Q4 | Which marital status group leaves most? | Single employees switch jobs most frequently |
| Q5 | Average age of employees who leave? | Younger employees (≈28–30 yrs) are the highest-risk group |
| Q6 | Does distance from home matter? | Employees who leave have a higher average commute distance |
| Q7 | Impact of poor work-life balance? | Rating 1 (worst) employees show disproportionate exits |
| Q8 | Are job-hoppers less likely to stay? | Attriting employees have more prior companies on average |
| Q9 | Does promotion delay trigger attrition? | Longer promotion gaps correlate with higher attrition |
| Q10 | Low environment satisfaction exits? | Rating 1 satisfaction = highest exit concentration |

📄 Full queries: [`database_queries.sql`](database_queries.sql)

---

### Stage 2 — Exploratory Data Analysis (Python)

Connected directly to MySQL via `SQLAlchemy`, loaded the dataset into Pandas, and generated the following visualizations:

- **Attrition Count Plot** — Overall Yes/No distribution
- **Overtime vs Attrition** — Impact of overwork on resignations
- **Monthly Income vs Attrition** — Boxplot comparing salary bands
- **Correlation Heatmap** — Feature relationships across all numeric columns
- **Job Role-wise Attrition** — Horizontal bar chart by role

📓 Full notebook: [`analyzer.ipynb`](analyzer.ipynb)

---

### Stage 3 — Excel Pivot Report

Exported the cleaned dataset from Python to Excel using `openpyxl`:

```python
df.to_excel("HR_Employee_Attrition.xlsx", index=False)
```

Built a **Pivot Table** with:
- **Rows:** Department / Job Role
- **Columns:** Attrition (Yes / No)
- **Values:** Employee Count

Applied **Red–Yellow–Green Conditional Formatting** — high-attrition departments instantly flagged in red for non-technical HR stakeholders.

---

### Stage 4 — Power BI Interactive Dashboard

Built a fully interactive Power BI dashboard with **6 custom DAX measures**:

```dax
Total Employees      = COUNT('hr_analytics employees'[EmployeeNumber])
Attrition Count      = CALCULATE([Total Employees], 'hr_analytics employees'[Attrition] = "Yes")
Attrition Rate (%)   = DIVIDE([Attrition Count], [Total Employees], 0)
Active Employees     = CALCULATE([Total Employees], 'hr_analytics employees'[Attrition] = "No")
Avg Monthly Income   = AVERAGE('hr_analytics employees'[MonthlyIncome])
Avg Job Satisfaction = AVERAGE('hr_analytics employees'[JobSatisfaction])
```

**Dashboard Features:**
- KPI Cards — Attrition Rate %, Total Employees, Active Employees
- Bar/Donut Charts — Attrition by Job Role, Department, Business Travel
- Dynamic Slicers — filter by Gender, Department, Age Group

🔗 [Open Live Dashboard](YOUR_POWERBI_LINK_HERE) | 📥 [`HR_Analytics_Dashboard.pbix`](HR_Analytics_Dashboard.pbix)

---

## 📌 Key Findings

1. **Sales Representatives** have the highest attrition count among all job roles.
2. Employees who **travel frequently** are significantly more likely to leave.
3. **Single employees** exhibit the highest attrition rate.
4. Employees who leave earn a **lower average monthly income** than those who stay.
5. **Poor work-life balance (Rating 1)** and **low environment satisfaction** are strong early-warning signals.
6. Long **promotion delays** directly correlate with resignation decisions.

---

## 💡 Business Recommendations

- 🎯 **Target Sales dept** with retention bonuses and clearer career paths
- 🏠 **Offer WFH/cab service** for high-commute employees
- 📈 **Accelerate promotion cycles** for employees stagnant 2+ years
- ✈️ **Cap frequent travel** or introduce travel fatigue compensation
- 💬 **Run stay interviews** with low work-life balance employees proactively

---

## 🚀 How to Run

### Prerequisites
```bash
pip install pandas matplotlib seaborn sqlalchemy pymysql openpyxl
```

### SQL Queries
Open `database_queries.sql` in MySQL Workbench and run against your `hr_analytics` database.

### Python EDA
```bash
jupyter notebook analyzer.ipynb
```
> ⚠️ Update the connection string in Cell 1:
> ```python
> engine = create_engine("mysql+pymysql://YOUR_USER:YOUR_PASSWORD@localhost/hr_analytics")
> ```

### Power BI
Open `HR_Analytics_Dashboard.pbix` in Power BI Desktop — or view the [Live Dashboard](YOUR_POWERBI_LINK_HERE).

---

## 📜 Dataset

- **Source:** [IBM HR Analytics – Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
- **Size:** 1,470 employees × 35 features
- **License:** Public domain / CC0

---

## 👤 Author

**Harshil Kachhiya**
B.Tech Information Technology | Ganpat University, Gujarat

---

## 📄 License

This project is open source under the [MIT License](LICENSE).
