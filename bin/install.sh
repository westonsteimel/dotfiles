#!/bin/bash
set -e
set -o pipefail

# install.sh
#	This script installs my basic setup

# Choose a user account to use for this installation
get_user() {
	if [ -z "${TARGET_USER-}" ]; then
		mapfile -t options < <(find /home/* -maxdepth 0 -printf "%f\\n" -type d)
		# if there is only one option just use that user
		if [ "${#options[@]}" -eq "1" ]; then
			readonly TARGET_USER="${options[0]}"
			echo "Using user account: ${TARGET_USER}"
			return
		fi

		# iterate through the user options and print them
		PS3='Which user account should be used? '

		select opt in "${options[@]}"; do
			readonly TARGET_USER=$opt
			break
		done
	fi
}

check_is_sudo() {
	if [ "$EUID" -ne 0 ]; then
		echo "Please run as root."
		exit
	fi
}

# install rust
install_rust() {
	sudo curl https://sh.rustup.rs -sSf | sh
}

# install/update golang from source
install_golang() {
	export GO_VERSION
	GO_VERSION=$(curl -sSL "https://golang.org/VERSION?m=text")
	export GO_SRC=/usr/local/go

	# if we are passing the version
	if [[ ! -z "$1" ]]; then
		GO_VERSION=$1
	fi

	# purge old src
	if [[ -d "$GO_SRC" ]]; then
		sudo rm -rf "$GO_SRC"
		sudo rm -rf "$GOPATH"
	fi

	GO_VERSION=${GO_VERSION#go}

	# subshell
	(
	kernel=$(uname -s | tr '[:upper:]' '[:lower:]')
	curl -sSL "https://storage.googleapis.com/golang/go${GO_VERSION}.${kernel}-amd64.tar.gz" | sudo tar -v -C /usr/local -xz
	local user="$USER"
	# rebuild stdlib for faster builds
	sudo chown -R "${user}" /usr/local/go/pkg
	CGO_ENABLED=0 /usr/local/go/bin/go install -a -installsuffix cgo std
	)

	# get commandline tools
#	(
#	set -x
#	set +e
#	go get github.com/golang/lint/golint
#	go get golang.org/x/tools/cmd/cover
#	go get golang.org/x/review/git-codereview
#	go get golang.org/x/tools/cmd/goimports
#	go get golang.org/x/tools/cmd/gorename
#	go get golang.org/x/tools/cmd/guru
#	go get honnef.co/go/tools/cmd/staticcheck
#	)
}

main() {
	local cmd=$1

	#if [[ -z "$cmd" ]]; then
	#	usage
	#	exit 1
	#fi

	if [[ $cmd == "base" ]]; then
		check_is_sudo
		get_user
	elif [[ $cmd == "rust" ]]; then
		install_rust
	elif [[ $cmd == "golang" ]]; then
		install_golang "$2"
	fi
}

main "$@"
