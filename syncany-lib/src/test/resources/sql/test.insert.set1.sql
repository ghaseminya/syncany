-- Only MASTER data, no DIRTY database versions

-- 1. Add "file1", "file2", and "file3" in 3 database versions

INSERT INTO CHUNK VALUES('8ce24fc0ea8e685eb23bf6346713ad9fef920425',1);
INSERT INTO CHUNK VALUES('bf8b4530d8d246dd74ac53a13471bba17941dff7',1);
INSERT INTO CHUNK VALUES('fe83f217d464f6fdfa5b2b1f87fe3a1a47371196',1);
INSERT INTO DATABASEVERSION VALUES(0,'MASTER','2014-01-01 16:26:09.004000','A','(A1)');
INSERT INTO DATABASEVERSION VALUES(1,'MASTER','2014-01-02 16:26:09.208000','A','(A2)');
INSERT INTO DATABASEVERSION VALUES(2,'MASTER','2014-01-03 16:26:09.349000','A','(A3)');
INSERT INTO DATABASEVERSION_VECTORCLOCK VALUES(0,'A',1);
INSERT INTO DATABASEVERSION_VECTORCLOCK VALUES(1,'A',2);
INSERT INTO DATABASEVERSION_VECTORCLOCK VALUES(2,'A',3);
INSERT INTO FILECONTENT VALUES('8ce24fc0ea8e685eb23bf6346713ad9fef920425',1);
INSERT INTO FILECONTENT VALUES('bf8b4530d8d246dd74ac53a13471bba17941dff7',1);
INSERT INTO FILECONTENT VALUES('fe83f217d464f6fdfa5b2b1f87fe3a1a47371196',1);
INSERT INTO FILECONTENT_CHUNK VALUES('8ce24fc0ea8e685eb23bf6346713ad9fef920425','8ce24fc0ea8e685eb23bf6346713ad9fef920425',0);
INSERT INTO FILECONTENT_CHUNK VALUES('bf8b4530d8d246dd74ac53a13471bba17941dff7','bf8b4530d8d246dd74ac53a13471bba17941dff7',0);
INSERT INTO FILECONTENT_CHUNK VALUES('fe83f217d464f6fdfa5b2b1f87fe3a1a47371196','fe83f217d464f6fdfa5b2b1f87fe3a1a47371196',0);
INSERT INTO FILEHISTORY VALUES('4fef2d605640813464792b18b16e1a5e07aa4e53',2);
INSERT INTO FILEHISTORY VALUES('851c441915478a539a5bab2b263ffa4cc48e282f',0);
INSERT INTO FILEHISTORY VALUES('c021aecb2ae36f2a8430eb10309923454b93b61e',1);
INSERT INTO FILEVERSION VALUES('4fef2d605640813464792b18b16e1a5e07aa4e53',1,2,'file3','FILE','NEW',1,'2014-01-03 16:26:09.666000',NULL,'8ce24fc0ea8e685eb23bf6346713ad9fef920425','2014-01-03 16:26:09.341000','rw-r--r--',NULL);
INSERT INTO FILEVERSION VALUES('851c441915478a539a5bab2b263ffa4cc48e282f',1,0,'file1','FILE','NEW',1,'2014-01-01 16:26:07.876000',NULL,'fe83f217d464f6fdfa5b2b1f87fe3a1a47371196','2014-01-01 16:26:08.995000','rw-r--r--',NULL);
INSERT INTO FILEVERSION VALUES('c021aecb2ae36f2a8430eb10309923454b93b61e',1,1,'file2','FILE','NEW',1,'2014-01-02 16:26:09.123000',NULL,'bf8b4530d8d246dd74ac53a13471bba17941dff7','2014-01-02 16:26:09.201000','rw-r--r--',NULL);
INSERT INTO MULTICHUNK VALUES('ac1d89b3f57349edc6fe29f9bef1b0aeadf499a8');
INSERT INTO MULTICHUNK VALUES('e2a3f6bea38fcc90a35654f3500333115cf67943');
INSERT INTO MULTICHUNK VALUES('e5c62378c7c4d99a84a186a41034c3dbf9a3ad7b');
INSERT INTO MULTICHUNK_CHUNK VALUES('ac1d89b3f57349edc6fe29f9bef1b0aeadf499a8','fe83f217d464f6fdfa5b2b1f87fe3a1a47371196');
INSERT INTO MULTICHUNK_CHUNK VALUES('e2a3f6bea38fcc90a35654f3500333115cf67943','8ce24fc0ea8e685eb23bf6346713ad9fef920425');
INSERT INTO MULTICHUNK_CHUNK VALUES('e5c62378c7c4d99a84a186a41034c3dbf9a3ad7b','bf8b4530d8d246dd74ac53a13471bba17941dff7');

-- 2a. Add changed "file1" (changed posix permission; DIRTY -- not relevant!)

INSERT INTO CHUNK VALUES('beefbeefbeefbeefbeefbeefbeefbeefbeefbeef',1);
INSERT INTO DATABASEVERSION VALUES(3,'DIRTY','2014-01-04 16:28:09.349000','B','(B1)');
INSERT INTO DATABASEVERSION_VECTORCLOCK VALUES(3,'B',1);
INSERT INTO FILECONTENT VALUES('beefbeefbeefbeefbeefbeefbeefbeefbeefbeef',1);
INSERT INTO FILECONTENT_CHUNK VALUES('beefbeefbeefbeefbeefbeefbeefbeefbeefbeef','beefbeefbeefbeefbeefbeefbeefbeefbeefbeef',0);
INSERT INTO FILEHISTORY VALUES('beef111111111111111111111111111111111111',3);
INSERT INTO FILEHISTORY VALUES('851c441915478a539a5bab2b263ffa4cc48e282f',3);
INSERT INTO FILEVERSION VALUES('851c441915478a539a5bab2b263ffa4cc48e282f',2,3,'file1','FILE','CHANGED',1,'2014-01-04 16:28:07.000000',NULL,'fe83f217d464f6fdfa5b2b1f87fe3a1a47371196','2014-01-04 16:26:08.995000','rwxrw-r--',NULL);
INSERT INTO FILEVERSION VALUES('beef111111111111111111111111111111111111',1,3,'beef','FILE','NEW',1,'2014-01-05 16:28:07.000000',NULL,'beefbeefbeefbeefbeefbeefbeefbeefbeefbeef','2014-01-05 16:26:08.995000','rw-r--r--',NULL);
INSERT INTO MULTICHUNK VALUES('1234567890987654321123456789098765433222');
INSERT INTO MULTICHUNK_CHUNK VALUES('1234567890987654321123456789098765433222','beefbeefbeefbeefbeefbeefbeefbeefbeefbeef');

-- 2b. Delete "file1"

INSERT INTO DATABASEVERSION VALUES(4,'MASTER','2014-01-04 16:28:09.349000','A','(A4)');
INSERT INTO DATABASEVERSION_VECTORCLOCK VALUES(4,'A',4);
INSERT INTO FILEHISTORY VALUES('851c441915478a539a5bab2b263ffa4cc48e282f',4);
INSERT INTO FILEVERSION VALUES('851c441915478a539a5bab2b263ffa4cc48e282f',2,4,'file1','FILE','DELETED',1,'2014-01-04 16:28:07.000000',NULL,'fe83f217d464f6fdfa5b2b1f87fe3a1a47371196','2014-01-04 16:26:08.995000','rw-r--r--',NULL);

-- 3. Add new "file1"

INSERT INTO CHUNK VALUES('ffffffffffffffffffffffffffffffffffffffff',1);
INSERT INTO DATABASEVERSION VALUES(5,'MASTER','2014-01-05 16:28:09.349000','A','(A5)');
INSERT INTO DATABASEVERSION_VECTORCLOCK VALUES(5,'A',5);
INSERT INTO FILECONTENT VALUES('ffffffffffffffffffffffffffffffffffffffff',1);
INSERT INTO FILECONTENT_CHUNK VALUES('ffffffffffffffffffffffffffffffffffffffff','ffffffffffffffffffffffffffffffffffffffff',0);
INSERT INTO FILEHISTORY VALUES('abcdeffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',5);
INSERT INTO FILEVERSION VALUES('abcdeffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',1,5,'file1','FILE','NEW',1,'2014-01-05 16:28:07.000000',NULL,'ffffffffffffffffffffffffffffffffffffffff','2014-01-05 16:26:08.995000','rw-r--r--',NULL);
INSERT INTO MULTICHUNK VALUES('dddddddddddddddddddddddddddddddddddddddd');
INSERT INTO MULTICHUNK_CHUNK VALUES('dddddddddddddddddddddddddddddddddddddddd','ffffffffffffffffffffffffffffffffffffffff');

