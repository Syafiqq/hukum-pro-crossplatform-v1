#!/bin/bash

# Check for python3
if ! command -v python3 >/dev/null 2>&1; then
   echo "Loco Dependency Error: Python3 is not installed."
   exit 1
fi

# Check for python3 requests
python3 <<EOF
try:
    import requests
except ImportError:
    print("Loco Dependency Error: Python requests module is not installed.")
EOF
