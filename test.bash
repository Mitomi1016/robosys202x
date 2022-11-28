#!/bin/bash -xv
# SPDX-FileCopyrightText: 2022 Mitomi1016
# SPDX-License-Identifier: BSD-3-Clause
# SPDX-

ng () {
	echo NG at LINE $1	
	res=1
}

res=0

### I/O TEST ###
out=$(seq 5 | ./plus)
[ "${out}" = 15.0 ]  || ng ${LINENO}

### STRANGE INPUT ###
out=$(echo あ | ./plus)
[ "$?" = 1 ] 	  || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

out=$(echo | ./plus)
[ "$?" = 1 ]      || ng ${LINENO}
[ "${out}" = "" ] || ng ${LINENO}

[ "$res" = 0 ] && echo OK
exit $res
