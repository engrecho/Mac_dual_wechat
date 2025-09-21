sudo cp -R /Applications/WeChat.app /Applications/WeChat2.app​

sudo /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.tencent.xinWeChat2" /Applications/WeChat2.app/Contents/Info.plist​

sudo codesign --force --deep --sign - /Applications/WeChat2.app

nohup /Applications/WeChat2.app/Contents/MacOS/WeChat >/dev/null 2>&1 & 
