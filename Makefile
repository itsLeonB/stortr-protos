.PHONY:
	help
	gen-fresh
	install-pre-push-hook
	uninstall-pre-push-hook

help:
	@echo "Makefile commands:"
	@echo "  make gen-fresh               - Generate fresh code using buf"
	@echo "  make install-pre-push-hook   - Install the pre-push git hook"
	@echo "  make uninstall-pre-push-hook - Uninstall the pre-push git hook"

gen-fresh:
	@echo "Generating fresh code..."
	@rm -rf ./gen
	@buf generate
	@echo "Code generation completed."

install-pre-push-hook:
	@echo "Installing pre-push git hook..."
	@mkdir -p .git/hooks
	@cp scripts/git-pre-push.sh .git/hooks/pre-push
	@chmod +x .git/hooks/pre-push
	@echo "Pre-push hook installed successfully!"

uninstall-pre-push-hook:
	@echo "Uninstalling pre-push git hook..."
	@rm -f .git/hooks/pre-push
	@echo "Pre-push hook uninstalled successfully!"
