
function has_command() {
	which "$1" >/dev/null 2>/dev/null || return 1
	return 0
}

function require_command() {
	while [ -n "$1" ]
	do
		has_command "$1" || die "Missing required command: $1"
		shift
	done
}