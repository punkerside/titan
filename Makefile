init:
	@rm -rf .scripts/
	@git clone git@github.com:punkerside/titan-core.git -b main .scripts

-include makefiles/*.mk
-include .scripts/makefiles/*.mk