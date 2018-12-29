install: main.pl
	@chmod +x main.pl
	@cp main.pl /usr/bin/git-feeds
	@echo "Successfully Installed\n"
	@echo "Usage:"
	@echo "git feeds # in git repo"
	@echo "\`make remove\` to uninstall"

remove: /usr/bin/git-feeds
	@sudo rm /usr/bin/git-feeds
