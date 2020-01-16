#/bin/bash

echo "Comparing with live website"

changes_html=$(rsync --delete -rnvc html/ df@df.uber.space:html | head --lines=-3 | tail --lines=+2)
changes_newsletter=$(rsync --delete -rnvc newsletter/ df@df.uber.space:newsletter | head --lines=-3 | tail --lines=+2)

echo
echo "The following files will be changed in the html folder:"
echo "$changes_html"
echo
echo "The following files will be changed in the newsletter folder:"
echo "$changes_newsletter"
echo

read -p "Do you want to override the live website? (type \"Yes\"): "
if [[ $REPLY =~ ^Yes$ ]]; then

    rsync --delete -rvc html/ df@df.uber.space:html
    rsync --delete -rvc newsletter/ df@df.uber.space:newsletter

fi
