FROM madwind/flexget

ARG FLEXGET_UPSTEAM_HASH=927687929951a2aa0baaa85d0f29a819bcf92898902437dd15f974424a068dda \
    FLEXGET_QBITTORRENT_MOD_COMMIT=f10932c490c9c76e7b744fd27aa0aa8e25b8e3f4 \
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
