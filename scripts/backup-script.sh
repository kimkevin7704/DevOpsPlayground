#!/bin/bash

# Author: Kevin Kim
# Date Created: 10/12/2022
# Last Modified: 10/12/2022

# Description
# backs up files in DevOpsPlayground directory in a .tar archive

# Usage
# backup-script.sh

tar -cvf ./my_backup_"$(date +%d-%m-%Y_%H-%M-%S)".tar ./* 2>/dev/null
