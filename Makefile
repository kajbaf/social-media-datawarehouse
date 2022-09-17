start:
	docker compose up -d

restart:
	docker compose restart

stop:
	docker compose down

fullstop:
	docker compose down -v
