# Makefile for github actions
#
# For releases, the steps archive, ipa, validate, and upload must be run in that sequence (typically from a github action workflow)
# which keeps these steps separate for reporting and troubleshooting in the Actions interface at github.
#
scheme = Catalog (iOS)
configuration = "Release"
projecttype = project
#projecttype = workspace
projectname = Catalog.xcodeproj
keychain = "CI_APPLE_DEV"
ipa_name = "Catalog"
export_options = ".github/export_options.plist"
device = "iPhone 11"
platform = "iOS Simulator"

clean:
	xcodebuild clean -scheme "$(scheme)" -sdk iphoneos

lint:
	brew install swiftlint
	swiftlint --reporter github-actions-logging

build: clean
	xcodebuild build-for-testing -scheme "$(scheme)" -$(projecttype) $(projectname) -destination platform=$(platform),name=$(device)

test: clean build
	xcodebuild test-without-building -scheme "$(scheme)" -$(projecttype) $(projectname) -destination platform=$(platform),name=$(device)

archive: clean
	xcodebuild -scheme "$(scheme)" -sdk iphoneos -configuration $(configuration) archive -archivePath "$PWD/build/Release.xcarchive"

ipa:
	xcodebuild -exportArchive -archivePath "$PWD/build/Release.xcarchive" -exportOptionsPlist "$(export_options)" -exportPath "$(PWD)/build"

validate:
	xcrun altool --validate-app -type ios -f $(PWD)/build/$(ipa_name).ipa -p @keychain:$(keychain)

upload: 
	xcrun altool --upload-app -type ios -f $(PWD)/build/$(ipa_name).ipa -p @keychain:$(keychain)

