#!/bin/bash

# Ensure necessary files are added to git
echo "Adding necessary files..."
git add Changes README Makefile.PL MANIFEST lib/ t/ data/ examples/

# Commit changes with a meaningful message
echo "Committing files..."
git commit -m "Prepare distribution: Add all necessary files for AA-Altsteps v0.02"

# Show the status
echo "Git status:"
git status

