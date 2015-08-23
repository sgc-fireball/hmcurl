#!/bin/bash

cd `dirname ${0}`

/bin/rm -f hmcurl.tar.gz
/bin/chmod +x update_script hmcurl.sh
/bin/tar -cvvzf hmcurl.tar.gz \
    update_script \
    hmcurl.sh \
    bin \
    lib \
    VERSION \
    README.md \
    LICENSE

exit $?
