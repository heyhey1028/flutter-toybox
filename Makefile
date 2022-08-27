init_melos:
	dart pub global activate melos
	melos bootstrap

add_sample:
	cd samples && mason make toybox_template