#!/usr/bin/env bash
#编译+部署order站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export projectPath=这个jenkins任务在部署机器上的路径

# 输入你的环境上工作的全路径
# export projectWorkPath在部署机器上的路径


### base 函数
killProject()
{
    pid=`ps -aux | grep "java -jar jenkinsTest"|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if [[ "$pid" = "" ]]
    then
      echo "no tomcat pid alive"
    else
      kill -9 ${pid}
    fi
}

cd $projectPath/jenkinsTest
mvn clean package -DskipTests

# 停止之前的运行
killProject
# 删除原有工程
#cd $projectWorkPath/
#rm -rf ./**

# 复制新的工程
#cd $projectPath/jenkinsTest/target/
#cp jenkins*.jar $projectWorkPath/

cd target
mv jenkins*.jar project.jar

# 启动工程
nohup java -jar project.jar > log_`date +%Y%m%d%H` &