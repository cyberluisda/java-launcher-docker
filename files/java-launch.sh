#!/bin/sh
set -e

# Common configuration

# Functions

use() {
    echo "java-launch.sh app|jar|javac|java java_args"
    echo "  app. Similar to jar but the path and extension is added."
    echo "    for example java-launch.sh jars test will launch"
    echo "    java -jar /usr/lib/java/extra/test.jar"
    echo "  jar. Launch java with executable jar. Alias of java -jar"
    echo "  java. Launch java commnad"
    echo "  javac. Launch javac command"
    echo "  java_args : arguments to launch with java -jar java or javac "
}


java_r() {
  java $@
}

javac_r() {
  javac $@
}

# Main

if [ -z "$2" ]
then
  use
  exit 1
fi

connector_cfg=""
case $1 in
  app)
    shift
    filePath=/usr/lib/java/extra/$1.jar
    shift
    java_r -jar $filePath $@
    ;;
  jar)
    shift
    java_r -jar $@
    ;;
  java)
    shift
    java_r $@
    ;;
  javac)
    shift
    javac_r $@
    ;;
  *)
    use
    exit 1
    ;;
esac
