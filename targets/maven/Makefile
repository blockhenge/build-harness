

## run maven verify using docker
# - this approach needs work 
mvn/verify:
	docker run -it --rm \
		--volume $(shell pwd):/src/ \
		--volume $(HOME)/.m2/settings.xml:/usr/share/maven/conf/settings.xml \
		--volume $(HOME)/.m2/repository:/repository \
		--workdir /src/ \
		maven:3.6.3-jdk-11 mvn verify --log-file ./mvn.log

## execute maven clean and install
mvn/build/jar:
	@mvn clean install

## execute maven compile jib build
mvn/build/image:
	@mvn compile jib:build

## execute maven build jar followed by maven build image
mvn/build/all: mvn/build/jar mvn/build/image
