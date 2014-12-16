#!/bin/bash

echo "====> Beginning deployment"

cd ./mysql
./deploy.sh
cd ../website
./deploy.sh
cd ../blog
./deploy.sh

echo "====> End of deployment"
