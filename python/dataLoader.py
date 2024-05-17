import os

import pymongo


# Step 1: Fetch data from MongoDB using pymongo
def fetch_data_from_mongodb(collection_name):
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    db = client["sourceCSV"]
    collection = db[collection_name]

    return collection.find()


# Step 2: Create insert queries for the documents
def generate_insert_query(doc, table_name, index):
    keys = list(doc.keys())

    values = [index if key == '_id' else doc[key] for key in keys]
    values = ["'" + str(value).replace("'", "''") + "'" if isinstance(value, str) else value for value in values]
    values_str = ", ".join(map(str, values))

    # Replace _id with id
    if "_id" in keys:
        keys[keys.index("_id")] = "id"

    return f"INSERT INTO {table_name} ({', '.join(keys)}) VALUES ({values_str});"


# Step 3: Insert the data using the queries and beeline
def insert_into_hive(data, table_name, batch_size=25):
    process_idx = 1
    data_list = list(data)

    with open(f"{table_name}.hql", "w") as f:
        f.write(" ")
        f.close()

    for batch in chunk_list(data_list, batch_size):
        print(f"Process No. {process_idx} launched...")
        insert_queries = [generate_insert_query(doc, table_name, idx) for idx, doc in enumerate(batch, start=1)]

        with open(f"{table_name}.hql", "a") as f:
            f.write("\n".join(insert_queries) + "\n")
            f.close()

        print(f"Process No. {process_idx} done.")
        process_idx = process_idx + 1

    # Insert data using command line
    print(table_name, 'data insertion starting...')
    cmd = f"beeline -u jdbc:hive2://localhost:10000 -f {table_name}.hql"
    os.system(cmd)
    print(table_name, 'done.')


def chunk_list(data, chunk_size):
    """Yield successive chunk_size chunks from data."""
    for i in range(0, len(data), chunk_size):
        yield data[i:i + chunk_size]


# Main function
def main():
    tables = [
        ('catalogues', 'catalogue_hive'),
        # ('immatriculations', 'immatriculation_hive'),
    ]

    for (collection_name, table_name) in tables:
        docs = fetch_data_from_mongodb(collection_name)
        insert_into_hive(docs, table_name)


if __name__ == "__main__":
    main()
