#!/bin/bash
printf "Checking for updated image...\n"
docker pull dcferreira/nta-meta-analysis-verification
printf "\n\n--------------------------------\nResults of paper verifier:\n"
docker run --mount type=bind,source=$1,target=/paper dcferreira/nta-meta-analysis-verification /paper
