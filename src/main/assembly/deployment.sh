
# general steps

# get a copy of the artifact from internal artifactory/nexus
mvn dependency:get -Dartifact=${groupId}:${artifact}:${version}:${packaging}

# copy the artifact from .m2/repository to workspace
mvn dependency:copy -Dartifact=${groupId}:${artifact}:${version}:${packaging}

# now deploy to jboss as/eap
jboss-cli --connect --controller=${controller} --user=${as_user} --password=${as_password} --command="deploy ./target/dependency/${artifact}-${version}.${packaging} --server-groups=${server_group}"