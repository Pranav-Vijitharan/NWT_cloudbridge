### Context about company North Wind Traders (NWT).

1. NWT is an export import company who trades speciality foods around the world.

2. Current architecture is a mix of on-premise & legacy systems, including their MySQL database which is primary an operational database.

3. This is where all the sales transactions are recorded between company and its customers.

4. This MySQL database is used to generate & build analytical reports (See below).

5. NWT have hired you and a team of DataOps professionals, to modernise their data & reporting solutions and to move away from on-premise, monolith databases using agile methodology


### NWT’s pain points
1. Every time there is a large analytics query in the queue, it impacts the transaction systems’ processing speed.

2. NWT struggles to keep up with analytical reporting requirements, as the database slow down impacting their day to day business. NWT have tried to solve this problem using
the existing infrastructure, but have failed to make any significant improvements in reducing latency.


### NWT management goals, reasons for moving away from on-premise MySQL databases.
The aim is to modernize their data and reporting solution and to phase out their on-premise solution to a cloud-based solution slowly. With as little impact to their day to day operations as possible. NWT wants to modernise their existing infrastructure for the following reasons.

1. Better scalability. NWT is currently limited by their on-prem, aging infrastructure (hardware).

2. Reduce load on operational systems. Currently, the reporting system uses Online Transactional Processing or OLTP systems for reporting, and NWT would like to reduce load on their operational systems.

3. Improved reporting speed. Existing reporting systems are very slow at producing reports, which creates delays in day to day reporting.

4. Improved data security. NWT wants to have better access control over data and who can access what reports. Year 2023/24 Page 4 of 11


### How we plan to modernize NWT’s current systems

Your DataOps team along with the product owner, having understood NWT’s business context and why they want to modernize their platform, have come up with a high-level suggestion on how your team may improve their current system. Your suggestion is to migrate NWT’s existing solutions to a fully managed cloud-based data warehouse platform called Snowflake.

1. During this migration, NWT will need your team’s help with setting up an Online Analytical Processing (OLAP) system in Snowflake. Which will support all postmigration reporting requirements.

2. Your team would migrate all existing MySQL databases on-premise to Snowflake for reporting solutions.

3. SnowSQL was selected to run OLAP, and your team would build a data warehouse on Snowflake using SnowSQL, so SnowSQL will become your main OLAP solution replacing the legacy OLTP transactional system.
