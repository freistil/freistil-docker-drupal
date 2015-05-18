#!/bin/bash

/setup/service-setup.sh

exec supervisord -n
