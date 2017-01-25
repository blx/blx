#!/bin/sh

# The error is like so:
#
# django.core.exceptions.ImproperlyConfigured: Error loading MySQLdb module: dlopen(/Users/ben/projects/dispatch/env/lib/python2.7/site-packages/_mysql.so, 2): Library not loaded: libmysqlclient.18.dylib
#   Referenced from: /Users/ben/projects/dispatch/env/lib/python2.7/site-packages/_mysql.so
#   Reason: image not found

dotso='.env/lib/python2.7/site-packages/_mysql.so'

install_name_tool -change libmysqlclient.18.dylib /usr/local/mysql/lib/libmysqlclient.18.dylib $dotso
