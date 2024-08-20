#/bin/bash

target="html/$1/"

echo "Comparing with live website"

changes=$(rsync --delete -rnvc html/ df@df.uber.space:$target | head --lines=-3 | tail --lines=+2)

echo
echo "The following files will be changed:"
echo "$changes"
echo

read -p "Do you want to override the live website? (type \"Yes\"): "
if [[ $REPLY =~ ^Yes$ ]]; then

    rsync --delete -rvc html/ df@df.uber.space:$target

fi
