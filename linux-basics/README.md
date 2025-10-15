# 🧰 DevOps Bootcamp — Exercises & Projects  
Welcome to my **DevOps Bootcamp Portfolio**! 🚀  
This repository contains all practical exercises, bash scripts, automation examples, and DevOps projects I’ve completed during the Bootcamp.  

Each section below can be expanded to view detailed steps, commands, and reference links.  

---

## 📚 Table of Contents
- [Exercise 1: Linux Mint Virtual Machine](linux-basics/exercise-1-linux-mint-virtual-machine.md)
- [Exercise 2: Bash Script – Install Java](linux-basics/exercise-2-bash-script-install-java.md)
- [Exercise 3: .....]

---

<details>
<summary>💻 <strong>Exercise 1: Linux Mint Virtual Machine</strong></summary>
<br/>

### 🖥️ Objective
Set up a Linux Mint virtual machine to be used as your primary DevOps environment.

---

### 📥 Download Page
- [Linux Mint Official Download](https://linuxmint.com/download.php)

### 📘 Installation Guide
- [Linux Mint Installation Guide](https://linuxmint-installation-guide.readthedocs.io/en/latest/)

### ☁️ Alternative: Run Mint Online
If you face issues running Mint locally, you can use this free browser-based VM:  
- [Run Linux Mint Online](https://www.onworks.net/component/content/article?id=65735:free-linux-mint-online)

📝 _Click **“Run Online”**, and it will spin up a new Mint OS instance in your browser._

</details>

---

<details>
<summary>⚙️ <strong>Exercise 2: Bash Script — Install Java</strong></summary>
<br/>

### 🧠 Task Description
Write a **bash script** using **Vim** that installs the latest Java version and verifies the installation with `java -version`.

After installation, the script checks:
1. Whether Java is installed at all  
2. Whether an **older Java version** (lower than 11) is installed  
3. Whether a **Java version 11 or higher** is installed  

✅ Installation is successful if condition #3 is met.

---

### 💡 Hint
You can use the `awk` command to extract specific parts of text.  
Example:
```bash
echo "apple banana cherry" | awk '{print $2}'
# Output: banana
