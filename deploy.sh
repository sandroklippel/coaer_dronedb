sudo cp docker-dronedb.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable docker-dronedb.service
sudo systemctl start docker-dronedb.service
sudo systemctl status docker-dronedb.service  # Verifica o status atual
sudo systemctl is-enabled docker-dronedb.service  # Verifica se está habilitado