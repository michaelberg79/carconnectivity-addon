ARG BUILD_FROM
FROM $BUILD_FROM

ARG SEAT_VERSION
ARG SKODA_VERSION
ARG VW_VERSION
ARG TRIONITY_VERSION
ARG MQTTHA_VERSION

ADD carconnectivity.json.gtpl /
ADD entrypoint.sh /

RUN apk add --no-cache python3 py3-pip build-base libffi-dev && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip --no-cache && \
    /opt/venv/bin/pip install --no-cache carconnectivity-connector-seatcupra==${SEAT_VERSION} \
        carconnectivity-connector-skoda==${SKODA_VERSION} \
        carconnectivity-connector-volkswagen==${VW_VERSION} \
        carconnectivity-connector-tronity==${TRIONITY_VERSION} \
        carconnectivity-plugin-mqtt_homeassistant==${MQTTHA_VERSION} && \
    mkdir -p /tmp && \
    chmod +x /entrypoint.sh && \
    apk del build-base libffi-dev && \
    rm -rf /var/cache/apk/*

ARG BUILD_ARCH
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_VERSION

LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION}

ENTRYPOINT ["/bin/sh", "-c", "/entrypoint.sh"]