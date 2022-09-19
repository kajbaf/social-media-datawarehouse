

# Start Spark services (master and worker nodes) in background
start:
	docker compose up -d

# restarts master and worker Spark services
restart:
	docker compose restart

# Stop both master and worker Spark services
stop:
	docker compose down

# Stop Spark services and clean allocated volumes
fullstop:
	docker compose down -v

# Create virtual environment and install Python dependencies
install:
	poetry install

# Run Jupyter Notebook
run:
	cd notebooks; poetry run jupyter notebook  --no-browser
