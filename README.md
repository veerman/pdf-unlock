# PDF-Unlock
A simple Windows batch file which uses [Ghostscript](http://www.ghostscript.com/) to unlock/unencrypt a pdf file.

## Author
[Steve Veerman](http://steve.veerman.ca/)

## Instructions
* Download [Postscript and PDF interpreter/renderer](http://ghostscript.com/download/gsdnld.html) (64 bit version preferred)
* Run pdf_unlock.bat
* Enter full path to pdf file eg. C:\Users\You\Desktop\locked.pdf
* Done

## Notes
* For x86 (32 bit), you will need to comment/uncomment x86/x64 blocks and change set gs_path to point to x86

## Inspiration
* [This Reddit comment](https://www.reddit.com/r/sysadmin/comments/1vyby5/any_way_to_recoverremove_password_from_pdf/cewyp3g)