打包步骤：
1、工程根目录下运行gradle release；
2、等待运行打包，归档包输出目录为：$project.projectDir/platform/release。

打包前提要求：
1、打包所在机器已安装nodeJS和NPM；
2、打包环境需要外网，能下载依赖库。

docker镜像制作步骤：
1、解压ohif-viewer-build.zip包；
2、执行命令：docker rmi greatwall/ohif-viewer:v1.0.0
3、执行命令：docker build -t greatwall/ohif-viewer:v1.0.0 .

容器运行说明：
1、运行命令
    docker run --name ohif-viewer -d -p ${port}:80 -e NGINX_ORTHANC_URL=${nginxOrthancUrl} -e ORTHANC_WEB_URL=${orthancWebUrl} greatwall/ohif-viewer:v1.0.0
    port：宿主机映射的端口
    nginxOrthancUrl：nginx中代理的orthanc服务地址，用于解决前端跨域问题
    orthancWebUrl：OHIF Viewer访问的web地址，需与自身应用同源，否则将跨域
2、参考容器是否已运行，执行命令：docker ps -a | grep ohif-viewer
3、检查docker容器启动日志，执行命令docker logs -f -t --tail 500 ohif-viewer
4、开放服务器端口：
    firewall-cmd --list-ports
    firewall-cmd --zone=public --add-port=3000/tcp --permanent
    firewall-cmd --reload
5、在浏览器访问：http://${ip}:${port}，查看服务是否启动。


其他前端打包参考
    还原地址：
        npm config set registry https://registry.npmjs.org
        yarn config set registry https://registry.yarnpkg.com

    npm 设置代理
        npm config set proxy http://10.22.129.20:8080
        npm config set proxy https://10.22.129.20:8080

    yarn 设置代理
        yarn config set proxy  http://username:password@server:port
        yarn confit set https-proxy http://username:password@server:port

    yarn 取消代理
        yarn config delete proxy
        yarn config delete https-proxy
