from pyspark.sql import SparkSession, SQLContext, Window
from pyspark.sql import dataframe
# from pyspark.sql import window

from pyspark.sql.types import *
from pyspark.sql import functions as F
from operator import ge,gt
from datetime import date,datetime,timezone
from dateutil.relativedelta import *


spark = SparkSession\
    .builder \
    .config("spark.master", "local")\
    .config("spark.driver.memory", "512m")\
    .config("spark.executor.memory", "512m")\
    .config("spark.executor.memoryOverhead", "200")\
    .config("spark.sql.autoBroadcastJoinThreshold", "-1")\
    .config("spark.driver.extraJavaOptions", "-XX:+UseG1GC -Djava.net.useSystemProxies=true")\
    .config("spark.executor.extraJavaOptions", "-XX:+UseG1GC")\
    .config("spark.app.name", "rlike_regex_replace")\
    .getOrCreate()

someDF = spark.createDataFrame([
      ("chris","morris","KROPP0x1e&FOTHÄLSA", "Chris1507"),
      ("c","morris","0000", "mouse"),
      ("Faf","Duplesis","1306FafDup8", "Faf1507"),
      ("David","Warner","1507David", "David1507"),
      ("chris","morris","2500--\u001AFk--", "Chris1507")
    ],
    ["firstname","lastname","MixPattern", "MixPattern2"])

# https://mungingdata.com/apache-spark/advanced-string-matching-with-rlike/
someDF2=someDF.withColumn("Replace_UNICODE",F.regexp_replace(F.col("MixPattern"), "[\u001A]+", ""))\
    .withColumn("Replace_All_But_Alphabets",F.regexp_replace(F.col("MixPattern"), "[^a-zA-Z]", "!"))\
    .withColumn("Replace_All_But_Numbers",F.regexp_replace(F.col("MixPattern"), "[^0-9]", ""))\
    .withColumn("ReplaceNumbers",F.regexp_replace(F.col("MixPattern"), "[0-9]", "@"))\
    .withColumn("Check_NumStart",F.col("MixPattern").rlike("^[0-9]"))\
    .withColumn("Replace_Num_NumStart",
        F.when(F.col("MixPattern").rlike("^[0-9]")==True,F.regexp_replace(F.col("MixPattern"), "^[0-9]*", ""))
          .otherwise(F.lit("?")))\
    .withColumn("Num_At_Start",
        F.when(F.col("MixPattern").rlike("^[0-9]+")==True,F.regexp_extract(F.col("MixPattern"),"^[0-9]*",0))
          .otherwise(F.lit("?")))\
    .withColumn("Words_after_NumStart",
        F.when(F.col("MixPattern").rlike("^[0-9]+")==True,F.regexp_extract(F.col("MixPattern"),"[A-Za-z]+",0))
          .otherwise(F.lit("?")))

someDF2.show()

someDF_C_O = spark.createDataFrame([
    ("c", "morris", "key2"),
    ("c", "morris", "/o"),
    ("c", "morris", "c/"),
    ("c", "morris", "c/o"),
    ("Faf", "Duplesis", "C/o Mrs. Crism  "),
    ("David", "Warner", "c/oMr. Waye"),
    ("David", "Warner", "c/o Mr. Waye")
    ],
    ["firstname","lastname","MixPattern"])


someDF_2 = someDF_C_O\
    .withColumn("C/o present with space ?", F.lower(F.col("MixPattern")).rlike("^[c][/][o][\\s]+"))\
    .withColumn("C/o present ?", F.lower(F.col("MixPattern")).rlike("^[c][/][o]"))
someDF_2.show()
