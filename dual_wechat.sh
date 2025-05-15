sudo cp -R /Applications/WeChat.app /Applications/WeChat2.app​

curl -o https://parsefiles.back4app.com/JPaQcFfEEQ1ePBxbf6wvzkPMEqKYHhPYv8boI1Rc/10809935e3624d1183fa5bcb89c94345_ChatWise.icns

sudo mv 10809935e3624d1183fa5bcb89c94345_ChatWise.icns /Applications/WeChat2.app/Contents/Resources/AppIcon.icns​

sudo /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.tencent.xinWeChat2" /Applications/WeChat2.app/Contents/Info.plist​

sudo codesign --force --deep --sign - /Applications/WeChat2.app

nohup /Applications/WeChat2.app/Contents/MacOS/WeChat >/dev/null 2>&1 & 
