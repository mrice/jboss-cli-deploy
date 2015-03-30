
# general steps

# get a copy of the artifact from internal artifactory/nexus
mvn dependency:get -Dartifact=com.michaelrice.demo:hello-world:1.0-SNAPSHOT:war

# copy the artifact from .m2/repository to workspace
mvn dependency:copy -Dartifact=com.michaelrice.demo:hello-world:1.0-SNAPSHOT:war

# now deploy to jboss as/eap
jboss-cli.sh --connect --command="deploy ./target/dependency/hello-world-1.0-SNAPSHOT.war"