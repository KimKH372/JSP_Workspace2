CREATE TABLE IF NOT EXISTS account(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_unitRate  INTEGER,
	p_description TEXT,
   	p_category VARCHAR(20),
	p_condition VARCHAR(20),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;

desc account;