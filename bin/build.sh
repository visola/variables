#!/bin/bash
set -ex

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$SCRIPT_DIR/clean.sh
$SCRIPT_DIR/updateDependencies.sh
$SCRIPT_DIR/test.sh
