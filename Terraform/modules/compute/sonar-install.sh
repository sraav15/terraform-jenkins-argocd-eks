#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/sonar-install.log)
exec 2>&1

echo "===== Starting SonarQube Installation ====="

# Update OS
dnf update -y

# Install required packages
dnf install -y \
  java-21-amazon-corretto-devel \
  wget \
  unzip

# Verify Java
java -version

# Configure kernel parameters
cat >/etc/sysctl.d/99-sonarqube.conf <<EOF
vm.max_map_count=524288
fs.file-max=131072
EOF

sysctl --system

# Create sonar user
if ! id sonar >/dev/null 2>&1; then
    useradd --system --home-dir /opt/sonarqube --shell /bin/bash sonar
fi

# Download SonarQube
cd /opt

echo "Downloading SonarQube..."

wget -O sonarqube.zip \
https://binaries.sonarsource.com/CommercialDistribution/sonarqube-developer/sonarqube-developer-2026.1.3.123084.zip

echo "Extracting SonarQube..."

unzip -q sonarqube.zip

mv sonarqube-developer-2026.1.3.123084 sonarqube

rm -f sonarqube.zip

# Permissions
chown -R sonar:sonar /opt/sonarqube

# Create systemd service
cat >/etc/systemd/system/sonarqube.service <<EOF
[Unit]
Description=SonarQube Service
After=network.target

[Service]
Type=forking

User=sonar
Group=sonar

ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
ExecReload=/opt/sonarqube/bin/linux-x86-64/sonar.sh restart

Restart=always
RestartSec=10

LimitNOFILE=65536
LimitNPROC=4096

[Install]
WantedBy=multi-user.target
EOF

chmod 644 /etc/systemd/system/sonarqube.service

systemctl daemon-reload
systemctl enable sonarqube
systemctl start sonarqube

echo "===== SonarQube Installation Complete ====="

systemctl status sonarqube --no-pager || true