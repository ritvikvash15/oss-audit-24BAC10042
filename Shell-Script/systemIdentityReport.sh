#!/bin/bash
# =============================================================
# Script 1  : System Identity Report
# Author    : Aryan Saxena (24BAC1040)
# Course    : Open Source Software — CSE0002
# Software  : Linux Kernel (chosen for OSS Audit)
# Purpose   : Displays a system identity report as a formatted
#             welcome screen using dynamic environment data.
# Date      : 31 March 2026
# =============================================================

# --- VARIABLES ---
# Project metadata
STUDENT_NAME="Aryan Saxena"
REG_NUMBER="24BAC10040"
AUDIT_TOPIC="Linux Kernel"

# --- COMMAND SUBSTITUTION ---
# We use standard commands so the script adapts to any machine it runs on.
KERNEL_VER=$(uname -r)
CURRENT_USER=$(whoami)
USER_HOME=$HOME
# 'uptime -p' shows duration without revealing boot timestamps or load averages
SYS_UPTIME=$(uptime -p)
CURRENT_DT=$(date '+%A, %d %B %Y, %T')

# Safely identifying the Distribution without exposing unique system IDs
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d '=' -f2 | tr -d '"')
else
    DISTRO="Linux System"
fi

# --- DISPLAY OUTPUT ---
echo "================================================================"
echo "           OPEN SOURCE AUDIT: SYSTEM IDENTITY REPORT            "
echo "================================================================"
echo ""
echo "  [STUDENT INFORMATION]"
echo "  Name          : $STUDENT_NAME"
echo "  Registration  : $REG_NUMBER"
echo "  Software Audit: $AUDIT_TOPIC"
echo ""
echo "  [SYSTEM ENVIRONMENT]"
echo "  Distribution  : $DISTRO"
echo "  Kernel Version: $KERNEL_VER"
echo "  Logged User   : $CURRENT_USER"
echo "  Home Path     : $USER_HOME"
echo "  System Uptime : $SYS_UPTIME"
echo "  Date & Time   : $CURRENT_DT"
echo ""
echo "  [FOSS COMPLIANCE NOTICE]"
echo "  This system is powered by the Linux Kernel, which is"
echo "  distributed under the GNU General Public License v2 (GPLv2)."
echo "  This license ensures that the source code remains open,"
echo "  auditable, and free for all users to modify and redistribute."
echo ""
echo "================================================================"
echo "                END OF SYSTEM IDENTITY REPORT                   "
echo "================================================================"
