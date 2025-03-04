{
    "carConnectivity": {
        "log_level": "{{ .log_level }}",
        "connectors": [
            {
                "type": "{{ .connector_type }}",
                "config": {
                    "username": "{{ .connector_username }}",
                    "password": "{{ .connector_password }}",
                    "interval": {{ .connector_interval }},
                    "spin": "{{ .connector_spin }}"
                }
            }
        ],
        "plugins": [
            {
                "type": "mqtt",
                "config": {
                    "username": "{{ .mqtt_username }}",
                    "password": "{{ .mqtt_password }}",
                    "broker": "{{ .mqtt_broker }}"
                }
            },
            {
                "type": "mqtt_homeassistant",
                "config": {
                }
            }
        ]
    }
}