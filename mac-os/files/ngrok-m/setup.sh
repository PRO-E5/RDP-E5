sudo mdutil -i off -a

sudo dscl . -create /Users/alone
sudo dscl . -create /Users/alone UserShell /bin/bash
sudo dscl . -create /Users/alone RealName "Alone"
sudo dscl . -create /Users/alone UniqueID 1001
sudo dscl . -create /Users/alone PrimaryGroupID 80
sudo dscl . -create /Users/alone NFSHomeDirectory /Users/vncuser
sudo dscl . -passwd /Users/alone $1
sudo dscl . -passwd /Users/alone $1
sudo createhomedir -c -u alone > /dev/null

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes 

echo $2 | perl -we 'BEGIN { @k = unpack "C*", pack "H*", "1734516E8BA8C5E2FF1C39567390ADCA"}; $_ = <>; chomp; s/^(.{8}).*/$1/; @p = unpack "C*", $_; foreach (@k) { printf "%02X", $_ ^ (shift @p || 0) }; print "\n"' | sudo tee /Library/Preferences/com.apple.VNCSettings.txt

sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

brew install --cask ngrok

ngrok authtoken $3
ngrok tcp 5900 --region=in &
