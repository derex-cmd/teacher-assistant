# 🎓 Teacher Assistant Management System

Welcome to the **Teacher Assistant Management System**! This project is developed using **ASP.NET** and **SQL Server** to streamline the management of Teaching Assistants (TAs) and Lab Demonstrators (LDs) in educational institutions.

## 🚀 Prerequisites

Before you start, make sure you have the following installed:

- [**Visual Studio**](https://visualstudio.microsoft.com/) – Your IDE for ASP.NET development.
- [**SQL Server**](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) – For managing your database.

## 🛠️ Getting Started

Here's how to get the project up and running on your local machine:

### 1. Clone the Repository

First, clone the repository using Git:

```sh
git clone https://github.com/derex-cmd/teacher-assistant.git
```
### 2. Open the Project in Visual Studio

- Launch **Visual Studio**.
- Go to `File` -> `Open` -> `Project/Solution`.
- Navigate to the cloned repository folder and select the `.sln` file.

### 3. Set Up the Database

- Open **SQL Server Management Studio**.
- Create a new database named `TAManagementSystem`.
- Navigate to the `SQL` folder in the cloned repository.
- Run the `database.sql` script to create the necessary tables and populate initial data.

### 4. Add ASPX Files

- Copy the ASPX files from the repository folder.
- Paste them into the `Views` folder of your ASP.NET project in Visual Studio.
- Ensure all necessary references and dependencies are included.

### 5. Run the Project

- In Visual Studio, set the project as the startup project.
- Click the `Start` button (or press `F5`) to run the project.

## 🏷️ Usage

- **Admin**: Manage TAs and LDs, process payments, and view faculties and associates.
- **Faculty**: Assign tasks, provide feedback, and track attendance.
- **TA/LD**: View tasks and attendance records.

## 📊 ERD, EERD, and Relational Schema

The repository includes the following documents in the `Docs` folder for a better understanding of the database structure:

- Entity Relationship Diagram (ERD)
- Enhanced Entity Relationship Diagram (EERD)
- Relational Schema

## 📝 Authors

- Muhammad Omer Nasir (i212476@nu.edu.pk)
- Muhammad Yahya (i212592@nu.edu.pk)
