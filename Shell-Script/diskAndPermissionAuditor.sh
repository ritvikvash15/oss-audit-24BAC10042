#!/bin/bash
# =============================================================
# Script 3  : Disk and Permission Auditor
# Author    : Aryan Saxena (24BAC10040)
# Course    : Open Source Software — CSE0002
# Software  : Linux Kernel (chosen for OSS Audit)
# Purpose   : Audits disk usage, ownership, and permissions of 
#             critical kernel and system directories.
# Concepts  : For Loops, File Test Operators, Text Formatting
# Date      : 31 March 2026
# =============================================================

# --- VARIABLES ---
# List of critical directories related to the Kernel and OS hierarchy
# We use an array for the loop to iterate through
CHECK_DIRS=("/boot" "/etc" "/bin" "/lib/modules" "/var/log" "/tmp")

# Setting column widths for a clean table output
COL_PATH=18
COL_PERM=12
COL_OWNER=10
COL_SIZE=10

# --- HEADER ---
echo "================================================================"
echo "           DISK AND PERMISSION AUDITOR (KERNEL FOOTPRINT)       "
echo "================================================================"
echo ""

# Print Table Header
printf "%-${COL_PATH}s | %-${COL_PERM}s | %-${COL_OWNER}s | %s\n" \
       "Directory" "Permissions" "Owner" "Disk Usage"
echo "----------------------------------------------------------------"

# --- UNIT 2 CONCEPT: FOR LOOP ---
# Iterating through the list of system directories
for DIR in "${CHECK_DIRS[@]}"; do

    # Check if the directory exists using the -d test operator
    if [ -d "$DIR" ]; then
        
        # 1. Extract Permissions (e.g., drwxr-xr-x)
        # Using 'ls -ld' and 'awk' to pull the first field
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')

        # 2. Extract Owner
        # Using 'awk' to pull the third field (username)
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')

        # 3. Calculate Disk Usage
        # 'du -sh' gives human-readable size. 
        # 2>/dev/null hides 'Permission Denied' errors to keep output clean/secure.
        SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
        
        # If SIZE is empty (due to high security), set a fallback
        SIZE=${SIZE:-"Locked"}

        # Print the formatted row
        printf "%-${COL_PATH}s | %-${COL_PERM}s | %-${COL_OWNER}s | %s\n" \
               "$DIR" "$PERMS" "$OWNER" "$SIZE"
    else
        # If the directory doesn't exist on this specific flavor of Linux
        printf "%-${COL_PATH}s | %s\n" "$DIR" "Directory Not Found"
    fi
done

# --- SECURITY NOTE ---
echo ""
echo "  [AUDITOR'S SECURITY SUMMARY]"
echo "  The /boot directory contains the compressed kernel image."
echo "  The /lib/modules directory contains the kernel drivers."
echo "  The /var/log directory tracks kernel events via 'dmesg'."
echo ""
echo "  Auditing permissions ensures that critical system files"
echo "  remain 'root' owned to prevent unauthorized modification."
echo "================================================================"
echo "                END OF DISK AND PERMISSION AUDIT                "
echo "================================================================"
