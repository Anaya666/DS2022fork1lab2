#!/bin/bash
clear
echo "Let's build a mad-lib!"
read -p "1. Name an unusual sport: " NOUN1
read -p "2. Name the largest word you know: " NOUN2
read -p "3. Name an adjective that starts with p: " ADJ3
read -p "4. Name your favourite festival: " NOUN4
read -p "5. Name your favourite Professor's last name: " NOUN5
read -p "6. Name your favourite food: " NOUN6
read -p "7. Name a happy song: " NOUN7
read -p "8. Name an interesting restaurant: " NOUN8

echo "Once upon a time during $NOUN4, Professor $NOUN5"
echo "ate $NOUN6 and said it was $NOUN2 and $ADJ3."
echo "This experience made him discover that $NOUN8 was"
echo "his favourite restaurant. As he drove to play $NOUN1,"
echo "he listened to the song $NOUN7."

