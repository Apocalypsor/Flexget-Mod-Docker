FROM madwind/flexget

ARG FLEXGET_UPSTEAM_HASH=44bd97bd8cd1ac0297d8a923230c43b3df2ae85ed7be0f8cf4371432e68a7f46 \
    FLEXGET_QBITTORRENT_MOD_COMMIT=a11ab5107b1b9076296d80614b13aade7fbd7f9f \
    FLEXGET_NEXUSPHP_COMMIT=8ea472b619955cde46923b1dd86730e5fcd0998d

RUN apk add --no-cache --upgrade git \
    && mkdir -p /config/plugins \
    && git clone https://github.com/IvonWei/flexget_qbittorrent_mod /tmp/flexget_qbittorrent_mod \
    && rm -rf /tmp/flexget_qbittorrent_mod/image-builder \
    && rm -f /tmp/flexget_qbittorrent_mod/.gitignore \
    && rm -f /tmp/flexget_qbittorrent_mod/LICENSE \
    && rm -f /tmp/flexget_qbittorrent_mod/*.md \
    && mv /tmp/flexget_qbittorrent_mod/* /config/plugins \
    && wget https://raw.githubusercontent.com/Juszoe/flexget-nexusphp/master/nexusphp.py -O /config/plugins/nexusphp.py
