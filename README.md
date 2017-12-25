# Golang官方中文教程修改版

## 解决跨域/Docker下载部署

> 最新修改,可以采用docker部署(并解决websocket跨域问题).

最简单的部署方案:

```
# 拉镜像
docker pull hunterhug/gotourzh

# 前台运行
docker run -it -p 9999:9999 hunterhug/gotourzh

# 后台运行(类似nohup)
docker run -d -p 9999:9999 hunterhug/gotourzh
```

打开`http://127.0.0.1:9999`即可!

## 增加依赖/源码安装部署

因为依旧因为各种墙, 所以修改了`gotour`将所有依赖一并打包进`vendor`上传, 不再为墙困扰.现在只需要在路径`$GOPATH/github.com/Go-zh`下克隆这个仓库, 移动`vendor`到`GOPATH`, 然后编译安装二进制执行即可:

	$ mkdir -p $GOPATH/src/github.com/Go-zh
	$ cd $GOPATH/src/github.com/Go-zh && git clone 这个仓库
	$ cd tour && cp -r vendor/* $GOPATH/src
	$ cd gotour && go build && go install
	$ ./gotour

运行指定地址:

```
gotour -http=0.0.0.0:9999
```

如果想后台运行:

```
nohup gotour -http=0.0.0.0:9999 &
```

打开`http://127.0.0.1:9999`即可!

# Nginx配置远程访问

如果需要远程访问, 请配置`Nginx`反向代理, 配置如下:

```
server{
	listen 80;
	server_name go.lenggirl.com;
	charset utf-8;
	access_log /root/gotour.log;
	location / {
  	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  	proxy_set_header Host $http_host;
  	proxy_redirect off;
  	proxy_pass http://127.0.0.1:9999;

	proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
	}	
}
```

打开: `go.lenggirl.com`


--------------------


《Go 语言之旅》是官方 Go Tour 的中文翻译版。

在本地安装教程此教程（英文版）最容易的方式，就是安装一份[Go 的二进制发行版](https://golang.org/dl/) 并执行:

	$ go tool tour

要从源码安装本教程，首先请 [设置一个工作空间](https://go-zh.org/doc/code.html) 并执行:

	$ go get -u github.com/Go-zh/tour/gotour

这会在你工作空间的 `bin` 目录中创建一个 `gotour` 可执行文件。

（如果安装过程中出现 `package` 或 `import`字样的错误提示，那么说明依赖库的导入路径又挂了。这时请猛戳 @OlingCat 并督促其解决= =||）

翻译贡献者名单：

	@qiansen138	#224
	@tiant16	#206
	@ybi		#198
	@anamewin	#191

除特别声明外，go-tour 源码文件均采用BSD风格的授权许可分发，许可内容见 `LICENSE` 文件。

Contributions should follow the same procedure as for the Go project:
贡献方式应与 Go 项目遵循相同的流程：
http://go-zh.org/doc/contribute.html