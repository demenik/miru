debug:
	flutter emulators --launch Pixel_9_Pro_API_35
	sleep 1
	flutter run

build-apk:
	flutter build apk --release

# this will build an unsigned ipa over ssh on a macbook
build-ipa:
	ssh macbook "mkdir -p ~/dev/miru"
	rsync -avh --exclude "build" --exclude ".dart_tool" . macbook:~/dev/miru
	ssh macbook "source ~/.zshrc && cd ~/dev/miru && flutter pub get && flutter build ios --release --no-codesign && cd ./build/ios/iphoneos && yes | rm -rf Payload && mkdir Payload && cp -r ./Runner.app ./Payload && zip -r Miru.ipa ./Payload"
	mkdir -p ./build
	rsync -avh macbook:~/dev/miru/build/ios/iphoneos/Miru.ipa ./build/Miru.ipa
