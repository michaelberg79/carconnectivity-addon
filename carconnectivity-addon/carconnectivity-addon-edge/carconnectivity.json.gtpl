 {
    "carConnectivity": {
        "log_level": "{{ .log_level }}",
        "connectors": [
            {
                {{- if or (eq .connector_type_brand1 "seat") (eq .connector_type_brand1 "cupra") }}
                    "type": "seatcupra",
                {{- else }}
                    "type": "{{ .connector_type_brand1 }}",
                {{- end }}
                "config": {
                    {{- if or (eq .connector_type_brand1 "seat") (eq .connector_type_brand1 "cupra") }}
                        "brand": "{{ .connector_type_brand1 }}",
                    {{- end }}
                    "username": "{{ .connector_username_brand1 }}",
                    "password": "{{ .connector_password_brand1 }}",
                    "interval": {{ .connector_interval_brand1 }},
                    "spin": "{{ .connector_spin_brand1 }}",
                    "api_log_level": "{{ .api_log_level }}"
                }
            }
            {{- if .connector_username_brand2 }}
            ,
            {
                {{- if or (eq .connector_type_brand2 "seat") (eq .connector_type_brand2 "cupra") }}
                    "type": "seatcupra",
                {{- else }}
                    "type": "{{ .connector_type_brand2 }}",
                {{- end }}
                "connector_id": "{{ .connector_type_brand2 }}2",
                "config": {
                    {{- if or (eq .connector_type_brand2 "seat") (eq .connector_type_brand2 "cupra") }}
                        "brand": "{{ .connector_type_brand2 }}",
                    {{- end }}
                    "username": "{{ .connector_username_brand2 }}",
                    "password": "{{ .connector_password_brand2 }}",
                    "interval": {{ .connector_interval_brand2 }},
                    "spin": "{{ .connector_spin_brand2 }}",
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
                    "port": {{ .mqtt_port }},
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