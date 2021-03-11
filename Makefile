export DIR = ${PWD}

all: tcltls piaware dump1090

tcltls:
	cd ${DIR}; \
	sudo \rm -rf tcltls-rebuild; \
	sudo apt-get install -y libdistro-info-perl; \
	git clone http://github.com/flightaware/tcltls-rebuild.git
	cd ${DIR}/tcltls-rebuild; \
	sudo ${DIR}/tcltls-rebuild/prepare-build.sh buster
	cd ${DIR}/tcltls-rebuild/package-buster; \
	sudo dpkg-buildpackage -b --no-sign
	cd ${DIR}/tcltls-rebuild; \
	sudo dpkg -i tcl-tls_1.7.16-1+fa1_arm64.deb

piaware:
	cd ${DIR}; \
	sudo \rm -rf piaware_builder; \
	git clone https://github.com/flightaware/piaware_builder.git
	cd ${DIR}/piaware_builder; \
	sudo ${DIR}/piaware_builder/sensible-build.sh buster
	cd ${DIR}/piaware_builder/package-buster; \
	sudo dpkg-buildpackage -b --no-sign
	cd ${DIR}/piaware_builder; \
	sudo dpkg -i piaware_5.0_arm64.deb

dump1090:
	cd ${DIR}; \
	sudo \rm -rf dump1090-fa; \
	git clone https://github.com/flightaware/dump1090 dump1090-fa
	cd ${DIR}/dump1090-fa; \
	sudo ${DIR}/dump1090-fa/prepare-build.sh buster
	cd ${DIR}/dump1090-fa/package-buster; \
	sudo dpkg-buildpackage -b --no-sign
	cd ${DIR}/dump1090-fa; \
	sudo dpkg -i dump1090-fa_4.0_arm64.deb

