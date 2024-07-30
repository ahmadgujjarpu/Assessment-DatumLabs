from pyspark.sql.functions import *
from pyspark.sql.window import Window
from pyspark.sql.types import *

# Define the data
salesdata = [
    (1, "P001", "2024-01-01", 100.00, "C1"),
    (2, "P002", "2024-01-05", 150.00, "C2"),
    (3, "P001", "2024-01-10", 100.00, "C1"),
    (4, "P003", "2024-01-15", 200.00, "C3"),
    (5, "P002", "2024-01-20", 150.00, "C2")
]
# Prepare the data
Categorydata = [
    ("C1", "Electronics"),
    ("C2", "Clothing"),
    ("C3", "Home Appliances")
]

# Define the schema 
Categoryschema = StructType([
    StructField("category_id", StringType(), nullable=False),
    StructField("category_name", StringType(), nullable=False)
])
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
Categorydf = spark.createDataFrame(data=Categorydata, schema=Categoryschema)
# filtered the data for jan 2024 and selected amount column
salesFiltereddf=salesdf.select(salesdf.category_id,salesdf.amount).where((year(salesdf.sale_date.cast('date'))==2024) & (month(salesdf.sale_date.cast('date'))==1))
Joineddf=salesFiltereddf.join(Categorydf,salesFiltereddf.category_id==Categorydf.category_id,'inner').select(Categorydf.category_name,salesFiltereddf.amount)
# Summarized average of amount column from filter dataset by Category
AmountbyCategory=Joineddf.groupBy(Joineddf.category_name).agg(sum(Joineddf.amount).alias('amount'))
window=Window.orderBy(col('amount').desc())
AmountbyCategoryRank=AmountbyCategory.withColumn('RowNumber',row_number().over(window))
HighestAmountbyCategory=AmountbyCategoryRank.select(AmountbyCategoryRank.category_name,AmountbyCategoryRank.amount).where(col('RowNumber')==1)
HighestAmountbyCategory.show()
