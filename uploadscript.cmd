option batch abort
option confirm off
open ftp://%1%:%2%@77.222.40.84/
cd public_html
rm *
lcd dist
put *
exit
