#!/bin/bash
remote_url="http://archiva.systextil.com.br:9090/archiva/repository/internal/"


cd /home/horacio/Documents/temp/systextil

for i in $(find . -name *.pom); do
 version=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='version']/text()"  $i) #arquivo pom
 groupId=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='groupId']/text()"  $i)
 artifactId=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='artifactId']/text()"  $i)
 file=
 
 
done

 
# Apache Commons Codec
mvn deploy:deploy-file -DgroupId=commons-codec -DartifactId=commons-codec -Dpackaging=jar -Dversion=1.6 -Dfile="${dependency_dir}/commons-codec-1.6.jar" -DgeneratePom=true -DrepositoryId=internal -Durl=${remote_url}
