-   Describe the characteristics and common uses of structured data.
    Provide examples as necessary.

> Structured data is used all over the place. Many standard database
> systems for web applications are relational structured databases.
> Relational databases traditionally are tabular databases with rows,
> columns, and attributes. When I started working with databases, it was
> easiest for me to think of them as a collection of excel spreadsheets.
> An example of a structured database system that I'm working on right
> now is a claims system. A claimant table might have columns for
> "first_name", "last_name", "social_security_number", and a
> "claimant_id". Other tables that *relate* to the claimant table (like
> a claim table), might have a *foreign key* to the claimant table to
> show that the claim record is tied to a particular claimant.

-   Describe the characteristics of unstructured data (e.g., big data)
    and where these data elements may be found. Provide examples as
    necessary.

> AWS says that unstructured data is typically more difficult to
> analyze. Unstructured data falls into formats that aren't as
> standardized. Some examples would be text files, emails, images, audio
> files, video files, etc. A lot of times, pointers to unstructured data
> can be stored within a structured database. Using the same example
> from the structured data section, a claimant might have a "photo_url"
> column within a structured database. This is a pointer to an
> unstructured data format that can be accessed within an application.

-   Discuss the common business analysis role and the types of data that
    may be used. Provide examples as necessary.

> Business analysis is looking at functions and processes used in a
> company and creating technological solutions to optimize these
> functions and processes. A lot of times this requires some level of
> business analytics, which is analysis of data and reporting within a
> business. For a business that is not technologically integrated yet,
> much of the data used would be unstructured data, or physical
> documents. For a business that is already somewhat modernized with
> technological solutions, it could be a combination of structured,
> unstructured, and physical data. It depends on the business and the
> domain within the business that the analyst is researching.

-   Discuss the use of analytics and the types of data that may be used.
    Provide examples as necessary.

> The data types used in analytics range from structured, to
> semi-structured (json, xml), to unstructured. For example, the output
> of a lot of reporting services is excel spreadsheets or PDFs. These
> are examples of unstructured data that may be analyzed for
> optimization of business processes. However, these unstructured data
> types typically have a structured data source used to generate these
> documents, so analytics may be conducted on the source rather than the
> output. It depends on the business analyst's approach in this
> scenario.
>
> References
>
> AWS. (n.d.). What is Structured Data? - Structured Data Explained -
> AWS. Amazon Web Services, Inc.
> https://aws.amazon.com/what-is/structured-data/
>
> AltexSoft Inc. (2023, November 1). Unstructured Data: Examples, Tools,
> Techniques, and Best Practices. Medium.
> <https://altexsoft.medium.com/unstructured-data-examples-tools-techniques-and-best-practices-c0fefa57f741#:~:text=Unstructured%20data%20storage%201%20Scalability.%20Unstructured%20data%20has>
>
> Terra, J. (2020, May 5). What is a Business Analysis and What does
> Business Analyst Do. Simplilearn.com.
> https://www.simplilearn.com/what-is-a-business-analyst-article
>
> ‌
