test:
	@testing/app.sh

test_awspec:
	@export GIT_HOME=${GIT_HOME} && ${GIT_HOME}/scripts/test.sh function_test_awspec

test_precommit:
	@export GIT_HOME=${GIT_HOME} && ${GIT_HOME}/scripts/test.sh function_test_precommit