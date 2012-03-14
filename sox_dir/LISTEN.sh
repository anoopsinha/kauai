#!/bin/bash

./rec -c 1 test.flac silence -l 0 1 00:00:02 1%

echo "submitting test.flac"

RESULT=`curl -H "Content-Type: audio/x-flac; rate=16000" "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=chromium&lang=en-US" -F "myfile=@test.flac" -k`


UTTERANCE=$(echo $RESULT | grep -Po '"utterance":.*?[^\\]",')

echo $UTTERANCE

say $UTTERANCE