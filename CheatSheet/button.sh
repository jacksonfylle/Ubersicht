#!/usr/bin/env bash

# List files of the a folder
format=$(ls ~/Library/Application\ Support/Notational\ Data/ | sort | xargs -I {} echo "<button id="\"{}\"">{}</button>")
echo $format
