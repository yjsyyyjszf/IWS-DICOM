#!/bin/sh
sed -i "s#ENV_PROXY_PASS#$NGINX_ORTHANC_URL#g" /etc/nginx/nginx.conf
sed -i "s#http://localhost:8088/dicom-web#$ORTHANC_WEB_URL#g" /home/OHIF-Viewer/app-config.js
nginx -g "daemon off;"
