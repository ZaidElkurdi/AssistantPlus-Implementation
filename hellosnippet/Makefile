include theos/makefiles/common.mk

export ARCHS = armv7s arm64
export TARGET = iphone:latest:8.2
export SDKVERSION=8.2

BUNDLE_NAME = HelloSnippet
HelloSnippet_BUNDLE_EXTENSION = assistantPlugin
HelloSnippet_FILES = APHelloSnippet.mm APHelloSnippetCommands.mm APHelloSnippetView.mm
HelloSnippet_INSTALL_PATH = /Library/AssistantPlusPlugins/
HelloSnippet_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 SpringBoard"
