#!/bin/bash
# =============================================================
# Script 5  : Open Source Manifesto Generator
# Author    : Aryan Saxena (24BAC10040)
# Course    : Open Source Software — CSE0002
# Software  : Linux Kernel (chosen for OSS Audit)
# Purpose   : Interactively collects user values to generate a
#             personalized FOSS philosophy statement (.txt file).
# Concepts  : Interactive Input (read), Strings, File Redirection
# Date      : 31 March 2026
# =============================================================

# --- HEADER ---
echo "================================================================"
echo "           THE OPEN SOURCE MANIFESTO GENERATOR                  "
echo "================================================================"
echo ""
echo "  Welcome. Please answer three questions to generate your"
echo "  personalized Linux Kernel Audit Manifesto."
echo "  --------------------------------------------------------------"

# --- UNIT 5 CONCEPT: INTERACTIVE INPUT ---
# Asking the user for their personal values regarding FOSS
read -p "  1. What is the most important feature of Linux? (e.g. Security): " ATTR
read -p "  2. Why should the Kernel remain Open Source? (e.g. Trust): " REASON
read -p "  3. One word to describe the FOSS community? (e.g. Global): " COMM

# --- STRING CONCATENATION ---
# Composing a short paragraph using the gathered variables
LINE1="As an auditor of the Linux Kernel, I believe its strength lies in its $ATTR."
LINE2="In a world of proprietary walls, the Kernel must stay Open Source to ensure $REASON."
LINE3="Driven by a $COMM community, we ensure that the foundation of computing remains free."

MANIFESTO_TEXT="$LINE1 $LINE2 $LINE3"

# --- FILE PERSISTENCE ---
# Generating a secure filename using the current system user's name
# This ensures no personal name is leaked into the script code itself.
OUT_FILE="manifesto_$(whoami).txt"

# Saving the paragraph to a file (Unit 5: Output Redirection)
echo "----------------------------------------" > "$OUT_FILE"
echo "       MY OPEN SOURCE MANIFESTO        " >> "$OUT_FILE"
echo "----------------------------------------" >> "$OUT_FILE"
echo "$MANIFESTO_TEXT" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Generated on: $(date)" >> "$OUT_FILE"
echo "----------------------------------------" >> "$OUT_FILE"

# --- FINAL DISPLAY ---
echo ""
echo "  [SUCCESS]"
echo "  Your manifesto has been composed and saved to: $OUT_FILE"
echo ""
echo "  --- PREVIEW ---"
cat "$OUT_FILE"
echo "  ----------------"
echo ""
echo "================================================================"
echo "                END OF MANIFESTO GENERATOR                      "
echo "================================================================"
