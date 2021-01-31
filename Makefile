setup:
	mkdir -p .git/hooks
	touch .git/hooks/pre-commit
	echo 'echo "striping sensitive information"' >> .git/hooks/pre-commit
	echo "make strip" >> .git/hooks/pre-commit
	chmod +x .git/hooks/pre-commit

strip:
	plutil -replace PlatformInfo.Generic.MLB -string "" OC/config.plist
	plutil -replace PlatformInfo.Generic.SystemProductName -string "" OC/config.plist
	plutil -replace PlatformInfo.Generic.SystemSerialNumber -string "" OC/config.plist
	plutil -replace PlatformInfo.Generic.SystemUUID -string "" OC/config.plist
	
.PHONY: strip setup