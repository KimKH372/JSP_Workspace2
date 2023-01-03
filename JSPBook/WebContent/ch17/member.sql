drop table member;

CREATE TABLE IF NOT EXISTS member2(
   id VARCHAR(20) NOT NULL,
   passwd  VARCHAR(20),
   name VARCHAR(30),    
   PRIMARY KEY (id)
);
INSERT INTO member2 VALUES('1', '1234', 'kkh');
INSERT INTO member2 VALUES('2', '1235', 'kkh');


select * from member2;
