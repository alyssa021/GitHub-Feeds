install: main.pl
	@sudo cp main.pl /usr/bin/git-feeds
	@echo "Successfully Installed"
	@echo "Usage:"
	@echo "\tgit feeds # in git repo"
	@echo "\n\`make remove\` to uninstall"

remove: /usr/bin/git-feeds
	@sudo rm /usr/bin/git-feeds
