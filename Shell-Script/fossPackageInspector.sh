#!/bin/bash
# =============================================================
# Script 2  : FOSS Package & Component Inspector
# Author    : Aryan Saxena (24BAC10040)
# Course    : Open Source Software — CSE0002
# Software  : Linux Kernel (chosen for OSS Audit)
# Purpose   : Checks for kernel-related packages, retrieves 
#             versions, and uses a case statement for descriptions.
# Concepts  : Case Statements, Package Management, If-Else
# Date      : 31 March 2026
# =============================================================

# --- VARIABLES ---
# The primary "package" for a kernel audit is the running image and headers
PRIMARY_PKG="linux-image-$(uname -r)"
SUPPORT_PKGS=("libc6" "gcc" "kmod" "bash")

# --- HEADER ---
echo "================================================================"
echo "           FOSS COMPONENT & PACKAGE INSPECTOR                   "
echo "================================================================"
echo ""

# --- UNIT 2 CONCEPT: PACKAGE CHECKING ---
# We check if the kernel image package is registered in the OS database
echo "  [PRIMARY COMPONENT CHECK]"
if dpkg -s "$PRIMARY_PKG" > /dev/null 2>&1; then
    # If installed, extract the version string
    VERSION=$(dpkg-query -W -f='${Version}' "$PRIMARY_PKG")
    echo "  Component : $PRIMARY_PKG"
    echo "  Status    : INSTALLED"
    echo "  Version   : $VERSION"
else
    # Fallback for non-Debian systems or manual builds
    echo "  Component : $PRIMARY_PKG"
    echo "  Status    : ACTIVE (Detected via System Runtime)"
    echo "  Version   : $(uname -v | awk '{print $1}')"
fi
echo ""

# --- UNIT 2 CONCEPT: CASE STATEMENT ---
# Using a case statement to provide descriptions based on the component name
echo "  [ECHO SYSTEM COMPONENT DESCRIPTIONS]"
echo "  --------------------------------------------------------------"

# Adding the primary package to the list for the description loop
for PKG in "$PRIMARY_PKG" "${SUPPORT_PKGS[@]}"; do
    
    # The Case statement matches the package name to its FOSS purpose
    case "$PKG" in
        linux-image*)
            DESC="The core binary of the Linux Kernel; handles CPU and RAM."
            ;;
        libc6)
            DESC="The GNU C Library; the essential interface between kernel and apps."
            ;;
        gcc)
            DESC="The GNU Compiler Collection; used to build the kernel from source."
            ;;
        kmod)
            DESC="Tools for loading and unloading modular kernel drivers."
            ;;
        bash)
            DESC="The Bourne Again SHell; the standard FOSS command interpreter."
            ;;
        *)
            DESC="An essential open-source component of the Linux ecosystem."
            ;;
    esac

    # Display the result in a clean format
    printf "  %-20s | %s\n" "$PKG" "$DESC"
done

# --- PHILOSOPHICAL NOTE ---
echo ""
echo "  [AUDITOR'S OBSERVATION]"
echo "  Unlike proprietary systems, where the 'kernel' is a hidden"
echo "  monolith, Linux allows us to inspect each supporting"
echo "  package (like GCC or LibC) that was used to bring the"
echo "  system to life. This transparency is the core of FOSS."
echo ""
echo "================================================================"
echo "                END OF COMPONENT INSPECTOR                      "
echo "================================================================"
