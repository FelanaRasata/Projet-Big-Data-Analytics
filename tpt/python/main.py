import traceback
from itertools import islice, chain

import pymongo


# from pyhive import hive
#
#
# def bulk_insert_data(hive_host, hive_port, hive_user, hive_password, table_name, documents, batch_size=100):
#     conn = None
#
#     try:
#         # Convert documents to a list of SQL insert queries
#         insert_queries = [convert_mongodb_to_sql_insert(doc, idx + 1, table_name) for idx, doc in enumerate(documents)]
#         auth = None
#
#         if hive_password is not None:
#             auth = 'LDAP'
#
#         # Establish connection to Hive
#         conn = hive.Connection(host=hive_host, port=hive_port, auth=auth, username=hive_user, password=hive_password)
#         cur = conn.cursor()
#
#         # Batch insert data into Hive table
#         for batch in chunk_list(insert_queries, batch_size):
#             query = "".join(batch)
#             cur.execute(query)
#
#     except:
#         traceback.print_exc()
#
#     finally:
#         if conn:
#             conn.close()

def write_queries_in_file(table_name, documents):
    # Convert documents to a list of SQL insert queries
    insert_queries = [convert_mongodb_to_sql_insert(doc, idx + 1, table_name) for idx, doc in enumerate(documents)]

    # Specify the file path
    file_path = f"{table_name}.txt"

    # Open the file in write mode ('w')
    with open(file_path, 'w') as file:
        # Write the content to the file
        file.write("\n".join(insert_queries))


def convert_mongodb_to_sql_insert(mongodb_data, row_id, table_name):
    # Extract keys and values from MongoDB data
    keys = ['id' if key == '_id' else key for key in list(mongodb_data.keys())]
    values = list(mongodb_data.values())

    # Convert values to strings
    sql_values = [convert_to_string(row_id, idx, value) for idx, value in enumerate(values)]

    # Assemble SQL INSERT statement
    sql_insert = f"INSERT INTO {table_name} ({', '.join(keys)}) VALUES ({', '.join(sql_values)});"

    return sql_insert


def convert_to_string(row_id, idx, value):
    # Convert ObjectId to string, otherwise keep value as is
    if idx == 0:
        return f"{row_id}"
    else:
        return f"'{value}'"  # Enclose non-numeric values in quotes


def fetch_mongodb_data(connection_str, db_name, collection_name):
    # Connect to MongoDB and fetch data
    client = pymongo.MongoClient(connection_str)
    db = client[db_name]
    collection = db[collection_name]

    return collection.find()


def chunk_list(iterable, size):
    """Yield successive chunks of a given size from the iterable."""
    iterator = iter(iterable)
    for first in iterator:
        yield chain([first], islice(iterator, size - 1))


if __name__ == '__main__':
    # MongoDB's connection details
    mongo_db_uri = 'mongodb://localhost:27017'
    mongo_db_name = 'sourceCSV'
    tables = [
        ('immatriculations', 'immatriculation_hive'),
        # ('catalogues', 'catalogue_hive'),
    ]

    # Hive connection details
    hive_host = 'localhost'
    hive_port = 10000  # Assuming default Hive port
    # hive_user = 'oracle'
    # hive_password = 'welcome1'
    hive_user = None
    hive_password = None

    # Process each collection
    for (col, table) in tables:
        # Fetch documents from MongoDB
        docs = fetch_mongodb_data(mongo_db_uri, mongo_db_name, col)

        # Batch insert documents into Hive
        # bulk_insert_data(hive_host=hive_host, hive_port=hive_port, hive_user=hive_user, hive_password=hive_password,
        #                  table_name=table, documents=docs)
        write_queries_in_file(table_name=table, documents=docs)
