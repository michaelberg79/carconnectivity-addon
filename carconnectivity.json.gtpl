{
    "carConnectivity": {
        "log_level": "{{ .log_level }}",
        "connectors": [
            {{- $first := true }}
            {{- if .connector_username_seatcupra }}
            {{- if not $first }},{{ end }}
            {{- $first = false }}
            {
                "type": "seatcupra",
                "config": {
                    "brand": "{{ .connector_brand_seatcupra }}",
                    "username": "{{ .connector_username_seatcupra }}",
                    "password": "{{ .connector_password_seatcupra }}",
                    "interval": {{ .connector_interval_seatcupra }},
                    "spin": "{{ .connector_spin_seatcupra }}",
                    "api_log_level": "{{ .api_log_level }}"
                }
            }
            {{- end }}
            {{- if .connector_username_skoda }}
            {{- if not $first }},{{ end }}
            {{- $first = false }}
            {
                "type": "skoda",
                "config": {
                    "username": "{{ .connector_username_skoda }}",
                    "password": "{{ .connector_password_skoda }}",
                    "interval": {{ .connector_interval_skoda }},
                    "spin": "{{ .connector_spin_skoda }}",
                    "api_log_level": "{{ .api_log_level }}"
                }
            }
            {{- end }}
            {{- if .connector_username_vw }}
            {{- if not $first }},{{ end }}
            {{- $first = false }}
            {
                "type": "vw",
                "config": {
                    "username": "{{ .connector_username_vw }}",
                    "password": "{{ .connector_password_vw }}",
                    "interval": {{ .connector_interval_vw }},
                    "spin": "{{ .connector_spin_vw }}",
                    "api_log_level": "{{ .api_log_level }}"
                }
            }
            {{- end }}
            {{- if .connector_username_trionity }}
            {{- if not $first }},{{ end }}
            {{- $first = false }}
            {
                "type": "trionity",
                "config": {
                    "username": "{{ .connector_username_trionity }}",
                    "password": "{{ .connector_password_trionity }}",
                    "interval": {{ .connector_interval_trionity }},
                    "spin": "{{ .connector_spin_trionity }}",
                    "api_log_level": "{{ .api_log_level }}"
                }
            }
            {{- end }}
        ],
        "plugins": [
            {
                "type": "mqtt",
                "config": {
                    "username": "{{ .mqtt_username }}",
                    "password": "{{ .mqtt_password }}",
                    "broker": "{{ .mqtt_broker }}",
                    "log_level": "{{ .log_level }}"
                }
            },
            {
                "type": "webui",
                "config": {
                    "username": "{{ .connector_username_webui }}", 
                    "password": "{{ .connector_password_webui }}",
                    "log_level": "{{ .log_level }}"
                }
            },
            {
                "type": "mqtt_homeassistant",
                "config": {
                    "log_level": "{{ .log_level }}"
                }
            }
        ]
    }
}
