# CLI Weather & System Dashboard

## 📌 Project Description

This project is a simple command-line dashboard built using **Bash scripting**. It allows users to:

* Check real-time weather information for up to three cities
* View system information such as user details and file statistics
* View basic network information and connectivity status

The project demonstrates core Linux shell scripting concepts such as user input handling, loops, conditionals, API consumption, and modular script design.

---

## 🗂 Project Structure

```
weather-dashboard/
├── dashboard.sh   # Main menu-driven dashboard
├── weather.sh     # Weather checking functionality
├── sysinfo.sh     # System and network information
└── README.md      # Project documentation
```

---

## ▶️ How to Run the Project

> **Recommended environment:** Linux or WSL (Windows Subsystem for Linux)

### 1️⃣ Run the Main Dashboard

From the project directory:

```bash
bash dashboard.sh
```

This launches an interactive menu where you can select different options.

---

### 2️⃣ Run Weather Script Directly

```bash
bash weather.sh
```

You will be prompted to enter a city name and can check weather for up to **3 cities per session**.

---

### 3️⃣ Run System & Network Info Script

```bash
bash sysinfo.sh
```

This displays system details (user, directories, files) and network information (hostname, DNS lookup, connectivity).

---

## 🧪 Example Outputs

### Weather Output

```
📍 City: Paris
🌡 Temperature: 9°C
🌤 Condition: Overcast
💧 Humidity: 81%
🌬 Wind Speed: 18 km/h
```

### Dashboard Menu

```
========== CLI DASHBOARD ==========
1. Check Weather
2. View System Info
3. View Network Info
4. Exit
==================================
```

### Network Status

```
Hostname: my-machine
DNS lookup for google.com: 142.250.190.14
Network status: Connected
```

---

## ⚠️ Challenges Faced & Solutions

### 1️⃣ Parsing JSON Without `jq`

**Challenge:**
The weather API returns JSON data, but the `jq` utility was unavailable in the environment.

**Solution:**
I used a combination of `grep`, `sed`, and `awk` to extract the required fields directly from the JSON response. To avoid incorrect matches, I constrained searches to specific blocks (e.g. `weatherDesc`).

---

### 2️⃣ Cross-Platform Shell Differences

**Challenge:**
Some commands behave differently or are unavailable in Git Bash compared to Linux.

**Solution:**
The scripts were designed and tested primarily in WSL/Linux, which aligns with standard shell scripting expectations. Where necessary, I adapted commands to remain portable.

---

### 3️⃣ Input Validation & Control Flow

**Challenge:**
Ensuring users could only select valid menu options and check weather for a limited number of cities.

**Solution:**
I used `while` loops, `case` statements, and input normalization to enforce valid input and ensure graceful exits.

---

## ✅ Key Concepts Demonstrated

* Bash scripting fundamentals
* Loops and conditionals
* User input validation
* API consumption with `curl`
* Text processing with `grep`, `sed`, and `awk`
* Modular script design

---

## 📎 Notes

* No external dependencies (like `jq`) are required
* Internet connection is required for weather and network checks
* Scripts are intentionally kept simple and readable for learning purposes

---

## 👤 Author

**Kelvin Ofili**

This project was built as part of a terminal scripting exercise to demonstrate practical shell scripting skills.
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/4af573e5-2090-4c0f-993e-ebac74b7edd9" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c2fac15e-b632-484e-adb3-a9c7a4f561b2" />

