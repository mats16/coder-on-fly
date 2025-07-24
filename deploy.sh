#!/bin/bash

set -e

FLY_APP_NAME=$1

cp -r ~/.azure/* .azure/

fly deploy --ha=false --app $FLY_APP_NAME
