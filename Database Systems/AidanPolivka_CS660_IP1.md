Database System Overview

Aidan Polivka

CS660 -- Database Systems

Colorado Technical University

Dr. John Conklin

March 24, 2024

# Table of Contents {#table-of-contents .TOC-Heading}

[Database System Overview (Week 1)
[4](#database-system-overview-week-1)](#database-system-overview-week-1)

[Business Environment [4](#business-environment)](#business-environment)

[Database Goals and Objectives
[6](#database-goals-and-objectives)](#database-goals-and-objectives)

[How the proposed database system addresses business problem(s)
[7](#how-the-proposed-database-system-addresses-business-problems)](#how-the-proposed-database-system-addresses-business-problems)

[Mission and Goals Alignment
[7](#mission-and-goals-alignment)](#mission-and-goals-alignment)

[Analysis of how the project fulfills the mission/goals of the target
organization.
[8](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization.)](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization.)

[Entity Relationship Model (Week 2)
[10](#entity-relationship-model-week-2)](#entity-relationship-model-week-2)

[Subjects of Interests
[10](#subjects-of-interests)](#subjects-of-interests)

[Business Rules [10](#business-rules)](#business-rules)

[Entity Relationship (ER) Diagram
[10](#entity-relationship-er-diagram)](#entity-relationship-er-diagram)

[Table of Entities, Attributes (with data types), Relationships, and
Cardinality Constraints
[10](#table-of-entities-attributes-with-data-types-relationships-and-cardinality-constraints)](#table-of-entities-attributes-with-data-types-relationships-and-cardinality-constraints)

[Analysis of how the project fulfills the mission/goals of the target
organization.
[10](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization.-1)](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization.-1)

[Structured Query Language Scripts (Week 3)
[11](#structured-query-language-scripts-week-3)](#structured-query-language-scripts-week-3)

[DDL [11](#ddl)](#ddl)

[DML [11](#dml)](#dml)

[Reporting [11](#reporting)](#reporting)

[Analysis of how the project fulfills the mission/goals of the target
organization.
[11](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization.-2)](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization.-2)

[Database Administration Plan (Week 4)
[12](#database-administration-plan-week-4)](#database-administration-plan-week-4)

[Transaction Management Plan
[12](#transaction-management-plan)](#transaction-management-plan)

[Database Security procedure
[12](#database-security-procedure)](#database-security-procedure)

[Backup Plan and Recovery Procedure
[12](#backup-plan-and-recovery-procedure)](#backup-plan-and-recovery-procedure)

[Analysis of how the project fulfills the mission/goals of the target
organization
[12](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization)](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization)

[Future Database System Implementation Plan (Week 5)
[13](#future-database-system-implementation-plan-week-5)](#future-database-system-implementation-plan-week-5)

[Database Differences
[13](#database-differences)](#database-differences)

[Changes needed to build a data warehouse/data mart.
[13](#changes-needed-to-build-a-data-warehousedata-mart.)](#changes-needed-to-build-a-data-warehousedata-mart.)

[Distributed Database Considerations
[13](#distributed-database-considerations)](#distributed-database-considerations)

[Business Intelligence
[13](#business-intelligence)](#business-intelligence)

[Data Warehouse Benefits
[13](#data-warehouse-benefits)](#data-warehouse-benefits)

[Return on Investment
[13](#return-on-investment)](#return-on-investment)

[Competitive Advantage
[14](#competitive-advantage)](#competitive-advantage)

[Increased Productivity
[14](#increased-productivity)](#increased-productivity)

[Data Warehouse Problems
[14](#data-warehouse-problems)](#data-warehouse-problems)

[Analysis of how the project fulfills the mission/goals of the target
organization
[14](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization-1)](#analysis-of-how-the-project-fulfills-the-missiongoals-of-the-target-organization-1)

[References [14](#references)](#references)

# Database System Overview (Week 1)

The purpose of this assignment is to create a course of action to
develop and implement a purposeful database management system for a
fictional company of our choice. Throughout my time at Colorado
Technical University, I've developed a fictional bookstore called
Heartland Escapes. Previous projects include a migration plan from an
on-premises system to an Azure Cloud environment, a system networking
plan for cloud computing, and a system security management and
maintenance plan. I think it\'s only natural to continue working with
this fictional store here and develop a purposeful data environment for
this business as well.

As stated previously, Heartland Escapes is a bookstore in Lincoln
Nebraska with two locations. They have seen recent growth and consumer
interest due to their growing presence in social media. Their business
model is heavily centered around hosting events at their stores,
including author meet and greets, summer reading programs,
holiday-oriented events (like scary story readings on Halloween, Santa
reads Christmas stories), and many others. Because of their marketing of
these events, they've received a lot of local publicity and foot traffic
in store. With the growth they've seen over the past year, Heartland
Escapes would like to expand to two neighboring cities in Nebraska with
a new location in Omaha Nebraska, and a new location in Beatrice
Nebraska. To perform this feat, they have the desire to upgrade their
existing technology to better support their employees and customers,
which includes and improvement to their existing database management
system and the development of an e-commerce marketplace.

## Business Environment 

Heartland Escapes started out as a form of community necessity. The
public libraries were well stocked with books but lacked in providing
young people with the spark to enjoy reading. The owners of the company
are avid book readers themselves and have always enjoyed sharing their
literary journeys with other like-minded individuals. Heartland Escapes
mission is to be a shared "Escape" for others to enjoy captivating
stories and their love for books with each other. The first store opened
in 2010, and it was a slow start to get people in the door with
competing companies like Barnes and Noble around. As people began seeing
the benefits of community-oriented storytelling, traction accrued to the
point that Heartland Escapes had the financial stability to open a
second store in 2017. The first year of the pandemic was difficult for
the company, but after the guidelines loosened and the public started
feeling more comfortable leaving their homes, business caught its stride
once again. Since then, Heartland Escapes has seen nothing but growth
and enthusiastic customers.

Both stores are equipped with 12 staff, 2 assistant managers, one
manager, and one of the owners acts as a general manager of both
locations. The other original owner is responsible for human resources
and supports the GM with day-to-day operations. There are two additional
stakeholders that fit the roles of chief financial officer and chief
information officer.

When Heartland Escapes started their journey, they developed their own
point-of-sale system and inventory management API. Married to these
systems are the Accounting Database and the Inventory Database.
Additionally, they have a public facing website that users can search
store inventory with and see store hours and event schedules. These
home-grown systems are all still being used to this day. As their store
has risen in popularity, Heartland Escapes junior and senior staff have
all began to feel growing pains. These pains include:

1.  Customer Management

2.  Inventory Control

3.  System Documentation

4.  Lack of Online Capabilities

5.  Lack of Events Management

As stated previously, Heartland Escapes has the desire to offer
e-commerce services to their customers, which will require customer data
storage and management along with more robust inventory controls. In
previous meetings with Heartland Escapes senior management, they've
expressed the desire to offer subscription boxes to interested customers
that contain Heartland Escapes books and merchandise. Additionally, the
pandemic made stakeholders incredibly nervous. Foot traffic through the
store is the main avenue through which Heartland Escapes makes its
revenue. If customers had the ability to order books online, that may
have lessened the financial impact of the pandemic on their stores.

Advancement in inventory controls would allow for optimal stock of
products and automated re-stocking of books. With the impending
expansion of their business, these functions will be crucial to maintain
between all four stores. The original in-house software and database
systems are not well documented, which makes maintenance and upgrades
difficult to perform.

Because their business model is very event based, Heartland Escapes
desires the ability to post events more easily on their website. As it
is now, customers need to subscribe to Heartland Escapes social media
channels to stay up to date with up-coming events. Although posts to
their social media profiles will continue, having a central place to see
all event schedules for each store would be incredibly helpful to their
customers when Heartland Escapes opens their two new locations.

## Database Goals and Objectives

A Database Management System's purpose is to support and serve the
applications through which Heartland Escapes users interact. This is
inclusive between all applications and individuals, administrators,
customers, and staff. Our database goals for Heartland Escapes are to
support their expansion interests in the best way we can. With this in
mind, here is our list of objectives as database administrators:

1.  Support an enhanced customer management system.

2.  Support for subscription-based product management.

3.  Support a flexible event management system.

4.  Improve and automate replenishment and ordering processes.

5.  Protect customer data using regulations provided by the Payment Card
    Industry Data Security Standard.

6.  Architect our databases in such a way that they support scaling and
    growth.

7.  Utilize industry data security standards using role-based access
    controls.

8.  Facilitate data loss prevention through use of regular backup
    schedules and data replication processes.

## How the proposed database system addresses business problem(s)

Heartland Escapes is seeing unprecedented growth in their business and
feels that the best way to capitalize on this growth is to expand both
physically, and technologically. With this expansion effort, they've
verbalized their desire to support customer management, customer online
sales, subscription-based products, smart and automated inventory
management, and store-to-store event management. They've also expressed
that their current inventory management system is lack-luster and fails
to accommodate any of these features. Our database goals explicitly
state the desire to support these efforts requested by Heartland Escapes
stakeholders.

## Mission and Goals Alignment

Heartland Escapes' primary mission is to provide their communities with
a space for individuals to fall in love with reading. Within this larger
mission statement lies many objectives and opportunities to better
achieve this goal. In the eyes of Heartland Escapes stakeholders, the
current optimal course of action is to provide a central area that
customers can receive information about upcoming events, offer
consistent availability of books to customers, allow for customers to
order books from the comfort of their own homes, and build customer
engagement by offering subscription-based products. Our goals as
database administrators are derived from the goals of Heartland Escapes,
with our primary goal being to support Heartland Escapes in their
current endeavor.

## Analysis of how the project fulfills the mission/goals of the target organization.

In the Problem Based Learning scenario, the example company is looking
to:

1.  improve customer satisfaction by allowing them to order business
    products online.

2.  Reduce employee turnover rate by improving system efficiency and
    useability (therefore also reducing customer complaints).

3.  Take advantage of back-office system operation automation.

4.  Improve back-office systems across the board.

I believe that the narrative I've written for the fictional Heartland
Escapes business fully emulates the same (if not similar) concerns as
the Problem Based Learning scenario. I also believe that the goals I've
outlined for Heartland Escapes, and the goals I've expressed for the
database administration team are in sync with one another. Later
sections of this assessment will further explain how these goals will be
achieved for Heartland Escapes.

# Entity Relationship Model (Week 2)

## Subjects of Interests

## Business Rules

## Entity Relationship (ER) Diagram

## Table of Entities, Attributes (with data types), Relationships, and Cardinality Constraints

## Analysis of how the project fulfills the mission/goals of the target organization.

# Structured Query Language Scripts (Week 3)

## DDL

## DML

## Reporting

## Analysis of how the project fulfills the mission/goals of the target organization.

# Database Administration Plan (Week 4)

## Transaction Management Plan

## 

## Database Security procedure

## Backup Plan and Recovery Procedure

## Analysis of how the project fulfills the mission/goals of the target organization

# Future Database System Implementation Plan (Week 5)

## Database Differences

## Changes needed to build a data warehouse/data mart.

## Distributed Database Considerations

## Business Intelligence 

## Data Warehouse Benefits

### Return on Investment

### Competitive Advantage

### Increased Productivity

## 

## Data Warehouse Problems

## 

## Analysis of how the project fulfills the mission/goals of the target organization

# References

AKHtar, A. N., Buchholtz, J., Ryan, M., & Setty, K. (n.d.). Database
Backup and Recovery Best Practices.
https://www.isaca.org/Journal/archives/2012/Volume-1/Pages/Database-Backup-and-Recovery-Best-Practices.aspx.

desktopclass.com (2017, January 4). Explain the different objectives of
the databases.
https://www.desktopclass.com/computer-it/explain-different-objectives-of-the-databases.html.

Gitman, L. J., McDaniel, C., Shah, A., Reece, M., Koffel, L., Talsma,
B., & Hyatt, J. C. (2018, September 18). Introduction to Business.
<https://opentextbc.ca/businessopenstax/chapter/understanding-the-business-environment/>.

Muskanbansal98. (2019, March 12). Difference between RDBMS and OODBMS.
https://www.geeksforgeeks.org/difference-between-rdbms-and-oodbms/.

Obermeier, A. (n.d.). 8 Key Considerations When Choosing a DBMS.
https://blog.paessler.com/key-considerations-when-choosing-a-dbms.
