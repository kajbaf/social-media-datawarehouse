# Problem Statement

Implement proof of concept of a data warehousing environment for performing ETL operations and enabling data analysis queries.

**Problem:** we have a series of events from systems that interact with customers' social media pages. We want to:
1. Store these events in a data warehouse in a robust and high-performance manner
2. Be able to filter data based on the `event-date` and `etl-date` values. In this scenario, we want to filter the data in the last 3 months.
3. Be able to implement analytical views and run queries easily.

## Inputs and Assumptions
We have several data streams that we want to process and load into the data warehouse.

There are 3 sets of sample data that we want to ingest into our data warehouse.
1. [events](./data/events.csv) - which includes user behaviors regarding the suggestion system
2. [payments](./data/payments_data.csv) - which includes payment transactions
3. [posts](./data/posts.csv) - which includes metadata for posts that users have made

Assuming we would have 3M users generating an average of 300 events annually with a size of 500 bytes and a maximum bucket file of 10GB if no partitioning key is present, we define a bucket size of 45 based on `user_id`.
In real-world scenarios, the `event_date` field is a de-facto candidate for partitioning data, and additional keys can be defined based on the table data.

    3M * 300 * 500 / 10B = 45

## PySpark Notebook

This [ETL_script notebook](ETL_script.ipynb) contains the solution code and discusses the futher assumptions.

The notebook performs 3 sets of actions:
- Reads the sample data and stores them in internal tables with proper bucketing and partitioning strategies
- Runs aggregation queries required for each table and creates temporary views
- Merges final data and exports the final report.

## Per-table Analytics

**Payment Data**

* Total revenue received per user

**Post Data**

Calculating metrics to compare the interest of each user to different social networks.

* Aggregation of posts per user
* Aggregation of posts per user per platform.

**Event Data**

Calculating metrics to understand how each user relies on the AI Recommendation Engine.
* Hashtag suggestions
* Datetime suggestions

## Results
The final report in a flat format is accessible [here](./data/user_report.csv/part-00000-57d03ec7-8c8a-4870-86c6-fcb7dc867262-c000.csv).
