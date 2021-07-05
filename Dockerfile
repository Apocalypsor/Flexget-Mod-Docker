FROM madwind/flexget

ARG FLEXGET_UPSTEAM_HASH=69d70072785461077b8084e96393abf06a9ed0ea83b6d6ab65eff8cb3ef092d3 \
    FLEXGET_QBITTORRENT_MOD_COMMIT=fd5fec94bf3e97b22e4eff1eadbd3ed8b6169d3b \
    FLEXGET_NEXUSPHP_COMMIT=c0b0976216f9342e28aff83ee9391e1779ecbd5d

RUN apk add --no-cache --upgrade git \
    && mkdir -p /config/plugins \
    && git clone https://github.com/IvonWei/flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod \
    && rm -rf /tmp/flexget_qbittorrent_mod/image-builder \
    && rm -f /tmp/flexget_qbittorrent_mod/.gitignore \
    && rm -f /tmp/flexget_qbittorrent_mod/LICENSE \
    && rm -f /tmp/flexget_qbittorrent_mod/*.md \
    && mv /tmp/flexget_qbittorrent_mod/* /config/plugins \
    && wget https://raw.githubusercontent.com/Juszoe/flexget-nexusphp/master/nexusphp.py -O /config/plugins/nexusphp.py
