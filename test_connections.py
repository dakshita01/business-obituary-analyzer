from sqlalchemy import create_engine
import pandas as pd

engine = create_engine('postgresql://postgres:post123@localhost/obituary_db')

# we will run a single sql query for testing the connection between python and postgreSQL
result = pd.read_sql('SELECT 1 AS test_value', engine)
print(result)
print("Success! Python is successfully connected to PostgreSQL!")