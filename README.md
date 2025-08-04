# 🕵️‍♂️ Criminal Records Management System

A full-stack database management project developed using **ASP.NET Web Forms (C#)** and **SQL Server**. This system tracks detailed records of criminals, victims, officers, court cases, and more — useful for law enforcement simulations, data analysis, or forensic practice.

# Entity-Relationship Diagram
![](https://github.com/JaveriahFaheemOG/Criminal-Records-System/blob/main/Criminal_Record.png)
---

## 📌 Features
- Register and manage **Criminals, Victims, Officers, Arrests**
- Track **Case Files, Legal Proceedings, Parole Status**
- Supports complex queries (e.g., most common crimes, city-wise crime stats, trauma filtering)
- Includes **Entity Relationship Diagram (ERD)**
- Clean web-based interface (Login, Dashboard, Forms)

---

## ⚙️ Tech Stack
- **Frontend:** ASP.NET Web Forms (.aspx)
- **Backend:** C# (.cs files)
- **Database:** Microsoft SQL Server
- **IDE:** Visual Studio (purple one!)

---

## 🗂 How to Run the Project Locally

### 🛠 Prerequisites
- Visual Studio (2019/2022 or newer)
- SQL Server + SQL Server Management Studio (SSMS)
- .NET Framework (usually auto-installed with Visual Studio)

---

### 🧾 Step 1: Create and Setup the SQL Database

1. Open **SQL Server Management Studio (SSMS)**
2. Connect to your local SQL Server  
   - Usually `.\SQLEXPRESS` or `(local)`
3. Right-click on **Databases → New Database**  
   Name it: `Criminal_Record`
4. Open the SQL file: `i221711_i227421_i221751_Milestone3.sql` in SSMS
5. Click **Execute** or press **F5**  
   ✅ This will create all tables and insert sample data

---

### 🔌 Step 2: Connect the Project to the Database

1. In **Visual Studio**, open the file named `web.config`
2. Look for the `<connectionStrings>` section
3. Make sure the connection string looks like this:

```xml
<connectionStrings>
  <add name="Criminal_Record_Connection" 
       connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=Criminal_Record;Integrated Security=True" 
       providerName="System.Data.SqlClient" />
</connectionStrings>
```
Replace .\SQLEXPRESS if your server name is different

Make sure Initial Catalog matches your DB name: Criminal_Record

### ▶️ Step 3: Run the Project

(make sure to put the 'properties' folder inside the 'DB_PROKECT' folder first)
1. Open DB_PROJECT.sln in Visual Studio
2. Wait for it to load all dependencies
3. Press F5 or click the green Start button (play icon)

Your default browser will launch with the login or dashboard interface

### You're good to go!

### 🖼️ Interface Screenshots
![](https://github.com/JaveriahFaheemOG/Criminal-Records-System/blob/main/login.png)

![](https://github.com/JaveriahFaheemOG/Criminal-Records-System/blob/main/insert_dashboard.png)

![](https://github.com/JaveriahFaheemOG/Criminal-Records-System/blob/main/view_dashboard.png)

![](https://github.com/JaveriahFaheemOG/Criminal-Records-System/blob/main/recordadding_form.png)

### Authors
- Ayesha Areej - FAST NU
- Javeriah Faheem - FAST NU
- Sabreena Azhar - FAST NU
