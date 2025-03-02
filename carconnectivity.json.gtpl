{
    "carConnectivity": {
        "log_level": "{{ .log_level }}",
        "connectors": [
            {
                "type": "{{ .connector_type }}",
                "config": {
                    "log_level": "{{ .connector_log_level }}",
                    "username": "{{ .username }}",
                    "password": "{{ .password }}",
                    "spin": "{{ .spin }}"
                }
            }
        ],
        "plugins": [
            {
                "type": "webui",
                "config": {
                    "log_level": "{{ .webui_log_level }}",
                    "username": "{{ .webui_username }}",
                    "password": "{{ .webui_password }}"
                }
            },
            {
                "type": "mqtt",
                "log_level": "{{ .mqtt_log_level }}",
                "config": {
                    "username": "{{ .mqtt_username }}",
                    "password": "{{ .mqtt_password }}",
                    "broker": "{{ .mqtt_broker }}"
                }
            },
            {
                "type": "mqtt_homeassistant",
                "config": {
                    "log_level": "{{ .mqtt_ha_log_level }}"
                }
            }
        ]
    }
}