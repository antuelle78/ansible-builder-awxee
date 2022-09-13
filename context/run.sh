#!/bin/bash - 
#===============================================================================
#
#          FILE: run.sh
# 
#         USAGE: ./run.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Michael Nelson (LINUXIEN), hotline@openvoipmq.com
#  ORGANIZATION: TM Social Ministries
#       CREATED: 09/08/2022 13:44:47
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

ansible-runner worker --private-data-dir=/runner
