FROM madwind/flexget

ARG FLEXGET_UPSTEAM_HASH= \
    FLEXGET_QBITTORRENT_MOD_COMMIT= \
    FLEXGET_NEXUSPHP_COMMIT=

RUN mkdir /config/plugins \
    git clone https://github.com/IvonWei/flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod \
    rm -rf /tmp/flexget_qbittorrent_mod/image-builder \
    rm -f /tmp/flexget_qbittorrent_mod/.gitignore \
    rm -f /tmp/flexget_qbittorrent_mod/LICENSE \
    rm -f /tmp/flexget_qbittorrent_mod/*.md \
    mv /tmp/flexget_qbittorrent_mod/* /config/plugins \
    wget https://raw.githubusercontent.com/Juszoe/flexget-nexusphp/master/nexusphp.py -O /config/plugins/nexusphp.py
