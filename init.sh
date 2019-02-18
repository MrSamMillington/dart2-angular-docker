#!bin/bash

echo "RUNNING DART 2 APPLICATION IN DEV MODE!"

pub get

$HOME/.pub-cache/bin/webdev serve
