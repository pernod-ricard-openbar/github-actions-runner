#!/bin/bash

# Configuration
./actions-runner/config.sh \
	--url "${URL}" \
	--token "${TOKEN}" \
	--name "${NAME}" \
	--runnergroup "${GROUP}" \
	--labels "${LABELS}" \
	--unattended \
	--replace

# Running the runner
./actions-runner/run.sh