#!/bin/bash

# Copyright 2010, Tomas Edwardsson 
#
# crit2warn.sh is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# crit2warn.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# crit2warn.sh is a wrapper for Nagios checks that changes the return
# code for checks from CRITICAL to WARNING
CMD=""

# Quote arguments
while (( "$#" > 0 )); do
	ARG=$1
	shift
	CMD="$CMD $(echo "$ARG" | awk '{gsub(".", "\\\\&");print}')"
done

# Run command
eval "$CMD"
ret=$?


# Change return CRITICAL to WARNING
if [ $ret == 2 ]; then
	ret=1
fi

exit $ret

