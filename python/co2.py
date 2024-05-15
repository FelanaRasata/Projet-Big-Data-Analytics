import chardet

# Define the input and output file paths
DS_PATH="/vagrant/tpa_groupe_14/data/"

input_file = DS_PATH+'CO2.csv'
output_file = DS_PATH+'CO2_utf8.csv'

# Detect the encoding
with open(input_file, 'rb') as f:
    raw_data = f.read()
    result = chardet.detect(raw_data)
    encoding = result['encoding']
    confidence = result['confidence']
    print(f"Detected encoding: {encoding} with confidence {confidence}")

# Read the file with the detected encoding
with open(input_file, 'r', encoding=encoding, errors='ignore') as f:
    data = f.read()

# Write the data to a new file with UTF-8 encoding
with open(output_file, 'w', encoding='utf-8') as f:
    f.write(data)
