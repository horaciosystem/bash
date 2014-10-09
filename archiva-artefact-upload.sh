#!/bin/bash


cd /home/horacio/Documents/temp/systextil

for i in $(find . -name *.pom); do
 version=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='version']/text()"  $i)
 groupId=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='groupId']/text()"  $i)
 artifactId=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='artifactId']/text()"  $i)
 BASEDIR=$(dirname $i)
 file="$BASEDIR/$artifactId-$version.jar"

 repository="internal/"
 if [[ $version == *SNAPSHOT* ]]
 then
  repository="snapshots/";
 fi

 remote_url="http://archiva.systextil.com.br:9090/archiva/repository/$repository"

 mvn deploy:deploy-file -DgroupId=$groupId -DartifactId=$artifactId -Dpackaging=jar -Dversion=$version -Dfile=$file -DgeneratePom=true -DrepositoryId=internal -Durl=${remote_url} 
 
done

