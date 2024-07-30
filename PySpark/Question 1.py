from pyspark.sql.functions import *
from pyspark.sql.types import *

# Define the data
userActivitydata = [
    (1, 101, '2024-01-05'),
    (2, 102, '2024-01-06'),
    (3, 103, '2024-01-07'),
    (4, 101, '2024-01-15'),
    (5, 104, '2024-01-20'),
    (6, 102, '2024-01-25'),
    (7, 105, '2024-01-30')
]

# Define the schema
userActivitySchema = StructType([
    StructField("activity_id", IntegerType(), nullable=False),
    StructField("user_id", IntegerType(), nullable=False),
    StructField("activity_date", StringType(), nullable=False)
])

# Create the DataFrame
userActivitydf = spark.createDataFrame(data=userActivitydata, schema=userActivitySchema)
# filtered the data for jan 2024 and get distict count of the active users
activeUsers=userActivitydf.where((year(userActivitydf.activity_date.cast('date'))==2024) & (month(userActivitydf.activity_date.cast('date'))==1)).dropDuplicates(['user_id']).count()
print(activeUsers)
