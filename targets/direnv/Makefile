
## initialize direnv vars and allow direnv on directory
direnv: direnv/vars
	-[ -f .envrc ] && direnv allow

## initialize direnv vars from example if example exists
direnv/vars:
	-[ -f .vars.example ] && cp .vars.example .vars
