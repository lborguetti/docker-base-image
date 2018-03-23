.DEFAULT_GOAL := branch

GITHUB_URL="github.com/lborguetti/docker-base-image.git"

VERSION=$(shell date +%y"."%m"."%d)

.PHONY: github-setup
github-setup:
	@git config --global user.email "travis@travis-ci.org"
	@git config --global user.name "Travis CI"
	@git remote add origin-travis https://${GH_TOKEN}@$(GITHUB_URL) > /dev/null 2>&1

.PHONY: update
update:
	@git checkout -b $(VERSION)
	@echo Create Dockerfile : version $(VERSION)
	@sed "s@__version__@$(VERSION)@g" Dockerfile.template > Dockerfile
	@git add . Dockerfile
	@git commit --message "Travis build: $(TRAVIS_BUILD_NUMBER)"

.PHONY: branch
tag: github-setup update
	@git push --quiet --set-upstream origin-travis $(VERSION)
