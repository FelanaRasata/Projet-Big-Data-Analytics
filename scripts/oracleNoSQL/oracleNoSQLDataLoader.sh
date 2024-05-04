#!/bin/bash

# Script Name: data-loader.sh
# Description: A script to load data from MongoDB into HiveSQL
# Requirements: Python (>=3.9), pip

# Go to the project directory
cd data-loader

# Check if virtual environment folder exists, if not, create one
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python -m venv venv
fi

# Activate the virtual environment based on the operating system
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Launch the Python script
echo "Launching the script..."
python main.py
