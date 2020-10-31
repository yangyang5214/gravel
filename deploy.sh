#!/bin/bash

git pull
npm install
npm run build
scp -r public/* beer:/home/ubuntu/beef/
