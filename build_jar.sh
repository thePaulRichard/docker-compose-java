#!/bin/bash
set -e

root=$PWD

read -p "REPO [None]:" repo
git clone ${repo} git_project
cd git_project

read -p "BRANCH [develop]:" branch
branch=${branch:-develop}
git switch $branch

read -p "PROJECT/MODULE [None]:" project
project=${project:-"./"}

mvn -pl $project -am -DskipTests -U clean install
cd $project
cp ./target/*.jar $root/app.jar
cd $root

echo ""
run=$(which docker-compose)

# docker-compose
PS3="Qual ambiente deseja subir? "

select docker in basico completo; do
	case $docker in
		basico)
			exec $run up --build
			;;
		completo)
			exec $run -f docker-compose_mysql_rabbit_elastic.yml up --build
			;;
		*)
			break
			;;
	esac
done
