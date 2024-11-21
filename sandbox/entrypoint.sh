#!/bin/bash

# Parameters: $1 = language, $2 = file to execute
LANGUAGE=$1
CODE_FILE=$2

# Check if required parameters are provided
if [ -z "$LANGUAGE" ] || [ -z "$CODE_FILE" ]; then
  echo "Error: Missing required parameters."
  echo "Usage: <language> <code_file>"
  exit 1
fi

# Set timeout for execution (in seconds)
TIMEOUT="--kill-after=1 5"

case $LANGUAGE in
  python)
    # Execute Python code
    timeout $TIMEOUT python3 $CODE_FILE
    ;;
  javascript)
    # Execute JavaScript code
    timeout $TIMEOUT node $CODE_FILE
    ;;
  c)
    # Compile and execute C code
    gcc $CODE_FILE -o output && timeout $TIMEOUT ./output
    ;;
  cpp)
    # Compile and execute C++ code
    g++ $CODE_FILE -o output && timeout $TIMEOUT ./output
    ;;
  *)
    echo "Unsupported language: $LANGUAGE"
    exit 1
    ;;
esac
