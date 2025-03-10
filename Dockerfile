ARG BUILD_FROM
FROM $BUILD_FROM

ARG SEAT_VERSION
ARG SKODA_VERSION
ARG VW_VERSION
ARG TRONITY_VERSION
ARG MQTT_VERSION
ARG MQTTHA_VERSION
ARG WEBUI_VERSION
ARG CC_VERSION

WORKDIR /tmp/
ADD carconnectivity.json.gtpl .
ADD entrypoint.sh .

RUN apk add --no-cache python3 py3-pip build-base libffi-dev && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip --no-cache && \
    /opt/venv/bin/pip install --no-cache carconnectivity-connector-seatcupra==${SEAT_VERSION} \
        carconnectivity-connector-skoda==${SKODA_VERSION} \
        carconnectivity==${CC_VERSION} \
        carconnectivity-connector-volkswagen==${VW_VERSION} \
        carconnectivity-connector-tronity==${TRONITY_VERSION} \
        carconnectivity-plugin-webui==${WEBUI_VERSION} \
        carconnectivity-plugin-mqtt_homeassistant==${MQTTHA_VERSION} && \
    echo "CARCONNECTIVITY_VERSION=${CC_VERSION}" > versions.txt && \
    echo "SEAT_VERSION=${SEAT_VERSION}" > versions.txt && \
    echo "SKODA_VERSION=${SKODA_VERSION}" >> versions.txt && \
    echo "VW_VERSION=${VW_VERSION}" >> versions.txt && \
    echo "TRONITY_VERSION=${TRONITY_VERSION}" >> versions.txt && \
    echo "WEBUI_VERSION=${WEBUI_VERSION}" >> versions.txt && \
    echo "MQTT_VERSION=${MQTT_VERSION}" >> versions.txt && \
    echo "MQTTHA_VERSION=${MQTTHA_VERSION}" >> versions.txt && \
    chmod +x /tmp/entrypoint.sh && \
    touch /tmp/carconnectivity.token && \
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

ENTRYPOINT ["/bin/sh", "-c", "/tmp/entrypoint.sh"]
