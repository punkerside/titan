init:
	@rm -rf .titan/
	@git clone git@github.com:punkerside/titan.git -b main .titan

-include makefiles/*.mk
-include .titan/makefiles/*.mk