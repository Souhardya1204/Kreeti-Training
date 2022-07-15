-- branch(bname, bcity, assets)
-- customer(cname, cstreet, ccity)
-- account(ano, bname, bal)
-- loan(lno, bname, amt)
-- depositor(cname, ano)
-- borrower(cname, lno)

-- Create database
create database banking_tutorial;

-- Select database
use banking_tutorial;

-- Create tables
create table branch (
  bname varchar(20) not null,
  bcity varchar(20) not null,
  assets integer not null default 0,
  primary key (bname),
  check (assets >= 0)
);

create table customer (
  cname varchar(20) not null,
  cstreet varchar(20) not null,
  ccity varchar(20) not null,
  primary key (cname)
);

create table account (
  ano integer not null,
  bname varchar(20) not null,
  bal integer not null default 0,
  primary key (ano),
  check (bal >= 0)
);

create table loan (
  lno integer not null,
  bname varchar(20) not null,
  amt integer not null default 0,
  primary key (lno),
  check (amt >= 0)
);

create table depositor (
  cname varchar(20) not null,
  ano integer not null,
  constraint pk_depositor primary key (cname, ano),
  foreign key (cname) references customer(cname),
  foreign key (ano) references account(ano)
);

create table borrower (
  cname varchar(20) not null,
  lno integer not null,
  constraint pk_borrower primary key (cname, lno),
  foreign key (cname) references customer(cname),
  foreign key (lno) references loan(lno)
);

-- Insert into branch
insert into branch (bname, bcity, assets)
values
  ('Dum Dum', 'Kolkata', 7100000),
  ('Salt Lake', 'Kolkata', 9000000),
  ('Salkia', 'Howrah', 400000),
  ('Belur Math', 'Howrah', 3700000),
  ('New Town', 'Kolkata', 1700000),
  ('Balaji Nagar', 'Dhanbad', 300000),
  ('Jayanagar', 'Bengaluru', 2100000),
  ('Chanakya Nagar', 'Dhanbad', 800000);

-- Insert into customer
insert into customer (cname, cstreet, ccity)
values
  ('Sourav', 'Balaji Nagar', 'Dhanbad'),
  ('Arpan', 'Salt Lake', 'Kolkata'),
  ('Ayan', 'Dum Dum', 'Kolkata'),
  ('Supriyo', 'New Town', 'Kolkata'),
  ('Shalini', 'Salkia', 'Howrah'),
  ('Arnab', 'Chankya Nagar', 'Dhanbad'),
  ('Ashish', 'Jayanagar', 'Bengaluru'),
  ('Krishna', 'Belur Math', 'Howrah');

-- Insert into account
insert into account (ano, bname, bal)
values
  (101, 'Jayanagar', 900),
  (102, 'Balaji Nagar', 1500),
  (103, 'Salt Lake', 1500),
  (104, 'Belur Math', 1300),
  (105, 'Salkia', 2000),
  (106, 'Chanakya Nagar', 500);

-- Insert into loan
insert into loan (lno, bname, amt)
values
  (201, 'Jayanagar', 700),
  (202, 'Balaji Nagar', 1100),
  (203, 'Salt Lake', 400),
  (204, 'Dum Dum', 850),
  (205, 'New Town', 600),
  (206, 'Salkia', 1600);

-- Insert into depositor
insert into depositor (cname, ano)
values
  ('Ashish', 101),
  ('Sourav', 102),
  ('Arpan', 103),
  ('Krishna', 104),
  ('Shalini', 105),
  ('Arnab', 106);

-- Insert into borrower
insert into borrower (cname, lno)
values
  ('Ashish', 201),
  ('Sourav', 202),
  ('Arpan', 203),
  ('Ayan', 204),
  ('Supriyo', 205),
  ('Shalini', 206);

-- Queries

-- Find the customer names, loan numbers and loan amounts for all loans at the 'New Town' branch in alphabetical order.
select borrower.cname, borrower.lno, loan.amt
from borrower
inner join loan on borrower.lno = loan.lno
where loan.bname = 'New Town'
order by borrower.cname;

-- Find the names of all branches that have assets greater than atleast one branch located in 'Kolkata'.
select bname
from branch
where assets > (
  select min(assets)
  from branch
  where bcity = 'Kolkata'
);

-- Find all customers having a loan, an account or both at the bank, without duplicates.
select cname
from borrower
union
select cname
from depositor;

-- Find all customers having a loan, an account or both at the bank, with duplicates.
select cname
from borrower
union all
select cname
from depositor;

-- Find all customers having both a loan and an account at the bank, without duplicates.
select distinct borrower.cname
from borrower
inner join depositor on borrower.cname = depositor.cname;

-- Find all customers who have an account but no loan at the bank, without duplicates.
select distinct cname
from depositor
where cname not in (
  select cname
  from borrower
);

-- Find all customers who have an account but no loan at the bank, with duplicates.
select cname
from depositor
where cname not in (
  select cname
  from borrower
);

-- Find the average account balance at the 'Salt Lake' branch.
select avg(bal) from account
where bname = 'Salt Lake';

-- Find the average account balance at the each branch.
select bname, avg(bal)
from account
group by bname;

-- Find the number of depositors for each branch.
select bname, count(ano)
from account
group by bname;

-- Find the number of depositors for each branch where average account balance is more than Rs 1200.
select bname, count(ano)
from account
group by bname
having avg(bal) > 1200;

-- Find the average balance for each customer who lives in 'Kolkata' and has at least two accounts.
select customer.cname, avg(account.bal)
from customer
inner join depositor on depositor.cname = customer.cname
inner join account on account.ano = depositor.ano
where customer.ccity = 'Kolkata'
group by customer.cname
having count(customer.cname) > 1;

-- Find all customers who have both an account and a loan at the 'Salt Lake' branch
select distinct depositor.cname
from depositor
inner join borrower on borrower.cname = depositor.cname
inner join account on account.ano = depositor.ano
where account.bname = 'Salt Lake';

-- Find the names of all branches that have assets greater than those of at least one branch located in 'Kolkata'.
select bname
from branch
where assets > some (
  select assets
  from branch
  where bcity = 'Kolkata'
);

-- Find the names of all branches that have assets greater than that of each branch located in 'Kolkata'.
select bname
from branch
where assets > all (
  select assets
  from branch
  where bcity = 'Kolkata'
);

-- Find all customers who have an account at all the branches located in 'Kolkata'.
select distinct d1.cname
from depositor d1
where not exists (
  select bname
  from branch
  where bcity = 'Kolkata' and bname not in (
    select account.bname
    from depositor d2
    inner join account on account.ano = d2.ano
    where d2.cname = d1.cname
  )
);

-- Find all customers who have at most one account at the 'New Town' branch.
select depositor.cname
from depositor
inner join account on account.ano = depositor.ano
where account.bname = 'New Town'
group by depositor.cname
having count(cname) < 2;

-- Find all customers who have at least two accounts at the 'New Town' branch.
select depositor.cname
from depositor
inner join account on account.ano = depositor.ano
where account.bname = 'New Town'
group by depositor.cname
having count(cname) > 1;

-- Find names of all branches that have greater assets than the 'New Town' branch
select T.bname
from branch as T , branch as S
where T.assets > S.assets and S.bname = 'New Town';

-- Find all branches having "town" in its name
select *
from branch
where bname like '%town%';

-- List all customers in alphabetic order of their names
select *
from customer
order by cname;

-- Find customers having a loan or an account
select cname from depositor
union
select cname from borrower;

-- Find the average account balance at "New Town" branch
select avg(bal)
from account
where bname = 'New Town';

-- Find the total number of depositors
select count(distinct cname)
from depositor;

-- Find the number of depositors in each branch
select bname, count(distinct cname)
from depositor, account
where depositor.ano = account.ano
group by bname;

-- Find names of all branches where the average account balance is more than 500 and the corresponding average balance
select bname, avg(bal)
from account
group by bname
having avg(bal) > 500;

-- Find names of customers having both a loan and an account
select cname
from borrower
where cname in (
  select cname
  from depositor
);

-- Find names of customers having a loan but not an account
select cname
from borrower
where cname not in (
  select cname
  from depositor
);

-- Find names of all customers having the same account number and the loan number
select D.cname
from depositor as D, customer as C
where D.cname = C.cname and D.cname in (
  select B.cname
  from borrower as B
  where B.cname = C.cname and B.lno = D.ano
);

-- Find names of branches that have assets greater than some branch in "Howrah"
select bname
from branch
where assets > some (
  select assets
  from branch
  where bcity = 'Howrah'
);

-- Find names of branches that have assets greater than all branch in "Howrah"
select bname
from branch
where assets > all (
  select assets
  from branch
  where bcity = 'Howrah'
);

-- Find names of customers who have both an account and a loan
select distinct cname
from borrower as B
where exists (
  select *
  from depositor as D
  where D.cname = B.cname
);

-- Find names of customers who have at most one account at the "New Town" branch
select distinct D.cname
from depositor as D
where (
  select count(*)
  from account, depositor as E
  where D.cname = E.cname and E.ano = account.ano and
    account.bname = 'New Town'
) = 1;

-- Find names of customers who have at least two account at the "Salt Lake" branch
select distinct D.cname
from depositor as D
where (
  select count(*)
  from account, depositor as E
  where D.cname = E.cname and E.ano = account.ano and
    account.bname = 'Salt Lake'
) > 1;

-- Find names of customers having account numbers 101, 102 and 315
select cname
from depositor
where ano in (101, 102, 215);

-- Find names of all branches where the average account balance is more than 500 and the corresponding average balance
select bname, avg_bal
from (
  select bname, avg(bal)
  from account
  group by bname
) as branch_avg(bname, avg_bal)
where avg_bal > 500;

-- Create an account with balance 100 at 'New Town' branch for every loan with the same number
insert into account
select lno, bname, 100
from loan
where bname = 'New Town';

insert into depositor
select cname, loan.lno
from loan, borrower
where bname = 'New Town' and loan.lno = borrower.lno;

-- Delete all accounts at branches of "Howrah"
delete from account
where bname in (
  select bname
  from branch
  where bcity = 'Howrah'
);

-- Delete all accounts whose balance is less than the average balance
delete from account
where bal < (
  select avg(bal)
  from account
);

-- Give 5% interest to all accounts with balance less than 500 and 6% interest otherwise
update account
set bal = bal * 1.06
where bal >= 500;

update account
set bal = bal * 1.05
where bal < 500;

-- Or
update account
set bal =
  case (bal)
    when bal < 500 then bal * 1.05
    else bal * 1.06
  end;
