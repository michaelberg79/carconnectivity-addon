ARG BUILD_FROM
FROM $BUILD_FROM

# Copy root filesystem
ADD carconnectivity.json.gtpl /
ADD entrypoint.sh /

RUN apk add --no-cache python3 py3-pip build-base libffi-dev && \
    python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install carconnectivity-connector-seatcupra carconnectivity-plugin-webui carconnectivity-plugin-mqtt_homeassistant && \
    mkdir -p /tmp && \
    chmod +x /entrypoint.sh

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION}

ENTRYPOINT ["/bin/sh", "-c", "/entrypoint.sh"]
