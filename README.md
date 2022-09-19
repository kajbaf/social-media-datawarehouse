# Analyzing User Activities on Social Networks

This code-base defines the data pipeline and creates tables for user activities on social networks and generates required reports.

## Problem

The problem statement and the solution have been described in the [Project Definition](./notebooks/ProjectDefinition.md).

## Solution

This [notebook](./notebooks/ETL_script.ipynb) contains the final solution and discusses the assumptions.

The final report is accessible [here](notebooks/data/user_report.csv/part-00000-57d03ec7-8c8a-4870-86c6-fcb7dc867262-c000.csv).

## Project Structure

### Spark Services

I have used the bitnami compact images to create master and worker spark nodes [here](docker-compose.yml).

## How to use the repository

This code base assumes a container management tool (e.g. Rancher Desktop) has been installed and set up to manage spark containers, [poetry](https://python-poetry.org/docs/#installation) is installed to manage Python requirements, and (optionally) GNU [make](https://www.gnu.org/software/make/) is available to facilitate executing commands.

If the `make` tool is not available (like on a Windows machine), the [Makefile](./Makefile) works as a reference for how to use the environment.

## Environment Setup

* `make install`

Creates a virtual environment and installs requirements.


* `make start`
* `make stop`
* `make restart`

Manage Spark containers as background services.
The below Spark ports are exposed to the operating system:

    - 8080: Spark web UI
    - 7077: master service port
* `make run`

Runs the Jupyter notebook which can be used to execute the Jupyter script and analyze the data.
