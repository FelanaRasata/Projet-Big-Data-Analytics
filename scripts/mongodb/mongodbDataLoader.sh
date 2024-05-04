// Script Name: mongo-import.js
// Description: A script to import CSV data into MongoDB
// Requirements: MongoDB shell

// *INSTRUCTION: Replace $DS_PATH with the actual file paths
var DS_PATH = "/path/to/csv/files";

// Import CSV data into MongoDB collections
print("Importing CSV data into MongoDB...");

// Replace $DS_PATH with the actual file paths
var immatriculations_file = "$DS_PATH/Immatriculations.csv";
var catalogues_file = "$DS_PATH/Catalogue.csv";

// Import CSV data into 'immatriculations' collection
print("Importing data from Immatriculations.csv...");
mongoimport --db sourceCSV --collection immatriculations --type csv --file immatriculations_file --headerline;

// Import CSV data into 'catalogues' collection
print("Importing data from Catalogue.csv...");
mongoimport --db sourceCSV --collection catalogues --type csv --file catalogues_file --headerline;

print("CSV data imported successfully.");
