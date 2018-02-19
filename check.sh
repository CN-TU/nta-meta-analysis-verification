#!/bin/bash
docker pull dcferreira/nta-meta-analysis-verification
docker run --mount type=bind,source=$1,target=/paper dcferreira/nta-meta-analysis-verification /paper
