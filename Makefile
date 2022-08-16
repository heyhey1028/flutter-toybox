install_packages:
	flutter pub add flutter_dotenv
	flutter pub add google_maps_flutter
	flutter pub add geolocator

refresh:
	rm -rf ios/Pods
	rm -rf ios/Podfile.lock
	flutter clean
	flutter pub get
	cd ios && pod install