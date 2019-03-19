import psycopg2
import sys

try:
    conn = psycopg2.connect("host=db dbname=airflow password=postgres user=postgres")
    conn.close()
    sys.exit(0)

except psycopg2.OperationalError as ex:
    sys.exit(1)
