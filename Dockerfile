FROM madwind/flexget

COPY flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod
COPY flexget-nexusphp /tmp/flexget-nexusphp

RUN mkdir -p /config/plugins \
    && rm -rf /tmp/flexget_qbittorrent_mod/image-builder \
    && rm -rf /tmp/flexget_qbittorrent_mod/.git* \
    && rm -rf /tmp/flexget_qbittorrent_mod/LICENSE \
    && rm -rf /tmp/flexget_qbittorrent_mod/*.md \
    && mv -f /tmp/flexget_qbittorrent_mod/* /config/plugins \
    && mv -f /tmp/flexget-nexusphp/nexusphp.py /config/plugins/ \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*
