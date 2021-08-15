

## run maven verify using docker
# - this approach needs work 
mvn/verify:
	@docker run -it --rm \
		--env AWS_EB_PROFILE \
		--env AWS_ACCESS_KEY_ID \
		--env AWS_SECRET_ACCESS_KEY \
		--env AWS_SESSION_TOKEN \
		--env AWS_SECURITY_TOKEN \
		--env AWS_SESSION_EXPIRATION \
		--env AWS_VAULT \
		--env AWS_VAULT_BACKEND \
		--volume $(shell pwd):/src/ \
		--volume $(HOME)/.aws:/root/.aws \
		--volume $(HOME)/.m2/settings.xml:/usr/share/maven/conf/settings.xml \
		--volume $(HOME)/.m2/repository:/repository \
		--workdir /src/ \
		maven:3.6.3-jdk-11 mvn verify --log-file ./mvn.log

## execute maven clean and install
mvn/build/jar:
	@mvn clean install --log-file ./mvn.log

## execute maven compile jib build
mvn/build/jib:
	@mvn compile jib:build --log-file jib.log

## execute maven build jar followed by maven build image
mvn/build/all: mvn/build/jar mvn/build/jib
