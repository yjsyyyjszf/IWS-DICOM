FROM nginx:1.15.5-alpine
MAINTAINER '张胜<1110783@greatwall.com.cn>'
WORKDIR /home/OHIF-Viewer
COPY ./dist /home/OHIF-Viewer
COPY nginx.conf /etc/nginx
COPY startup.sh /home/OHIF-Viewer/startup.sh
RUN chmod 777 /home/OHIF-Viewer/startup.sh
ENV TZ Asia/Shanghai
### nginx中代理的orthanc服务地址
ENV NGINX_ORTHANC_URL 'http://127.0.0.1:8042/dicom-web'
### OHIF Viewer访问的web地址，需与自身应用同源，否则将跨域
ENV ORTHANC_WEB_URL 'http://127.0.0.1:3000/dicom-web'
EXPOSE 80
CMD ["/bin/sh", "-c", "/home/OHIF-Viewer/startup.sh"]
