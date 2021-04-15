# @Author: Jhin
# @Date:   2021-04-15 19:33:30
# @Last Modified by:   Jhin
# @Last Modified time: 2021-04-15 19:41:42
#!/bin/bash
slave_is=(( mysql -uroot -p1234 -e "show slave status\G" | grep "Slave_.*_Running:" | awk '{print2}') )
if [ "{slave_is[0]}" = "Yes" -a "{slave_is[1]}" = "Yes" ];then
    exit 0
else
    exit 1
fi