#!/bin/bash
set -e
if [ "$WORKER" == true ]; then
  RAILS_ENV=$RAILS_ENV bundle exec sidekiq -C config/sidekiq.yml
else
  rm -f tmp/pids/server.pid
  rails server -b 0.0.0.0
fi