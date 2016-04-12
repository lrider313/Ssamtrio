INSERT INTO CSBOARD (
						CSTYPE,
						CSTITLE,
						CSCONT,
						CSIP,
						CSFILE,
						BOARDID,
						MEMID
					)
			 VALUES (
			 			'1',
			 			'title',
			 			'content',
			 			'123.123.123.123',
			 			'file',
			 			'2',
			 			'5'
			 		)
			 		
			 		UPDATE CSBOARD SET 
						CSTYPE='2',
						CSTITLE='update',
						CSCONT='fffaaffd',
						CSFILE='Test1.txt',
						BOARDID='1'
				WHERE CSID='2'
				
				SELECT 					CSID,
						CSTYPE,
						CSTITLE,
						CSCONT,
						CSIP,
						CSFILE,
						BOARDID,
						MEMID
						FROM CSBOARD
						WHERE CSID='4'