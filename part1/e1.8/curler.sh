#!/bin/sh

# was
# echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website;

echo "Searching..";
sleep 1;
curl http://$1;