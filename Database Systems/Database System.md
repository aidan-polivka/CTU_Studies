Database System

Discussion Board 3

Aidan Polivka

April 4, 2024

After reading through the scenario outlined for discussion board 3,
these are the problems I discovered in the text:

1.  Not enough data is stored OR database architecture isn't built to
    support the correct data.

2.  Original developers of the database system did not document
    anything.

3.  Joe's system cannot generate the reports he needs because of lack of
    valuable data.

4.  Joe does not understand what data and capabilities his system does
    possess.

5.  Joe does not know what he needs from the system.

**Discuss the specific problems that the story has demonstrated and your
recommendations how the problems can be resolved based on your personal
experience and research.**

Unfortunately, I think a lot of businesses end up in this situation.
They hire a consulting company to work on their system, or build them a
new system, and didn't vet the consultants well enough. As a result,
they end up with a system that may "work" but isn't well documented or
in the worst case it's buggy and poorly built.

The first step in understanding what a client wants is to *talk to the
client*. Start with discussing the domain. In this case, discussions
about daily, nightly, weekly, monthly, and yearly routines that occur in
the sporting goods industry. Take careful notes, and then discuss what
features would be needed to best fulfil those processes with the
customer. It is so important to develop an understanding of the
customer's domain, wants, and needs before developing code and data
structures. To me it doesn't seem like the previous consultants did
enough talking with stakeholders before working on this project. Having
these conversations with Joe and the other stakeholders will not only
ensure that the system you're building for them will suit their needs,
but also bring awareness to Joe of what he needs the system to do from
the perspective of other stake holders.

**Discuss why the database technology can be used to facilitate
problem-solving in this case with specific examples.**

The biggest issue you would face in working with this system is the lack
of documentation. There are a few things you can do to help understand
how the system works if it isn't easily discernable by the table
structure and fields.

1.  Use SQL Profiler to run traces. You can run a trace on databases,
    tables, columns, stored procedures, etc. to get visibility into what
    conditions are needed for the system to write to the database
    structure in question. This is an incredibly valuable tool.

2.  Logging. Getting access to the logs written for database
    transactions can be crucial for the same reasons as the SQL
    Profiler.

3.  

**How can you apply the lessons that you learned from the story to your
own retail store problem?**
