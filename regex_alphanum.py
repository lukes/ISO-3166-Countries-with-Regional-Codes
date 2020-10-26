from pyspark.sql import SparkSession, SQLContext, Window
from pyspark.sql import dataframe
# from pyspark.sql import window

from pyspark.sql.types import *
from pyspark.sql import functions as AAAAAAAAAA
from operator import ge,gt
from pyspark.sql import functions as FUNCCC




spark = SparkSession\
    .builder \
    .config("spark.master", "local")\
    .config("spark.driver.memory", "512m")\
    .config("spark.executor.memory", "512m")\
    .config("spark.executor.memoryOverhead", "200")\
    .config("spark.sql.autoBroadcastJoinThreshold", "-1")\
    .config("spark.driver.extraJavaOptions", "-XX:+UseG1GC -Djava.net.useSystemProxies=true")\
    .config("spark.executor.extraJavaOptions", "-XX:+UseG1GC")\
    .config("spark.app.name", "regex_alphanum")\
    .getOrCreate()

someDF_C_O_sample = spark.createDataFrame([
("TBX 0000116500","2"),
      ("TBX 761599","2"),
      ("TBX 0000103624","2"),
      ("TBX761599","2"),
      ("TBX","1"),
      ("61599","2"),
      ("61599TBX","2")
    ],
    ["SalesLocation_Type","id"])

DF_Flag = someDF_C_O_sample\
    .withColumn("Flag_APLHA_N", F.col("SalesLocation_Type").rlike("^[a-zA-Z]+.?[0-9]+"))\
    .withColumn("SalesLocation_Type_Pick", F.when(F.col("Flag_APLHA_N") == F.lit("true"), F.substring(F.col("SalesLocation_Type"),0, 3)).otherwise(F.lit("GEN")))
DF_Flag.show(truncate=False)