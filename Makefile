.PHONY: appup deps rel

appup:
	MIX_ENV=prod mix release.gen.appup --app=releases

deps:
	mix deps.get

rel:
	MIX_ENV=prod mix release --upgrade
