import pymongo
from pyhive import hive
from itertools import islice, chain


def bulk_insert_data(hive_host, hive_port, hive_user, table_name, documents, batch_size=1000):
    # Convert documents to a list of SQL insert queries
    insert_queries = [convert_mongodb_to_sql_insert(doc, table_name) for doc in documents]

    print(insert_queries)

    # # Establish connection to Hive
    # conn = hive.Connection(host=hive_host, port=hive_port, username=hive_user)
    # cur = conn.cursor()
    #
    # # Batch insert data into Hive table
    # for batch in chunks(insert_queries, batch_size):
    #     query = "\n".join(batch)
    #     cur.execute(query)


def convert_mongodb_to_sql_insert(mongodb_data, table_name):
    # Extract keys and values from MongoDB data
    keys = list(mongodb_data.keys())
    values = list(mongodb_data.values())

    # Convert values to strings
    sql_values = [convert_to_string(value) for value in values]

    # Assemble SQL INSERT statement
    sql_insert = f"INSERT INTO {table_name} ({', '.join(keys)}) VALUES ({', '.join(sql_values)});"

    return sql_insert


def convert_to_string(value):
    # Convert ObjectId to string, otherwise keep value as is
    if isinstance(value, pymongo.ObjectId):
        return str(value)
    else:
        return f"'{value}'"  # Enclose non-numeric values in quotes


def fetch_mongodb_data(connection_str, db_name, collection_name):
    # Connect to MongoDB and fetch data
    client = pymongo.MongoClient(connection_str)
    db = client[db_name]
    collection = db[collection_name]

    return collection.find()


def chunks(iterable, size):
    """Yield successive chunks of a given size from the iterable."""
    iterator = iter(iterable)
    for first in iterator:
        yield chain([first], islice(iterator, size - 1))


if __name__ == '__main__':
    # MongoDB's connection details
    mongo_db_uri = 'mongodb_uri'
    mongo_db_name = 'madaExplore'
    tables = [
        ('immatriculations', 'immatriculation_hive'),
        ('catalogues', 'catalogue_hive'),
    ]

    # Hive connection details
    hive_host = 'hive_host_address'
    hive_port = 10000  # Assuming default Hive port
    hive_user = 'hive_username'

    # Process each collection
    for (col, table) in tables:
        # Fetch documents from MongoDB
        docs = fetch_mongodb_data(mongo_db_uri, mongo_db_name, col)

        # Batch insert documents into Hive
        bulk_insert_data(hive_host, hive_port, hive_user, table, docs)
