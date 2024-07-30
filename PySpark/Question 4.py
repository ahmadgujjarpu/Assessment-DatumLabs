from pyspark.sql.functions import *
from pyspark.sql.types import *
# Define schema for the DataFrame
userschema = StructType([
    StructField("user_id", IntegerType(), True),
    StructField("user_name", StringType(), True),
    StructField("join_date", StringType(), True)
])

# Define data
userdata = [
    (101, "Alice", "2023-05-10"),
    (102, "Bob", "2023-06-15"),
    (103, "Charlie", "2023-07-20"),
    (104, "Dana", "2023-08-25"),
    (105, "Emily", "2023-09-30")
]

# Create DataFrame
userdf = spark.createDataFrame(data=userdata, schema=userschema)

# filtered the data for jan 2024 and selected amount column
userFiltereddf=userdf.where((year(userdf.join_date.cast('date'))==2024) & (month(userdf.join_date.cast('date'))==1)).count()

# Show the DataFrame
print(userFiltereddf)
