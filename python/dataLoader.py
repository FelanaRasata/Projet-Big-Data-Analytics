import os
import pymongo

from itertools import islice, chain


# Step 1: Fetch data from MongoDB using pymongo
def fetch_data_from_mongodb(collection_name):
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    db = client["sourceCSV"]
    collection = db[collection_name]

    return collection.find()


# Step 2: Create insert queries for the documents
def generate_insert_query(doc, table_name, index):
    keys = doc.keys()

    values = [index if key == '_id' else doc[key] for key in keys]
    values = ["'" + str(value).replace("'", "''") + "'" if isinstance(value, str) else value for value in values]
    values_str = ", ".join(map(str, values))

    # Replace _id with id
    if "_id" in keys:
        keys = [key.lower() for key in list(keys)]
        keys[keys.index("_id")] = "id"

    return f"INSERT INTO {table_name} ({', '.join(keys)}) VALUES ({values_str});"


# Step 3: Insert the data using the queries and beeline
def insert_into_hive(data, table_name, batch_size=25):
    process_idx = 1

    for batch in chunk_list(data, batch_size):
        print(f"Process No. {process_idx} launched...")
        insert_queries = [generate_insert_query(doc, table_name, idx) for idx, doc in enumerate(batch, start=1)]

        with open(f"{table_name}.hql", "w") as f:
            f.write("\n".join(insert_queries) + "\n")

        print(f"Process No. {process_idx} done.")


def chunk_list(iterable, size):
    """Yield successive chunks of a given size from the iterable."""
    iterator = iter(iterable)

    for first in iterator:
        yield chain([first], islice(iterator, size - 1))


# Main function
def main():
    tables = [
        ('immatriculations', 'immatriculation_hive'),
        ('catalogues', 'catalogue_hive'),
    ]

    for (collection_name, table_name) in tables:
        docs = fetch_data_from_mongodb(collection_name)
        insert_into_hive(docs, table_name)

        cmd = f"beeline -u jdbc:hive2://localhost:10000 -f {table_name}.hql"
        os.system(cmd)


if __name__ == "__main__":
    main()
