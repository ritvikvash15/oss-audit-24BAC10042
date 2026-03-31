# OSS Audit — Linux Kernel

**Student:** Ritvik Vaishnav

**Roll Number:** 24BAC10042

**Course:** Open Source Software — CSE0002

**Chosen Software:** Linux Kernel (Operating System Core)

**License:** GNU General Public License v2 (GPL v2)

**Repository:** https://github.com/ritvikvash15/oss-audit-24BAC10042


---

## 📖 About This Project

This repository contains the capstone audit of the **Linux Kernel**, one of the most significant collaborative projects in software history. Conducted as part of the Open Source Software (OSS NGMC) course, this audit examines the kernel's evolution from a 1991 hobby project to critical global infrastructure.

The project includes a deep-dive analysis of the **GPL v2 "Copyleft" licensing model** and its impact on modern Linux systems.

Additionally, five original shell scripts are developed to demonstrate:

* Linux auditing
* Subsystem inspection
* Shell scripting proficiency

---

## 🐧 Chosen Software: The Linux Kernel

The Linux Kernel was created by **Linus Torvalds** in 1991. Unlike proprietary kernels (such as Windows NT), Linux follows a **monolithic but modular architecture**.

Its success is strongly tied to its license — **GPL v2**, which ensures that improvements made by organizations must be shared with the community.

This audit explores how this open-source "social contract" powers modern computing systems worldwide.

---

## 🛠️ Setup & Configuration

### 1. Environment Setup

This project is designed for Linux environments such as:

* Ubuntu
* Debian
* CentOS
* RHEL
* Fedora
* Arch

The scripts are **hardware-agnostic**, meaning they analyze kernel behavior without exposing hardware-specific identifiers.

---

### 2. Dependency Installation

Ensure your system has required tools installed:

**Ubuntu / Debian:**

```bash
sudo apt update && sudo apt install kmod coreutils -y
```

**RHEL / Fedora:**

```bash
sudo dnf install kmod coreutils -y
```

---

### 3. Execution Instructions

```bash
# Clone the repository
git clone https://github.com/ritvikvash15/oss-audit-24BAC10042

# Navigate to scripts folder
cd Shell-Scripts

# Make scripts executable
chmod +x *.sh

# Run any script
./[script_name].sh
```

---

## 📁 Repository Structure

```
NGMC-OSS-Project/
├── README.md                          ← Project documentation  
├── Project_Report.docx                  ← Project report  
├── Shell-Scripts-Screenshots/         ← Output screenshots  
│   ├── DiskAndPermissionAuditor.jpg  
│   ├── FossPackageInspector.jpg  
│   ├── LogFileAnalyser.jpg  
│   ├── SystemIdentityReport.jpg  
│   ├── TheOpenSourceManifestoGenerator.jpg  
└── Shell-Scripts/  
    ├── diskAndPermmisssionAuditor.sh  
    ├── fossPackageInspector.sh  
    ├── logFileAnalyser.sh  
    ├── systemIdentityReport.sh  
    └── theOpenSourceManifestoGenerator.sh  
```

---

## 📜 Script Descriptions

### 1. System Identity Report

**File:** `systemIdentityReport.sh`

Displays system information including distribution details, kernel version, and GPL v2 notice.

**Concepts:** Variables, command substitution `$()`, `echo`

---

### 2. Kernel Component Inspector

**File:** `fossPackageInspector.sh`

Checks for Linux kernel packages and essential FOSS tools (GCC, LibC).

**Concepts:** `if-else`, `case`, package queries (`dpkg`, `rpm`)

---

### 3. Disk & Permission Auditor

**File:** `diskAndPermissionAuditor.sh`

Analyzes permissions, ownership, and disk usage of key kernel directories.

**Concepts:** `for` loops, `du`, `ls -ld`, `awk`

---

### 4. Kernel Log Analyzer

**File:** `logFileAnalyser.sh`

Examines kernel logs (`dmesg`) and counts occurrences of specific events.

**Concepts:** `while read`, input redirection, arithmetic expansion

---

### 5. Open Source Manifesto Generator

**File:** `theOpenSourceManifestoGenerator.sh`

Interactive script that generates a personalized FOSS manifesto file.

**Concepts:** `read -p`, string concatenation, file writing (`>`, `>>`)

---

## 🛡️ Security & Privacy Note

* **No Hardcoded Data:** Uses environment variables like `$USER` and `$HOME`
* **Non-Invasive:** Avoids privileged access; uses temporary files for log analysis
* **Portable:** Runs on standard Linux distributions without exposing sensitive data

---

## ⚖️ License

This project is submitted as coursework for the OSS NGMC course.
All shell scripts and documentation are original works created for academic evaluation.

---
