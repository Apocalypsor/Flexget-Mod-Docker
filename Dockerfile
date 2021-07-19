FROM madwind/flexget

ARG FLEXGET_UPSTEAM_HASH=69d70072785461077b8084e96393abf06a9ed0ea83b6d6ab65eff8cb3ef092d3 \
    FLEXGET_QBITTORRENT_MOD_COMMIT=9501a5972e970bac23c4d3354e911d7b89f73f68 \
    FLEXGET_NEXUSPHP_COMMIT=907a4f7b7a60c03522a0f3b958668c1504bc9dec

RUN apk add --no-cache --upgrade git \
    && mkdir -p /config/plugins \
    && git clone https://github.com/IvonWei/flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod \
    && rm -rf /tmp/flexget_qbittorrent_mod/image-builder \
    && rm -f /tmp/flexget_qbittorrent_mod/.gitignore \
    && rm -f /tmp/flexget_qbittorrent_mod/LICENSE \
    && rm -f /tmp/flexget_qbittorrent_mod/*.md \
    && mv /tmp/flexget_qbittorrent_mod/* /config/plugins \
    && wget https://raw.githubusercontent.com/Juszoe/flexget-nexusphp/master/nexusphp.py -O /config/plugins/nexusphp.py
