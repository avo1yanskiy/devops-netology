[Unit]
Description=node_exporter
Documentation=https://github.com/prometheus/node_exporter/tree/master/docs
After=network.target
Wants=network.target
 
[Service]
Type=notify
EnvironmentFile=-/etc/crypto-policies/back-ends/opensshserver.config
EnvironmentFile=-/etc/sysconfig/sshd
ExecStart=/usr/sbin/sshd -D $OPTIONS $CRYPTO_POLICY
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=42s
 
[Install]
WantedBy=multi-user.target







# https://newadmin.ru/sozdanie-prostogo-systemd-unit/
# https://linux-notes.org/pishem-systemd-unit-fajl/
#
#
#
