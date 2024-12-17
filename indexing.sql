
-- create
CREATE TABLE EMPLOYEE (
  empId int,
  name varchar(15),
  dept varchar(10)
);

-- insert
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (1, 'Clark', 'Sales');
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (2, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (3, 'Ava', 'Sales');

/*
ইন্ডেক্সিং করা হয় ডেটাবেসের কোয়েরি পারফরম্যান্স উন্নত করার জন্য।
এটি ডেটা দ্রুত পুনরুদ্ধার করতে সাহায্য
করে, বিশেষ করে বড় টেবিলগুলির ক্ষেত্রে। ইন্ডেক্সিং ডেটা অ্যা
ক্সেসের সময় কমিয়ে আনে এবং সার্চ অপারেশনগুলোকে
আরও কার্যকর করে তোলে।
*/

-- normal index
create index testIndex
on EMPLOYEE(name desc);
GO
select * from EMPLOYEE 
order by name desc;

GO

/*
একটি ইনডেক্স তৈরি করার সময়, এটি একটি আলাদা 
অবজেক্ট নয় যা আপনি সরাসরি কোয়েরি করতে পারেন। 
ইনডেক্সগুলি টেবিলের সাথে যুক্ত থাকে এবং ডেটা পুনরুদ্ধা
রের গতি বাড়ানোর জন্য ব্যবহৃত হয়। ইনডেক্সের ভিতরে
কি আছে তা দেখতে না পাওয়ার কারণ হল ইনডেক্সগুলি
শুধুমাত্র টেবিলের ডেটা দ্রুত অ্যাক্সেস করার জন্য
ডিজাইন করা হয়েছে, আলাদা টেবিল হিসেবে নয়।

যখন আপনি একটি ইনডেক্স তৈরি করেন, এটি
 টেবিলের ডেটা পুনরুদ্ধারের গতি বাড়া
য়, কিন্তু আপনি সরাসরি ইনডেক্স থেকে ডেটা দেখতে পারবেন না
। উদাহরণস্বরূপ, আপনি SELECT * FROM EMPLOYEE কোয়েরি
চালাতে পারেন এবং ইনডেক্সটি এই কোয়েরির কার্যকারিতা উন্নত ক
রবে, কিন্তু আপনি SELECT * FROM testIndex চালাতে পারবেন না
 কারণ ইনডেক্সটি একটি আলাদা টেবিল নয়।
 */
 
 /*
 two types of index
 1. Clustered index
 2. non Clustered index
 
 # Clustered index
 Clustered index একটি টেবিলে শুধুমাত্র একবরই তরি করা যায়  
 তবে সে টেবিলে কোন  Primary key  থাকা যাবে না । 
 এই index স্পেসিফিক কলামের উপরে  করা  হয়  ।  
 সে কলাম তখন  প্রয়াইমারি কী এর মত কাজ করবে । কিন্তু এখানে 
 প্রাইমারি কী এর সাথে পার্থক্য হল এখানে ডুপ্লিকেট ভ্যালু থাকতে পারবে । 
 এবং এটি asc অর্ডারে থাকবে । 

 # non Clustered index
 একটি টেবিলে একাধিক  non Clustered index তৈরি করা যায় । 
 এটি টেবিলের ডাটার একটি পৃথক কপি তৈরি করে  এবং  ইনডেক্স পেজে সংরক্ষন করে । 
 non Clustered এক বা একাধিক কলাম নিয়ে তৈরি করা যা । 

 */
 
 
 -- Clustered index
 create clustered index clstrIndx
 on EMPLOYEE(Name);
 GO
 
 -- non Clustered index
 create nonclustered index nonClstrIndx
 on EMPLOYEE(dept);
 GO
 
 
-- find index on table 
sp_helpindex EMPLOYEE;
GO
-- delete index
drop index EMPLOYEE.testIndex;
GO

-- find index on table 
sp_helpindex EMPLOYEE;
GO



 
 
 
 
 
 
 
 
 
 
 
 
