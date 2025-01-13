#!/bin/bash

# Step 1: Verify necessary files
REQUIRED_FILES=("Makefile.PL" "MANIFEST" "README" "Changes" "lib/AA/Altsteps.pm" "t/00-load.t")
MISSING_FILES=()

for file in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$file" ]; then
    MISSING_FILES+=("$file")
  fi
done

if [ ${#MISSING_FILES[@]} -ne 0 ]; then
  echo "The following required files are missing:"
  for file in "${MISSING_FILES[@]}"; do
    echo "  - $file"
  done
  echo "Please add the missing files and try again."
  exit 1
fi


# Step 2

perl Makefile.PL 

# Step 3: Run tests
echo "Running tests..."
make test
if [ $? -ne 0 ]; then
  echo "Tests failed. Fix the issues and try again."
  exit 1
fi

echo "All tests passed."

# Step 4: Build the distribution
echo "Building distribution..."
make dist
if [ $? -ne 0 ]; then
  echo "Failed to build distribution. Exiting."
  exit 1
fi

echo "Distribution built successfully."

# Step 5: Verify the distribution
DIST_FILE=$(ls *.tar.gz | head -n 1)
if [ -z "$DIST_FILE" ]; then
  echo "No distribution file found. Exiting."
  exit 1
fi

echo "Verifying distribution file: $DIST_FILE"
tar -tzf "$DIST_FILE"
if [ $? -ne 0 ]; then
  echo "Verification of the tarball failed. Exiting."
  exit 1
fi

echo "Distribution file verified successfully."

# Final message
echo "All steps completed successfully. Your distribution file is: $DIST_FILE"

