#!/bin/bash

if ! command -v node >/dev/null 2>&1
then
  echo "Error: 'node' could not be found - please install it"
  echo
  exit 1
fi

if ! command -v pnpm >/dev/null 2>&1
then
  echo "Error: 'pnpm' could not be found - please install it: https://pnpm.io/installation"
  echo
  exit 1
fi

if [ -z "${OPENAI_API_KEY}" ]; then
  if [ -f ".env" ]; then
    set -a
    . ./.env
    set +a
  fi
fi

if [ -z "${OPENAI_API_KEY}" ]; then
  echo "Error: 'OPENAI_API_KEY' not found as ENV varible or in a '.env' file"
  echo
  exit 1
fi

pnpm dev
