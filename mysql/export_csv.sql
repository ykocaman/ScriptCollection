/* veriler icin where, join gibi islemlerin yapilacagi kisim */
select id,content from tmp

/*
ciktinin client yerine dosyaya gnderilmesini saglayan kisim 
TERMINATED BY kismindaki , yada ; dosyanin icerigine gore degistirilir. Virgul amerikada, noktali virgul ise ulkemiz ve avrupada ayrac olarak kullanilmaktadir.
*/
INTO OUTFILE '/tmp/output.csv' CHARACTER SET UTF8 FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"' LINES TERMINATED BY '\r\n'