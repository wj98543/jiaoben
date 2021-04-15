# @Author: Jhin
# @Date:   2021-04-15 19:43:36
# @Last Modified by:   Jhin
# @Last Modified time: 2021-04-15 19:43:42
#!/bin/bash
SRC='/data/www'
DEST='rsyncuser@rsync服务器IP::backup'
rpm -q rsync &>/dev/null || yum -y install rsync
inotifywait -mrq --exclude=".*\.swp" --timefmt '%Y-%m-%d %H:%M:%S' --format '%T %w %f' -e create,delete,moved_to,close_write,attrib {SRC} | while read DATE TIME DIR FILE; do
    FILEPATH={DIR}{FILE}
    rsync -az --delete --password-file=/etc/rsync.passSRC DEST && echo "At{TIME} on {DATE}, fileFILEPATH was backuped up via rsync" >>/var/log/changelist.log
done
