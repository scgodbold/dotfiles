# Function definitions for zsh
#
# Author: Scott Godbold
# Last Updated: January 7, 2018
#
# Changelog:
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

# Easy create a tmp interactive container that is detached
dockersandbox () {
    image="${1}"
    name="${2}"

    if [[ -z ${image} ]]; then
        echo "Must specify an image to launch"
        echo
        echo "Usage: dockerstart IMAGE [name]"
        return 1
    fi

    if [[ -z ${name} ]]; then
        cid=$(docker run -itd --entrypoint /bin/bash ${image})
        if [[ "${?}" -ne 0 ]]; then
            echo
            echo "Failed to create sandbox"
            echo "\tImage: ${image}"
            return 1
        fi
    else
        cid=$(docker run -itd --entrypoint /bin/bash --name ${name} ${image})
        if [[ "${?}" -ne 0 ]]; then
            echo
            echo "Failed to create sandbox"
            echo "\tName: ${name}"
            echo "\tImage: ${image}"
            return 1
        fi
    fi
    container_name=$(docker inspect --format='{{.Name}}' ${cid} | sed 's|/||g')
    echo "Sandbox created: ${container_name}"
    return 0
}

projectjump () {
    local PARAMS=""
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -d|--debug)
                set -x
                DEBUG=true
                shift
                ;;
            -b|--base-dir)
                local BASEDIR="${2}"
                shift 2
                ;;
            -*|--*)  # Quit if bad args passed in
                echo "Unknown option provided: $1"
                exit 1
                ;;
            --) # End arg parsing
                shift
                break
                ;;
            *)  # Handle postional args
                local PARAMS="$PARAMS $1"
                shift
                ;;
        esac
    done
    eval set -- "$PARAMS"


    if [ -z $BASEDIR ]; then
        # Set basedir to home if not specified
        local BASEDIR="${HOME}"
    fi

    local target_dir="${1}"
    if [ -z ${1} ]; then
        echo "Must specify a directory to jump to"
    fi

    cd ${BASEDIR}/${target_dir}
}
