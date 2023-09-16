
generate_localization:
	flutter pub run easy_localization:generate -S "assets/translations" -O "lib/src/translations"

generate_localization_keys:
	flutter pub run easy_localization:generate -S "assets/translations" -O "lib/src/translations" -o "locale_keys.g.dart" -f keys

gen_translate: generate_localization generate_localization_keys

flutter_generate:
	flutter packages pub run build_runner build --delete-conflicting-outputs  
