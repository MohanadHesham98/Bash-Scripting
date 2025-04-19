#!/usr/bin/bash
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

source "$SCRIPT_DIR/DB.sh"    # or . ./create_db.sh (dot works the same)
DB
source "$SCRIPT_DIR/inside_DB.sh"
inside_DB



