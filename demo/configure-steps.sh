#!/usr/bin/env bash

STEPS=${1:?Usage: ./run-step.sh <step_number>}

cd $(dirname $0)
cat $(seq -f "steps/step%g.tf" $STEPS) > selected-steps.tf
