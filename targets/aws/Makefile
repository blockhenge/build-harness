export AWSCLI_VERSION ?= 1.19.11

WITH_AWS ?= aws-vault exec $(AWS_PROFILE) --

## Install aws cli bundle
aws/install:
	pip install --no-cache-dir --disable-pip-version-check awscli==$(AWSCLI_VERSION)

## Start a aws-vault authenticated bash shell session
aws/shell/bash: aws/check-shell
	$(call assert-unset,AWS_VAULT)
	@$(WITH_AWS) bash --rcfile $(BUILD_HARNESS_PATH)/modules/aws/aws.bash.rc

## Start a aws-vault authenticated zsh shell session
aws/shell/zsh: aws/check-shell
	$(call assert-unset,AWS_VAULT)
	@$(WITH_AWS) zsh -l

# Ensure that variables required for aws-vault are set
aws/check-shell:
	$(call assert-set,AWS_PROFILE)
