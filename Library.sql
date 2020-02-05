create DataBase db_Library

use db_Library


/***************************************************************
*******************Creating The Tables**************************
***************************************************************/

--NO FOREIGN KEY
create table Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (0,1),
	BranchName varchar(60) not null,
	LibraryAddress varchar(100) not null
);

create table Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BorrowerName varchar(120) not null,
	BorrowerAddress varchar(100) not null,
	Phone varchar(30) not null
);

create table Publisher (
	PublisherName varchar(120) PRIMARY KEY NOT NULL,
	PublisherAddress varchar(100) not null,
	Phone varchar(30) not null
);

-- One Foreign Key
create table Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (0,1),
	Title varchar(100) not null,
	Book_Publisher VARCHAR(120) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

create table Book_Authors (
	Author_BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName varchar(100) not null,
);

--Two Foreign Key
create table Book_Copies (
	BookID_Copies INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID_Copies INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies int not null
);

--Three Foreign Keys
create table Book_Loans (
	Loaned_BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	Loand_BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Loand_CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut varchar(30),
	DateDue varchar(30)
);


/***************************************************************
****************Inserting Data into Tables**********************
***************************************************************/

--NO FOREIGN KEY
insert into Library_Branch
	(BranchName, LibraryAddress)
	Values
	('N/A', 'N/A'),
	('Beaverton City', '15798 SW 7th Street Beaverton OR 97006'),
	('Sharpstown', '17895 SW 3rd Street Portland OR 98117'),
	('Chicago', '36789 NE 180th Street Chicago IL 87709'),
	('Central', '18387 NW 3rd Street Seatle WA 89225')
;

insert into Borrower
	(BorrowerName, BorrowerAddress, Phone)
	Values
	('Bob Jones', '15378 NW 109th Street Beaverton OR 97806', '(503)-859-2241'),
	('Gary Valdez', '18379 SE 123rd Avenue Portland OR 97806', '(541)-325-3531'),
	('Charlie Gibson', '25428 NE Rosa Blvd Chicago IL 97806', '(379)-999-9469'),
	('Isaac Martan', '45030 SE Allen Blvd Seatle WA 97806', '(555)-013-2250'),
	('Jessie Martinez', '35353 NW Jefferson Aloha OR 97806', '(503)-683-3017'),
	('Daniella Thomas', '60194 SW 155 Street Tukwilla WA 97806', '(545)-072-4404'),
	('Dave Johnston', '94370 NE 12th Street Vancouver WA 97806', '(555)-151-7123'),
	('Bill Billiam', '55355 SW Keiz Way Chicago IL 97806', '(379)-726-1012'),
	('Sabastion Storm', '60350 SE Cross Avenue Beaverton OR 97806', '(503)-092-9317'),
	('Travis Mink', '11111 NW 89th Street Portland OR 97806', '(541)-222-5922')
;

insert into Publisher
	(PublisherName, PublisherAddress, Phone)
	values
	('N/A', 'N/A', 'N/A'),
	('Minks_inc', '33333 NW Nimbus Avenue Dallas TX 12121', '1(800)-mink-inc'),
	('Brick_House', '44444 NW 330th Street Janson AK 54545', '1(800)-br-house'),
	('Rose_Publishing', '55555 NW Shell Drive Seatle WA 26489', '1(800)-rose-pub'),
	('Jay_co', '66666 NW Norman Street Portland OR 97806', '1(800)-3333-jay'),
	('Nooks_Books', '77777 NW Animal Crossing Aloha HI 33333', '1(800)-33-nooks')
;

--ONE FOREIGN KEY
insert into Books
	(Title, Book_Publisher)
	Values
	('N/A', 'N/A'),
	--Minks inc
	('Games For Dummies', 'Minks_inc'),
	('Green Eggs and Ham', 'Minks_inc'),
	('Dog Man: Brawl of the Wild', 'Minks_inc'),
	('The Wonky Donkey', 'Minks_inc'),
	('Oh, the Places You will Go!', 'Minks_inc'),
	--Brick House
	('The Long Walk', 'Brick_House'),
	('The Shining', 'Brick_House'),
	('StrengthsFinder 2.0', 'Brick_House'),
	--Rose Publishing
	('Its Not Supposed to Be This Way', 'Rose_Publishing'),
	('The Life-Changing Magic of Tidying Up', 'Rose_Publishing'),
	('The Mueller Report', 'Rose_Publishing'),
	--Jay co
	('The Hunger Games', 'Jay_co'),
	('Catching Fire', 'Jay_co'),
	('Mockingjay', 'Jay_co'),
	('The Lost Tribe', 'Jay_co'),
	--Nooks Books
	('Harry Potter and thearry Potter and the Sorcerers Stone', 'Nooks_Books'),
	('Harry Potter and the Chamber of Secrets', 'Nooks_Books'),
	('Harry Potter and the Prisoner of Azkaban', 'Nooks_Books'),
	('Harry Potter and the Goblet of Fire', 'Nooks_Books'),
	('Harry Potter and the Order of the Phoenix', 'Nooks_Books'),
	('Harry Potter and the Half-Blood Prince', 'Nooks_Books'),
	('Harry Potter and the Deathly Hallows', 'Nooks_Books'),
	('Harry Potter and the Cursed Child', 'Nooks_Books')
;

insert into Book_Authors
	(Author_BookID, AuthorName)
	Values
	(0, 'N/A'),
	(1, 'unKnown'),
	(2, 'Dr. Suess'),
	(3, 'Rachel Hollis'),
	(4, 'Craig Smith'),
	(5, 'Dr. Suess'),
	(6, 'Stephen King'),
	(7, 'Stephen King'),
	(8, 'Tom Rath'),
	(9, 'Lysa TerKeurst'),
	(10, 'Marie Kondo'),
	(11, 'Washington Post'),
	(12, 'Suzanne Collins'),
	(13, 'Suzanne Collins'),
	(14, 'Suzanne Collins'),
	(15, 'Mark Lee'),
	(16, 'J. K. Rowling'),
	(17, 'J. K. Rowling'),
	(18, 'J. K. Rowling'),
	(19, 'J. K. Rowling'),
	(20, 'J. K. Rowling'),
	(21, 'J. K. Rowling'),
	(22, 'J. K. Rowling'),
	(23, 'J. K. Rowling')
;

--TWO FOREIGN KEYS
insert into Book_Copies
	(BookID_Copies, BranchID_Copies, Number_Of_Copies)
	Values

	--'Beaverton City'
	(1, 1, 3),
	(2, 1, 3),
	(3, 1, 3),
	(4, 1, 3),
	(5, 1, 3),
	(6, 1, 3),
	(7, 1, 3),
	(8, 1, 3),
	(9, 1, 3),
	(10, 1, 3),
	(11, 1, 3),
	(12, 1, 3),
	(13, 1, 3),
	(14, 1, 3),
	(15, 1, 3),
	(16, 1, 7),
	(17, 1, 7),
	(18, 1, 7),
	(19, 1, 7),
	(20, 1, 7),
	(21, 1, 7),
	(22, 1, 7),
	(23, 1, 7),
	--'Sharpstown'
	(12, 2, 2),
	(13, 2, 2),
	(14, 2, 2),
	(15, 2, 2),
	(16, 2, 3),
	(17, 2, 4),
	(18, 2, 3),
	(19, 2, 5),
	(20, 2, 3),
	(21, 2, 4),
	(22, 2, 3),
	(23, 2, 3),
	--'Chicago'
	(1, 3, 4),
	(2, 3, 2),
	(3, 3, 2),
	(4, 3, 4),
	(5, 3, 5),
	(6, 3, 2),
	(7, 3, 2),
	(8, 3, 6),
	(9, 3, 7),
	(10, 3, 3),
	(11, 3, 2),
	--'Central'
	(1, 4, 2),
	(2, 4, 2),
	(3, 4, 2),
	(4, 4, 2),
	(5, 4, 2),
	(6, 4, 4),
	(7, 4, 4),
	(16, 4, 9),
	(17, 4, 6),
	(18, 4, 8),
	(19, 4, 7),
	(20, 4, 5),
	(21, 4, 9),
	(22, 4, 9),
	(23, 4, 3)
;

--THREE FOREIGN KEYS
insert into Book_Loans
	(Loaned_BookID, Loand_BranchID, Loand_CardNo, DateOut, DateDue)
	Values
	--Bob Jones
	(0, 0, 1, null, null), 
	--Gary Valdez
	(6, 1, 2, '01-01-20', '02-01-20'),
	(7, 1, 2, '01-29-20', '02-29-20'),
	--Charlie Gibson
	(8, 3, 3, '01-01-20', '02-01-20'),
	(9, 3, 3, '01-29-20', '02-29-20'),
	--Isaac Martan
	(7, 4, 4, '01-01-20', '02-01-20'),
	(19, 4, 4, '01-13-20', '02-13-20'),
	(22, 4, 4, '01-30-20', '02-29-20'),
	--Jessie Martinez
	(15, 2, 5, '02-03-20', '03-03-20'),
	(18, 2, 5, '02-19-20', '03-19-20'),
	(23, 2, 5, '01-29-20', '02-29-20'),
	--Daniella Thomas
	(16, 4, 6, '01-17-20', '02-17-20'),
	(17, 4, 6, '02-13-20', '03-13-20'),
	(18, 4, 6, '01-01-20', '02-01-20'),
	(19, 4, 6, '01-09-20', '02-09-20'),
	(20, 4, 6, '01-01-20', '02-01-20'),
	(21, 4, 6, '01-29-20', '02-29-20'),
	(22, 4, 6, '01-01-20', '02-01-20'),
	(23, 4, 6, '01-01-20', '02-01-20'),
	--Dave Johnston
	(0, 0, 7, null, null),
	--Bill Billiam
	(1, 1, 8, '01-03-20', '02-03-20'),
	(2, 1, 8, '01-03-20', '02-03-20'),
	(3, 1, 8, '01-03-20', '02-03-20'),
	(4, 1, 8, '01-03-20', '02-03-20'),
	(5, 1, 8, '01-03-20', '02-03-20'),
	(6, 1, 8, '01-03-20', '02-03-20'),
	(7, 1, 8, '01-03-20', '02-03-20'),
	(8, 1, 8, '01-03-20', '02-03-20'),
	(9, 1, 8, '01-03-20', '02-03-20'),
	(10, 1, 8, '01-03-20', '02-03-20'),
	(11, 1, 8, '01-05-20', '02-05-20'),
	(12, 1, 8, '01-05-20', '02-05-20'),
	(13, 1, 8, '01-05-20', '02-05-20'),
	(14, 1, 8, '01-05-20', '02-05-20'),
	(15, 1, 8, '01-05-20', '02-05-20'),
	(16, 1, 8, '01-23-20', '02-23-20'),
	(17, 1, 8, '01-23-20', '02-23-20'),
	(18, 1, 8, '01-23-20', '02-23-20'),
	(19, 1, 8, '01-23-20', '02-23-20'),
	(20, 1, 8, '01-23-20', '02-23-20'),
	(21, 1, 8, '01-23-20', '02-23-20'),
	(22, 1, 8, '01-23-20', '02-23-20'),
	(23, 1, 8, '01-23-20', '02-23-20'),
	--Sabastion Storm
	(1, 4, 9, '01-13-20', '02-13-20'),
	(2, 4, 9, '01-13-20', '02-13-20'),
	(3, 4, 9, '01-13-20', '02-13-20'),
	(4, 4, 9, '01-13-20', '02-13-20'),
	(5, 4, 9, '01-22-20', '02-22-20'),
	(6, 4, 9, '01-22-20', '02-22-20'),
	(7, 4, 9, '01-22-20', '02-22-20'),
	(16, 4, 9, '01-22-20', '02-22-20'),
	(17, 4, 9, '01-22-20', '02-22-20'),
	(18, 4, 9, '01-22-20', '02-22-20'),
	(19, 4, 9, '01-27-20', '02-27-20'),
	(20, 4, 9, '01-27-20', '02-27-20'),
	(21, 4, 9, '01-27-20', '02-27-20'),
	(22, 4, 9, '01-27-20', '02-27-20'),
	(23, 4, 9, '01-27-20', '02-27-20'),
	--Travis Mink
	(1, 3, 10, '02-01-20', '03-01-20'),
	(2, 3, 10, '02-01-20', '03-01-20'),
	(3, 3, 10, '02-02-20', '03-02-20'),
	(4, 3, 10, '02-03-20', '03-03-20'),
	(5, 3, 10, '02-04-20', '03-04-20')
;


/***************************************************************
*******************Stored Pocedures*****************************
***************************************************************/


-- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
create proc dbo.usp_getCopies_at_branch
	as
		select 
			a1.Number_Of_Copies as 'Copies', a2.Title as 'Book', a3.BranchName as 'Library'
			from Book_Copies a1
			join Books a2 on a1.BookID_Copies = a2.BookID
			join Library_Branch a3 on a1.BranchID_Copies = a3.BranchID
			where Title = 'The Lost Tribe'
			and BranchName = 'Sharpstown' 
	go

exec usp_getCopies_at_branch


--How many copies of the book titled "The Lost Tribe" are owned by each library branch?
create proc dbo.usp_getCopies_at_AllLibrary
	as
		select 
			a1.Number_Of_Copies as 'Copies', a2.Title as 'Book', a3.BranchName as 'Library'
			from Book_Copies a1
			join Books a2 on a1.BookID_Copies = a2.BookID
			join Library_Branch a3 on a1.BranchID_Copies = a3.BranchID
			where Title = 'The Lost Tribe'
	go

exec usp_getCopies_at_AllLibrary


-- Retrieve the names of all borrowers who do not have any books checked out.
create proc dbo.usp_getBorrowers_no
	as
		select
			a2.BorrowerName as 'Name'
			from Book_Loans a1
			join Borrower a2 on a1.Loand_CardNo = a2.CardNo
			where Loaned_BookID = 0
	go

exec usp_getBorrowers_no


--For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
create proc dbo.usp_getbooksDue_branch @DateDue nvarchar(30) = Null
	as
		select 
			a3.Title as 'Book Due', a4.BorrowerName as 'Name', a4.BorrowerAddress as 'Address'
			from Book_Loans a1
			join Library_Branch a2 on a1.Loand_BranchID = a2.BranchID
			join Books a3 on a1.Loaned_BookID = a3.BookID
			join Borrower a4 on a1.Loand_CardNo = a4.CardNo
			where BranchName = 'Sharpstown'
			and DateDue like '%' + isnull(@DateDue, DateDue) + '%'
	go

	-- You can type in any date here
exec dbo.usp_getbooksDue_branch @DateDue = '03-03'


--For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
  create proc dbo.usp_get#ofbooksOut_branch
	as
		select 
			a2.BranchName, count(Loand_BranchID) as 'Total # of Books Out' 
			from Book_Loans a1 
			join Library_Branch a2 on a1.Loand_BranchID = a2.BranchID
			where BranchName != 'N/A'
			group by a2.BranchName
	go

exec dbo.usp_get#ofbooksOut_branch

--Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
create proc dbo.usp_get#ofbooksCheckedOut_Borrower
	as
		select 
			a2.BorrowerName as 'Name', a2.BorrowerAddress as 'Address', count(Loand_CardNo) as 'Total # of Books Checked Out' 
			from Book_Loans a1 
			join Borrower a2 on a1.Loand_CardNo = a2.CardNo
			group by a2.BorrowerName, a2.BorrowerAddress
			having count(Loand_CardNo) >5
	go

exec dbo.usp_get#ofbooksCheckedOut_Borrower

--For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
create proc dbo.usp_getStephenCentral
	as
		select
			a2.Title as 'Book', a3.Number_Of_Copies as '# of Copies'
			from Book_Authors a1
			join Books a2 on a1.Author_BookID = a2.BookID
			join Book_Copies a3 on a2.BookID = a3.BookID_Copies
			join Library_Branch a4 on a3.BranchID_Copies = a4.BranchID
			where a4.BranchName = 'Central'
			and a1.AuthorName = 'Stephen King'
	go

exec dbo.usp_getStephenCentral