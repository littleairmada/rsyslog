#!/bin/bash
# This file is part of the rsyslog project, released under GPLv3
echo ===============================================================================
echo \[failover-rptd.sh\]: rptd test for failover functionality
. $srcdir/diag.sh init
. $srcdir/diag.sh startup-vg failover-rptd.conf
. $srcdir/diag.sh injectmsg  0 5000
echo doing shutdown
. $srcdir/diag.sh shutdown-when-empty
echo wait on shutdown
. $srcdir/diag.sh wait-shutdown-vg
. $srcdir/diag.sh check-exit-vg
. $srcdir/diag.sh seq-check  0 4999
. $srcdir/diag.sh exit
