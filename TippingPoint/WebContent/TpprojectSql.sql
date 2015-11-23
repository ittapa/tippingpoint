drop table tpproject
drop table tpnotice

select * from TPPROJECT


-- 공지
create table tpnotice(
	tpNoticeNum number(20) primary key,
	tpNoticeDate varchar2(10),
	tpNoticeTitle varchar2(200) not null,
	tpNoticeContents varchar2(2000) not null
);


insert into tpnotice values(1,'20151120', '첫번째 공지', '첫번째 공지사항입니다 ㅎㅎㅎㅎㅎㅎㅎ');
insert into tpnotice values(2,'20151120', '두번째 공지', '두번째 공지사항입니다 ㅎㅎㅎㅎㅎㅎㅎ');
insert into tpnotice values(3,'20151120', '세번째 공지', '세번째 공지사항입니다 ㅎㅎㅎㅎㅎㅎㅎ');

 	select TpNoticeNum, tpNoticeDate, tpNoticeTitle, tpNoticeContents
	 		from(
	 			select ceil(rownum/10) page, TpNoticeNum, tpNoticeDate, tpNoticeTitle, tpNoticeContents
	 			from(
	 				select TpNoticeNum, tpNoticeDate, tpNoticeTitle, tpNoticeContents
	 				from tpnotice
	 				order by TpNoticeNum
	 			)
	 		)
	 	where page = 1


select TpNoticeNum, tpNoticeDate, tpNoticeTitle, tpNoticeContents
				 from tpnotice where TpNoticeNum = 1






-- 게시판
create table tpproject(
	tppId varchar2(100) primary key,
	tppTitle varchar2(200) not null,
	tppProjectContent varchar2(2000) not null,
	tppWriter varchar2(100) not null,
	tppWriteDate number(20) not null,
	tppTotalAmount number(20) default(0),
	tppTargetAmount number(20),
	tppFundingStartDate varchar2(10),
	tppFundingLastDate varchar2(10),
	tppFunderNum number(20) default(0),
	tppState varchar2(4) default('a'),
	tppAdminMessage varchar2(200),
	tppMainImg varchar2(100),
	tppCategroy varchar2(20)
	
);



select * from TPPROJECT
select tppProjectContent from TPPROJECT




insert into tpproject values('id1','title','2','내용', 20121212, 10000, 999999, '20121212', '20121212', 1, 'a', 'message','메인이미지경로','game');
insert into tpproject values('id2','title','2','내용', 20121212, 10000, 999999, '20121212', '20121212', 1, 'a', 'message','메인이미지경로','game');
insert into tpproject values('id3','title','2','내용', 20121212, 10000, 999999, '20121212', '20121212', 1, 'b', 'message','메인이미지경로','game');
insert into tpproject values('id4','title','2','내용', 20121212, 10000, 999999, '20121212', '20121212', 1, 'b', 'message','메인이미지경로','game');
insert into tpproject values('아이디','제목','이게내용이지','1', 20121212, 10000, 999999, '20121212', '20121212', 1, 'b', 'message','메인이미지경로','game');

UPDATE tpproject SET tppId='id1', tppState='x',
							  tppAdminMessage='안되이시키야'
		WHERE tppId='id1'

select rownum, tppTitle, tppWriter from tpproject
select tppTitle, tppWriter, tppFundingLastDate, tppTotalAmount
	 		from(
	 			select ceil(rownum/10) page, tppTitle, tppWriter, tppFundingLastDate, tppTotalAmount
	 			from(
	 				select tppTitle, tppWriter, tppFundingLastDate, tppTotalAmount
	 				from tpproject
	 				order by tppFundingLastDate
	 			)
	 		) 
		where page = 1
	 	
	 	
select count(tppId) from tpproject



select tppId, tppTitle, tppProjectContent, tppWriter, tppWriteDate, tppTotalAmount,
				 tppTargetAmount, tppFundingStartDate, tppFundingLastDate, 
				 tppFunderNum, tppState, tppAdminMessage from tpproject 
				 where tppId like %'2'%
				 
	union
select * from tpproject 
				 where tppId like '%'||'d'||'%'
				 

	select * from tpproject 

	
	
	
	
	
	
	
	
	
	
	
	
		select tppId, tppTitle, tppProjectContent, tppWriter, tppWriteDate, tppTotalAmount,
				 tppTargetAmount, tppFundingStartDate, tppFundingLastDate, 
				 tppFunderNum, tppState, tppAdminMessage, 	tppMainImg, tppCategroy

				 from tpproject where tppWriter = '1'

