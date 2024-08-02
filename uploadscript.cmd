open sftp://%1%:%2%@sakh-egeon.ru/ -hostkey="ssh-rsa 3072 a3Oh/Qe3eIeyIbRbZKj9Z3o+HmTbsR0Ln7XMZiDzoZw"
cd /home/%1%/sakh-egeon-be/public
call rm -rf * 2>/dev/null || :
put public.7z
call 7z x public.7z -y
call rm -f public.7z
cd ~
call ./stop.sh
exit