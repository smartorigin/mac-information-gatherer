--mail info
set mailSubject to "Harware and software information"
set recipientName to ""
set recipientEmail to ""

-- hardware info -> system_profiler SPHardwareDataType
set hardwareInfo to do shell script "system_profiler SPHardwareDataType"
-- software info -> system_profiler SPSoftwareDataType
set softwareInfo to do shell script "system_profiler SPSoftwareDataType"
-- network interface info -> networksetup -listallhardwareports
set networkInfo to do shell script "networksetup -listallhardwareports"
--sender account info -> whoami
set senderInfo to do shell script "whoami"
-- apple id info -> defaults read MobileMeAccounts Accounts | grep AccountID
set appleIdInfo to do shell script "defaults read MobileMeAccounts Accounts | grep AccountID"
--account on the machine info -> dscacheutil -q user | grep -A 3 -B 2 -e uid:\ 5'[0-9][0-9]'
set accountsInfo to do shell script "dscacheutil -q user | grep -A 3 -B 2 -e uid:\\ 5'[0-9][0-9]'"

set header to "Machine information
"
set hInfoHeader to "
#1. Hardware information :
"
set sInfoHeader to "

#2. Software information :
"

set netInfoHeader to "

#3. Netowrk information :"

set aIdHeader to "

#4. Apple Id of the sender information :
"

set senderInfoHeader to "

#5. Account of the sender :
"

set accInfoHeader to "

#6. Accounts on the machine :
"

set msg to header & hInfoHeader & hardwareInfo & sInfoHeader & softwareInfo & netInfoHeader & networkInfo & aIdHeader & appleIdInfo & senderInfoHeader & senderInfo & accInfoHeader & accountsInfo


tell application "Mail"
	set email to make new outgoing message with properties {visible:true, subject:mailSubject, content:msg}
	tell email
		make new to recipient at end of to recipients with properties {name:recipientName, address:recipientEmail}
	end tell
end tell