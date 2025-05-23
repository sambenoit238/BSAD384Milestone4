# BSAD 384 Term Project
Problem statement and Scope Definition:

Inequality threatens long term social and economic development, harms poverty reduction and destroys people’s self worth which, if not addressed could increase crime, disease, and environmental degradation (United Nations, 2023). From religion and ethnicity to gender and sexuality, discrimination can take many forms and affects one in six people worldwide with women and people with disabilities disproportionately affected (United Nations, 2023). These facts point to an urgent need to tackle any kind of discriminatory practice and hate speech (United Nations, 2023). Through making political, economic and social policies universal and paying attention the needs of marginalized communities society can achieve equality for everyone (United Nations, 2023). Reducing inequality requires transformative change and involves steps to make a greater investment in health, education, social protection, and decent jobs (United Nations, 2023). It is also important to empower and promote inclusive social and economic growth within countries to ensure equal opportunity and reduce inequalities of income by eliminating discriminatory laws, policies and practices (United Nations, 2023). Countries must also ensure that developing countries are better in decision making on global issues so solutions are more effective, credible and accountable (United Nations, 2023). Finally governments must promote safe, regular and responsible migration through planned policies for millions who’ve left their homes to seek better lives due to drivers of migration (United Nations, 2023).  
The goal of this project is to develop a database system that enhances access to resources, job opportunities and educational programs for individuals in marginalized communities (OpenAI, 2025). The database aims to smooth the process of connecting individuals to opportunities and provide insight into resource usage and feedback, thus enabling organizations to allocate resources more effectively and make data-driven decisions to reduce inequality (OpenAI, 2025). Using publicly available and open data sources this database will include data for 8 distinct entities. These entities include Users, Organizations, Resources, Jobs, Education Programs and Transactions (OpenAI, 2025). Data will be collected from a variety of databases including the World Inequality Database (WID), the World Data Bank and the United Nations Data Portal (UNData). Assumptions of this project include data accessibility- there will be sufficient information from open database sources  to design and populate the database, user information- the data will accurately reflect the needs of marginalized communities, technological compatibility- the technology needs for the design of the database will be met and standardize formatting- data from different sources will be standardized to ensure compatibility with database (OpenAI, 2025). Unfortunately it is impossible to have assumptions without constraints. Constraints in this project include entity and transaction requirements- the database must include at least 8 entities with 2 being transaction-based, timeline- the project must be completed by April 4th, data source limitations- only publicly available open source datasets can be used to populate the database and technology tools – the database must be designed using specific programs provided by the professor and follow the relational database principals (OpenAI, 2025).

# Entity Relational Model

<img width="569" alt="PNG image" src="https://github.com/user-attachments/assets/52f5491b-e042-45fb-8e3e-a321a68f0991" />

# Relational Model

<img width="552" alt="PNG image" src="https://github.com/user-attachments/assets/50b64494-5732-43e1-8e09-eebcd98154d8" />

# Souce Code

[Create.SQL](https://github.com/sambenoit238/BSAD384Milestone4/blob/1bd5d94eae100e4f8e1ea7e3a0a3a85e2365002b/create.sql)

[Populate.SQL](https://github.com/sambenoit238/BSAD384Milestone4/blob/ca22c8ffb421416032feac6c31301f42817ef8d6/populate.sql)

# Queries

# Query 1

Which participants are over the age of 35? How Many are there?

```sql

Select PartID, Name, Age, Email, Location from Participant Where age > 35

```

# Query 2

Find the Organization ID, Job Title, the Organization Name and the Average Job Salary

```sql
SELECT job.OrgID, job.Title, organization.Name, AVG(job.Salary) AS AvgSalary
FROM job, organization 
Where job.OrgID = organization.OrgID
GROUP BY job.OrgID, job.Title, organization.Name;
```

# Query 3

Write a Query that identifies the particpants with forms, the status of their form and when the form was dated.

```sql
SELECT participant.PartID, participant.Name, form.Date, form.status
FROM participant, form
where participant.PartID = form.PartID;
```

# Query 4

Find all data from the organization_resource and organization tables

```sql
SELECT * 
FROM organization_resource, organization
where organization_resource.OrgID = organization.OrgID
```

# Query 5

Find all the job titles and annual salary

```sql
SELECT Title, Salary, (Salary * 12) AS AnnualSalary
FROM job
```
