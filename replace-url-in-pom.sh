cd /home/horacio/workspace/bitbucket #caminho da workspace de projetos maven

for pom in $(find . -name pom.xml); do

 sed -i 's,http://intersys.com.br/archiva/repository/internal/,http://archiva.intersys.com.br:9090/archiva/repository/internal,g' $pom
 sed -i 's,http://intersys.com.br/archiva/repository/snapshots/,http://archiva.intersys.com.br:9090/archiva/repository/snapshots,g' $pom

done
