# 2025年Mac微信双开方法（亲测验证至2025.12月有效）

### 1、原理​

复制微信应用并修改签名，使系统识别为不同应用。
**用此方法也不影响微信输入法的正常使用。**更重要的是：
- 不涉及到微信风控问题，因为我们并没有使用第三方的工具、套壳来操作，就是用的原生的微信，只不过换了个名字
- 不涉及到微信隐私泄露问题，第三方的工具...呃....不知道...不敢用
- 免费
- 理论上可以无限多开

### 2、适配版本

已测试可支持的，适配微信版本（MAC）

* 4.1.0.34（2025-09-21 已验证）
* 4.0.5.12（2025-05-15 已验证）
* 4.0.3.93（2025-04-16 已验证）
* 4.1.5.17（2025-12-06 已验证）

### 3、操作步骤

#### ​1）复制微信应用​，

- 直接复制（新手推荐）：
从Finder进入应用程序目录，直接复制微信，然后新的微信命名为 WeChat2.app, 命名后展示为一个正常的微信图标，就是正常的，如果是展示为一个文件夹图标，那就是没有 .app的后缀。
点击右键，选择“显示简介”，确认下文件的名称是不是 WeChat2.app
<img width="854" height="327" alt="image" src="https://github.com/user-attachments/assets/9f378f2c-4540-4026-8e9b-00b393e62095" />

- 终端执行（新手不推荐）：有可能在复制后，会多出来一个后缀，导致在修改BundleId的时候会报错，这时候直接删除，按照新手推荐的方式
`sudo cp -R /Applications/WeChat.app /Applications/WeChat2.app​`


如果需要修改图标，可以到 https://macosicons.com/ 下载一个中意的图标，也可以自己到网上搜索 Mac Icon，**当然这一步非必需，也可以后续单独处理**
下载后将名称改成AppIcon.icns, 进入应用程序，找到Wechat2的应用，点击右键，然后选择“显示包内容”，进入 contents/resources，删除原有的AppIcon.icns，粘贴你的图标

给几个参考案例（更多关于更换APP图标，参考https://www.ifanr.com/app/1379030）：

- https://macosicons.com/#/chat,
- https://macosicons.com/#/wechat,
- https://macosicons.com/#/message, 
- https://macosicons.com/#/微信
- [我的选择,可以尝试下](https://parsefiles.back4app.com/JPaQcFfEEQ1ePBxbf6wvzkPMEqKYHhPYv8boI1Rc/10809935e3624d1183fa5bcb89c94345_ChatWise.icns)

#### 2）修改BundleID

防止微信检测为同一应用：（直接复制下面两行的内容，不要分别复制）

`sudo /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.tencent.xinWeChat2" /Applications/WeChat2.app/Contents/Info.plist`
​

#### 3）重新签名应用​，在终端执行（需输入密码）：

`sudo codesign --force --deep --sign - /Applications/WeChat2.app`

#### 4）​启动双开​

手动打开第一个微信（原应用），在终端执行，启动第二个：

`nohup /Applications/WeChat2.app/Contents/MacOS/WeChat >/dev/null 2>&1 & `

#### 5）常驻程序坞

第二个终端应用启动后，可以选择右键在程序坞中保留，这样下次直接点程序坞的程序就可以运行了，不需要再次使用终端命令打开第二个微信。

### 4、FAQ
- Q: 安全吗？会被微信官方识别为外挂、模拟器。
- A: 100000%放心，完全不会。因为没有改动官方原包（或者说就是官方自己的，只不过让系统不会识别同一个进程而已）。

- Q: 如果一直不行怎么办？
- A: 先确认是不是严格按照步骤来执行，另外，复制粘贴的时候，注意不要漏了，注意下报错是啥。 如果一直解决不了，可以提交Issues。

