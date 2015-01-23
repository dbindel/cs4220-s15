roster.txt: ps4220.xls ps5223.xls ps4260.xls
	touch roster.txt
	cp roster.txt roster-prev.txt
	python roster.py *.xls | sort > roster.txt
	-diff roster-prev.txt roster.txt > changes.txt

adddrop: roster.txt
	@echo "=== Added ==="
	@awk '/>/ { print $$2 }' changes.txt
	@echo "=== Dropped ==="
	@awk '/</ { print $$2 }' changes.txt

.PHONY: emails
emails:
	awk '{ print $$1 "@cornell.edu" }' roster.txt
