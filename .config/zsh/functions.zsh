# Function definitions for zsh
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
#
# 2018.1.7
#   * Created functions.zsh
# ------------------------------------------------------------------------------------
# This makes a function that if there is a job lauch it
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER='fg'
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}

zle -N fancy-ctrl-z         # Bind the job with zsh
bindkey '^z' fancy-ctrl-z   # use ctrl-z to run it, great for use w/ vim

# Easy attach to a docker container. Useful for debugging docker builds
dockerattach () {
	container_id=$(docker ps | grep ${1} | awk '{print $1}')
	if [[ $(echo "${container_id}" | wc -w) -ne "1" ]]; then
		echo "Could not narrow down container as specified"
		return 1
	fi

	docker exec -i -t "${container_id}" /bin/bash
	return 0
}
