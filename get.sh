#!/bin/bash
DEPOLY_DIR="/root/docker"
#项目目录
PROJECT_DIR="/root/docker/data/ym"
#部署目录
BUILD_DIR="/root/docker/data/build_ym"
cd $DEPOLY_DIR
#获取上一个版本
DNAME="code-$(git rev-parse --short HEAD)"
#更新代码
git stash && git pull
#获取这个版本
NDNAME="code-$(git rev-parse --short HEAD)"
if [ "$DNAME" = "$NDNAME" ]; then
    echo "no update"
    exit 0
else
    BUILD_PATH="$BUILD_DIR/$DNAME/"
    if [ -d "$BUILD_PATH" ]; then
        cd $BUILD_PATH
        #关闭docker
        docker-compose stop
    else
        echo "no dir"
    fi
    BUILD_PATH="$BUILD_DIR/$NDNAME/"
    #cp项目到新的路径
    if [ -d $BUILD_PATH ]; then
        cd $BUILD_PATH
    else
        mkdir $BUILD_PATH
        #拷贝代码
        cp -rf $PROJECT_DIR $BUILD_PATH
        #拷贝部署文件
        cp -rf "$DEPOLY_DIR/docker-compose.yml" $BUILD_PATH
        cp -rf "$DEPOLY_DIR/env.sh" $BUILD_PATH
        chmod 777 -R $BUILD_PATH
        cd $BUILD_PATH
    fi
    #写环境变量
    if [ -f "env.sh" ]; then
        chmod 777 env.sh
        ./env.sh
    fi
    #启动项目
    docker-compose down && docker-compose up -d --build
fi
