WORKSPACE_NAME = ACPCore.xcworkspace

SIMULATOR_ARCHIVE_PATH = ./build/ios_simulator.xcarchive/Products/Library/Frameworks/
IOS_ARCHIVE_PATH = ./build/ios.xcarchive/Products/Library/Frameworks/

# targets
make-libs:
	pod install
	git clone git@github.com:adobe/aepsdk-core-ios.git
	cd aepsdk-core-ios && make archive
	cp -r aepsdk-core-ios/build ./
	xcodebuild -workspace $(WORKSPACE_NAME) archive -scheme ACPCore -archivePath "./build/ios.xcarchive" -sdk iphoneos -destination="iOS" SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
	xcodebuild -workspace $(WORKSPACE_NAME) archive -scheme ACPCore -archivePath "./build/ios_simulator.xcarchive" -sdk iphonesimulator -destination="iOS Simulator" SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
	xcodebuild -create-xcframework -framework $(SIMULATOR_ARCHIVE_PATH)ACPCore.framework -framework $(IOS_ARCHIVE_PATH)ACPCOre.framework -output ./build/ACPCore.xcframework
	rm -rf aepsdk-core-ios/

clean:
	rm -rf ./build
	rm -rf aepsdk-core-ios/
