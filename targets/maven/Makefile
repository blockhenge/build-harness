

## run maven verify
mvn/verify:
	docker run -it --rm \
		--volume $(shell pwd):/src/ \
		--volume $(HOME)/.m2/settings.xml:/usr/share/maven/conf/settings.xml \
		--volume $(HOME)/.m2/repository:/repository \
		--workdir /src/ \
		maven:3.6.3-jdk-11 mvn verify --log-file ./mvn.log
