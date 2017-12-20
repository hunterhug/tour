《Go 语言之旅》是官方 Go Tour 的中文翻译版。

在本地安装教程此教程（英文版）最容易的方式，就是安装一份[Go 的二进制发行版](https://golang.org/dl/) 并执行:

	$ go tool tour

要从源码安装本教程，首先请 [设置一个工作空间](https://go-zh.org/doc/code.html) 并执行:

	$ go get -u github.com/Go-zh/tour/gotour

这会在你工作空间的 `bin` 目录中创建一个 `gotour` 可执行文件。

（如果安装过程中出现 `package` 或 `import`字样的错误提示，那么说明依赖库的导入路径又挂了。这时请猛戳 @OlingCat 并督促其解决= =||）

因为依旧因为各种墙, 所以在gotour包里使用了`godep`依赖管理, 将所有依赖一并打包进vendor上传, 不再为墙困扰.

现在只需要在任意位置克隆这个仓库, 然后编译安装二进制执行即可:


	$ git clone 这个仓库
	$ cd tour/gotour
	$ go build && go install
	$ ./gotour


翻译贡献者名单：

	@qiansen138	#224
	@tiant16	#206
	@ybi		#198
	@anamewin	#191

除特别声明外，go-tour 源码文件均采用BSD风格的授权许可分发，许可内容见 `LICENSE` 文件。

Contributions should follow the same procedure as for the Go project:
贡献方式应与 Go 项目遵循相同的流程：
http://go-zh.org/doc/contribute.html