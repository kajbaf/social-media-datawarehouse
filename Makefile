start:
	docker compose up -d

restart:
	docker compose restart

stop:
	docker compose down

fullstop:
	docker compose down -v

install:
	poetry install

run:
	poetry run jupyter notebook  --no-browser
