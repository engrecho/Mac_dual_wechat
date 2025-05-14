# 2025年Mac微信双开方法（亲测验证至2025.5月有效）

#### 1、原理​

复制微信应用并修改签名，使系统识别为不同应用。
**用此方法也不影响微信输入法的正常使用。**

#### 2、适配版本

已测试可支持的，适配微信版本（MAC）

* 4.0.3.93

#### 3、使用方法

###### ​1）复制微信应用​，

终端执行：
`sudo cp -R /Applications/WeChat.app /Applications/WeChat2.app ​`

###### 2）修改BundleID

防止微信检测为同一应用：（直接复制下面两行的内容，不要分别复制）

`sudo /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.tencent.xinWeChat2" /Applications/WeChat2.app/Contents/Info.plist`
​

###### 3）重新签名应用​，在终端执行（需输入密码）：

`sudo codesign --force --deep --sign - /Applications/WeChat2.app`

###### 4）​启动双开​

手动打开第一个微信（原应用），在终端执行，启动第二个：

`nohup /Applications/WeChat2.app/Contents/MacOS/WeChat >/dev/null 2>&1 & `

###### 5）常驻程序坞

第二个终端应用启动后，可以选择右键在程序坞中保留，这样下次直接点程序坞的程序就可以运行了，不需要再次使用终端命令打开第二个微信。


