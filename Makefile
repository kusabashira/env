.PHONY: all update dry-run
all:

update:
	itamae local roles/local.rb

dry-run:
	itamae local --dry-run roles/local.rb
