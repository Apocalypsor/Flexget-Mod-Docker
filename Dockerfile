FROM madwind/flexget

COPY flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod
COPY flexget-nexusphp /tmp/flexget-nexusphp

RUN apk add --no-cache --upgrade git \
    && mkdir -p /config/plugins \
    && rm -rf /tmp/flexget_qbittorrent_mod/image-builder \
    && rm -f /tmp/flexget_qbittorrent_mod/.git* \
    && rm -f /tmp/flexget_qbittorrent_mod/LICENSE \
    && rm -f /tmp/flexget_qbittorrent_mod/*.md \
    && mv -f /tmp/flexget_qbittorrent_mod/* /config/plugins \
    && mv -f /tmp/flexget-nexusphp/nexusphp.py /config/plugins/