#!/bin/sh

readonly LOG=/var/lib/diun/notifications.log

echo "Image:    $DIUN_ENTRY_IMAGE"    >> $LOG
echo "Platform: $DIUN_ENTRY_PLATFORM" >> $LOG
echo "Link:     $DIUN_ENTRY_HUBLINK"  >> $LOG
echo "Status:   $DIUN_ENTRY_STATUS"   >> $LOG
echo "Created:  $DIUN_ENTRY_CREATED"  >> $LOG
echo "Digest:   $DIUN_ENTRY_DIGEST"   >> $LOG
# echo "MIME:     $DIUN_ENTRY_MIMETYPE" >> $LOG
# echo                                  >> $LOG
# echo "Host:     $DIUN_HOSTNAME"       >> $LOG
# echo "Diun:     $DIUN_VERSION"        >> $LOG
# echo "DB:       $DIUN_DB_PATH"        >> $LOG
# echo "Provider: $DIUN_ENTRY_PROVIDER" >> $LOG
echo "------------------------------" >> $LOG
