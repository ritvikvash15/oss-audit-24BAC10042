#!/bin/bash
# =============================================================
# Script 4  : Kernel Log (dmesg) Analyzer
# Author    : Aryan Saxena (24BAC10040)
# Course    : Open Source Software — CSE0002
# Software  : Linux Kernel (chosen for OSS Audit)
# Purpose   : Analyzes the kernel ring buffer for specific 
#             keywords (ERROR/WARN) to audit system stability.
# Concepts  : While-Read Loops, If-Then, Counters, Redirection
# Date      : 31 March 2026
# =============================================================

# --- VARIABLES ---
# To keep this secure and portable, we create a temporary local log file
# of the current kernel messages instead of accessing sensitive root logs.
TEMP_LOG="kernel_audit_temp.log"
dmesg | tail -n 100 > "$TEMP_LOG"

# Keyword to search for (Unit 5 Concept: Search/Grep logic)
KEYWORD="EXT4-fs"  # Common kernel flag; you can change this to "ERROR" or "WARN"
COUNT=0

# --- HEADER ---
echo "================================================================"
echo "           KERNEL LOG FILE ANALYZER (DMESG AUDIT)               "
echo "================================================================"
echo ""
echo "  Target Keyword : $KEYWORD"
echo "  Analyzing the last 100 kernel messages..."
echo "  --------------------------------------------------------------"

# --- UNIT 2 & 5 CONCEPT: WHILE-READ LOOP ---
# Reading the file line-by-line while preserving formatting
while IFS= read -r LINE; do

    # --- UNIT 2 CONCEPT: IF-THEN ---
    # Check if the line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        # If match is found, increment the counter (Arithmetic Expansion)
        COUNT=$((COUNT + 1))
        
        # Print the matching line for the audit report (truncated for brevity)
        echo "  [MATCH FOUND]: ${LINE:0:70}..."
    fi

done < "$TEMP_LOG"  # Input redirection (Unit 5)

# --- SUMMARY REPORT ---
echo "  --------------------------------------------------------------"
echo "  [AUDIT SUMMARY]"
echo "  Total occurrences of '$KEYWORD' : $COUNT"
echo ""

# Logic to interpret results for the report
if [ "$COUNT" -eq 0 ]; then
    echo "  Status: STABLE. No critical $KEYWORD flags found in the kernel."
else
    echo "  Status: INVESTIGATE. Found $COUNT instances of $KEYWORD flags."
fi

# Clean up the temporary file (Security Best Practice)
rm -f "$TEMP_LOG"

echo "================================================================"
echo "                END OF KERNEL LOG ANALYSIS                      "
echo "================================================================"
