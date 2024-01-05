--1. Hər Publisherin ən az səhifəli kitabını ekrana çıxarın

SELECT Press.[Name], MIN(Books.Pages)  FROM Books
INNER JOIN Press ON Press.Id = Books.Id_Press
GROUP BY Press.[Name]

--=============================================================================================================

--2. Publisherin ümumi çap etdiyi kitabların orta səhifəsi 100dən yuxarıdırsa, o Publisherləri ekrana çıxarın.

select Press.[Name],AVG(Books.Pages) as 'Ortalama' From Books
Inner join Press on Press.Id=Books.Id_Press
group by Press.[Name]
HAVING AVG(Books.Pages) > 100;

--=============================================================================================================

--3. BHV və BİNOM Publisherlərinin kitabların bütün cəmi səhifəsini ekrana çıxarın

select Press.[Name],Sum(Books.Pages) as 'Sum Pages'
from Books 
inner join Press on Press.Id=Books.Id_Press
group by Press.[Name]
Having Press.[Name]='BHV' or Press.[Name]='Binom'

--=============================================================================================================

--4. Yanvarın 1-i 2001ci il və bu gün arasında kitabxanadan kitab götürən bütün tələbələrin adlarını ekrana çıxarın
select Students.FirstName,S_Cards.DateOut from S_Cards
inner join Students on S_Cards.Id_Student=Students.Id
where S_Cards.DateOut >= '01-01-2001'

--=============================================================================================================

--5. Olga Kokorevanın  "Windows 2000 Registry" kitabı üzərində işləyən tələbələri tapın
select Authors.[FirstName],Authors.LastName,Students.FirstName as 'Student Name' from S_Cards
inner join Books on S_Cards.Id_Book = Books.Id
inner join Authors on Authors.Id = Books.Id_Author
inner join Students on S_Cards.Id_Student = Students.Id
where Authors.FirstName ='Olga' And Authors.LastName='Kokoreva'

--=============================================================================================================

--6. Yazdığı bütün kitabları nəzərə aldıqda, orta səhifə sayı 600dən çox olan Yazıçılar haqqında məlumat çıxarın.
select Authors.[FirstName],AVG(Books.Pages) as 'Ortalama' From Books
Inner join Authors on Authors.Id=Books.Id_Author
group by Authors.[FirstName]
HAVING AVG(Books.Pages) > 600;

--=============================================================================================================

--7. Çap etdiyi bütün kitabların cəmi səhifə sayı 700dən çox olan Publisherlər haqqında ekrana məlumat çıxarın

select Press.[Name],Sum(Books.Pages) as 'Sum Pages'
from Books 
inner join Press on Press.Id=Books.Id_Press
group by Press.[Name]
Having SUM(Books.Pages) > 700

--=============================================================================================================

--8. Kitabxananın bütün ziyarətçilərini və onların götürdüyü kitabları çıxarın.
select Teachers.FirstName,Teachers.LastName,Books.[Name] as 'Book Name' from Teachers
inner join T_Cards on Teachers.Id = T_Cards.Id_Teacher
inner join Books on  Books.Id=T_Cards.Id_Book
Union
select Students.FirstName,Students.LastName, Books.[Name]  as 'Book Name' from Students
inner join S_Cards on Students.Id=S_Cards.Id_Student
inner join Books on Books.Id=S_Cards.Id_Book

--=============================================================================================================

--9. Studentlər arasında ən məşhur author(lar) və onun(ların) götürülmüş kitablarının sayını çıxarın.
select Students.FirstName,Students.LastName,Authors.[FirstName] as 'Author Name',Count(Books.Id) as 'Count' from Students
inner join S_Cards on Students.Id=S_Cards.Id_Student
inner join Books on Books.Id=S_Cards.Id_Book 
inner join Authors on Authors.Id=Books.Id_Author
group by Students.FirstName,Students.LastName,Authors.[FirstName]
order by Count(Books.Id) desc

--=============================================================================================================

--10. Print the most popular author (s) among the teachers and the number of books of this author taken in the library.
select Teachers.FirstName,Teachers.LastName,Authors.[FirstName] as 'Author Name',Count(Books.Id) as 'Count' from Teachers
inner join T_Cards on Teachers.Id=T_Cards.Id_Teacher
inner join Books on Books.Id=T_Cards.Id_Book 
inner join Authors on Authors.Id=Books.Id_Author
group by Teachers.FirstName,Teachers.LastName,Authors.[FirstName]
order by Count(Books.Id) desc















