#!/bin/bash
set -e

root=$PWD

read -p "REPO [git@github.com:thePaulRichard/simple-java.git]:" repo
repo=${repo:-"git@github.com:thePaulRichard/simple-java.git"}
git clone ${repo} git_project
cd git_project

read -p "BRANCH [develop]:" branch
branch=${branch:-"develop"}
git switch $branch

read -p "MODULE [None]:" module
module=${module:-"./"}

mvn -pl $module -am -DskipTests -U clean install
cd $module
cp ./target/*.jar $root/app.jar
cd $root

echo ""
run=$(which docker-compose)

# docker-compose
PS3="What docker-compose you want to run? "

select docker in basic complete; do
	case $docker in
		basic)
			exec $run up --build
			;;
		complete)
			exec $run -f docker-compose_mysql_rabbit_elastic.yml up --build
			;;
		*)
			break
			;;
	esac
done
