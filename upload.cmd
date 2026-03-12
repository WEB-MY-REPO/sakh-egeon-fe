@echo off
start /B /wait build.cmd
echo BUILD DONE! UPLOADING...

"C:\Program Files (x86)\WinSCP\WinSCP.com" /ini=nul /script=uploadscript.cmd /parameter sakhegeony_1 dsI43_xHsycnbsQxdfPl
echo Upload completed
