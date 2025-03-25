version: '3.8'
services:
    prometheus:
        image: prom/prometheus
        container-name: prometheus
        ports:
            - 9091:9090
        command: --config.file=/etc/prometheus/prometheus.yml
        volumes:
            - ./prometheus.yml:/etc/prometheus/prometheus.yml

    grafana:
        image: grafana/grafana
        container-name: grafana
        restart: always
        ports:
            - 3000:3000
        enviroment:
            - GF_SECURITY_ADMIN_USER=admin
            - GF_SECURITY_ADMIN_PASSWORD=admin
