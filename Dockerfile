FROM haxe:4.0.0

LABEL maintainer="gmantaos@gmail.com"

# copy shortcut scripts
COPY ./scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# install Lime and OpenFL
ENV LIME_VERSION=7.2.1 \
    OPENFL_VERSION=8.8.0

RUN haxelib install lime $LIME_VERSION
RUN haxelib install openfl $OPENFL_VERSION

# install HaxeFlixel
ENV FLIXEL_VERSION=4.6.0 \
    FLIXEL_ADDONS_VERSION=2.7.1 \
    FLIXEL_TOOLS_VERSION=1.4.3

RUN haxelib install flixel $FLIXEL_VERSION
RUN haxelib install flixel-addons $FLIXEL_ADDONS_VERSION
RUN haxelib install flixel-tools $FLIXEL_TOOLS_VERSION

# run setup scripts
RUN haxelib run lime setup flixel
RUN haxelib run lime setup --never