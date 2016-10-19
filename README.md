#Mac Information Gatherer

##Project Info

This project is an applescript for system administrator. It's mean't to automate hardware and software information retrieval on a Mac. The script collects the information and open an outgoing mail window (mail.app) with all the collected information. The script could be bundle as a (.app) and delivered to end users for an effortless retrieval.

###Usecase

You are a system administrator that want to collect all the information of your OSX/macOS IT Park in a few step. This script will generate a ready to send email with all the information.  
	
 1. Get the the applescript (mac-information-gatherer.applescript) provided by this project 
 2. Optionnaly fill the two first variables (recipientName and recipientEmail) with the email that will collect the information.
 3. Optionnaly edit variable "mailSubject" to match your requirements
 3. Bundle the script as an application (.app) :
    - (from ScriptEditor on OSX/macOS) File -> Save as -> File format -> Application -> Save
 4. Deliver the .app to your users tell them to launch it and to send the generated email.
 5. Done !

/!\ This project is limited to OSX/macOS machine. 

The sending of the email rely on the user of the script, so that he can check what will be sent ;)

##How to use it ?

Open "mac-information-gatherer.applescript" in "ScriptEditor" and click run (►).

The script will collect the information and display them in an outgoing mail window (mail.app).

As sayed before fill the 3 first variables to meet your requirements then bundle the script as a .app

##Why applescript ?

Because applescript do not relies on Xcode or third party libraries. Applescript could be easilly bundled as a .app and delivered to non techie end-user.

##What information are collected and how ?

The following information are collected by executing some shell commands.

<table>
<tr>
<th>Information</th>
<th>Associated Shell command</th>
</tr>
<tr>
<td>Hardware Information</td>
<td>$ system_profiler SPHardwareDataType</td>
</tr>
<tr>
<td>Software Information</td>
<td>$ system_profiler SPSoftwareDataType</td>
</tr>
<tr>
<td>Hardware port</td>
<td>$ networksetup -listallhardwareports</td>
</tr>
<tr>
<td>Used apple id</td>
<td>$ dscl . -read /Users/USERNAME | egrep -o '\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+.[a-zA-Z0-9.-]+\b' | head -1</td>
</tr>
<tr>
<td>Account that run the script</td>
<td>$ whoami</td>
</tr>
<tr>
<td>Accounts on the machine</td>
<td>$ dscacheutil -q user | grep -A 3 -B 2 -e uid:\\ 5'[0-9][0-9]'</td>
</tr>
</table>

##Tested on

- OS X 10.11.6
- macOS 10.12.0