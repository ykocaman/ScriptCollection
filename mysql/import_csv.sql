/* salt csv dosyasi import edilecek ise tablo tanimi yapilmalidir */

drop table if exists tmp;

CREATE TABLE tmp (
	id int NOT NULL,
	content varchar(32),
	CONSTRAINT PK_id PRIMARY KEY (id)
);

/* 
csv dosyasini import eden kisim; table kismina tablo ismi ve /tmp/file.csv kismina ise dosyanin pathi verilmelidir. 
TERMINATED BY kismindaki , yada ; dosyanin icerigine gore degistirilir. Virgul amerikada, noktali virgul ise ulkemiz ve avrupada ayrac olarak kullanilmaktadir.
*/
LOAD DATA LOCAL INFILE '/tmp/file.csv' INTO TABLE table CHARACTER SET UTF8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;