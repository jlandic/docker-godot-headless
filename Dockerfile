FROM debian:buster

ENV VERSION "3.2"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    unzip \
    python \
    python-openssl \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://downloads.tuxfamily.org/godotengine/${VERSION}/Godot_v${VERSION}-stable_linux_server.64.zip \
    && wget https://downloads.tuxfamily.org/godotengine/${VERSION}/Godot_v${VERSION}-stable_export_templates.tpz \
    && mkdir ~/.cache \
    && mkdir -p ~/.config/godot \
    && mkdir -p ~/.local/share/godot/templates/${VERSION}.stable \
    && unzip Godot_v${VERSION}-stable_linux_server.64.zip \
    && mv Godot_v${VERSION}-stable_linux_server.64 /usr/local/bin/godot \
    && unzip Godot_v${VERSION}-stable_export_templates.tpz \
    && mv templates/* ~/.local/share/godot/templates/${VERSION}.stable \
    && rm -f Godot_v${VERSION}-stable_export_templates.tpz Godot_v${VERSION}-stable_linux_server.64.zip
