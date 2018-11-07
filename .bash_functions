# checkout to a ticket numbered branch
function git_checkout_ticket_number {
	branch=`git branch | grep $1`

	stringarray=($branch)
	stringarraylength=${#stringarray[@]}

	if [[ $stringarraylength -lt 1 ]]; then
		echo "A branch with that ticket number could not be found, sozzzzzz"
	elif [[ $stringarraylength -gt 1 ]]; then
		echo "Your query returned too many results, sozzzzzzzzzzzzzzzzzzzzz"
	else
		git checkout $branch
	fi
}