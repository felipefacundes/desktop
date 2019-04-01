# Deixe o seu computador mais rápido

> Deixe o seu computador, muito mais rápido. Baixando totalmente a prioridade de uso da memória swap

##### Edite o arquivo /etc/sysctl.conf

    sudo nano /etc/sysctl.conf

> E inclua

    vm.swappiness=0
