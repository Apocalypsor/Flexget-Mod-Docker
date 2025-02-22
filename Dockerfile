FROM madwind/flexget

COPY flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod
COPY flexget-nexusphp /tmp/flexget-nexusphp

RUN mkdir -p /defaults/plugins \
    && rm -rf /tmp/flexget_qbittorrent_mod/.git* \
    && rm -rf /tmp/flexget_qbittorrent_mod/LICENSE \
    && rm -rf /tmp/flexget_qbittorrent_mod/*.md \
    && mv -f /tmp/flexget_qbittorrent_mod/* /defaults/plugins \
    && mv -f /tmp/flexget-nexusphp/nexusphp.py /defaults/plugins/ \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

# 复制 entrypoint 脚本
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
