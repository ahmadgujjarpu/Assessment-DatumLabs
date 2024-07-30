from pyspark.sql.functions import *
from pyspark.sql.types import *

# Define the data
salesdata = [
    (1, "P001", "2024-01-01", 100.00, "C1"),
    (2, "P002", "2024-01-05", 150.00, "C2"),
    (3, "P001", "2024-01-10", 100.00, "C1"),
    (4, "P003", "2024-01-15", 200.00, "C3"),
    (5, "P002", "2024-01-20", 150.00, "C2")
]

# Define the schema
salesschema = StructType([
    StructField("sale_id", IntegerType(), True),
    StructField("product_id", StringType(), True),
    StructField("sale_date", StringType(), True),
    StructField("amount", DoubleType(), True),
    StructField("category_id", StringType(), True)
])

# Create the DataFrame
salesdf = spark.createDataFrame(data=salesdata, schema=salesschema)
# filtered the data for jan 2024 and selected amount column
salesFiltereddf=salesdf.select(salesdf.amount).where((year(salesdf.sale_date.cast('date'))==2024) & (month(salesdf.sale_date.cast('date'))==1))
#Sumarized amount column from filter dataset
TotalSalesJan=salesFiltereddf.select(sum(salesFiltereddf.amount).alias('Total Sales'))
TotalSalesJan.show()
