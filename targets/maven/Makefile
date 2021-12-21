
MVN_CLI_OPTS ?= -s ci_settings.xml --batch-mode --errors --fail-at-end --show-version
MVN_OPTS ?= -Dhttps.protocols=TLSv1.2 -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=WARN -Dorg.slf4j.simpleLogger.showDateTime=true -Djava.awt.headless=true
MVN_SKIP_TEST_OPTS ?= -Dmaven.test.skip=true
MVN_LOG_OPTS ?= --log-file mvn.log & less +F mvn.log
JIB_LOG_OPTS ?= --log-file jib.log & less +F jib.log

## run maven verify using docker
# - this approach needs work 
mvn/verify:
	@mvn $(MVN_CLI_OPTS) verify

mvn/version:
	@mvn -q -Dexec.executable=echo -Dexec.args='$${project.version}' --non-recursive exec:exec

## execute maven clean and install
mvn/build/jar:
	@mvn $(MVN_CLI_OPTS) clean install $(MVN_LOG_OPTS) 

## execute maven compile jib build
mvn/build/jib:
	@mvn $(MVN_CLI_OPTS) $(MVN_SKIP_TEST_OPTS) compile jib:build $(JIB_LOG_OPTS)

## execute maven build jar followed by maven build image
mvn/build/all: mvn/build/jar mvn/build/jib
