#!/bin/bash

# Exit on error
set -e

# Change to the correct deployment directory
cd /home/ec2-user/acebook

# Start server
npm start > /dev/null 2> /dev/null < /dev/null &