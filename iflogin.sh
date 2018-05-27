#!/bin/bash

echo "Informe usuario:"
read user

echo "informe senha:"
read pass

clear
echo "Conectando...."

wget --post-data="login=$user&password=$pass" 192.168.15.254 > /dev/null

ping -qc 1 4.2.2.2 > /dev/null

if [ $? = 0 ]
then
   clear
   echo -e "\n $user esta conectado"
   echo -e "\n Tempo de Conexão: 4 horas"
   rm -rf index.html 2> /dev/null
else
   clear
   echo -e "\n $user não está conectado"
   echo -e "\n Sugestoes:"
   echo -e "\n - Execute o ping no ip do gateway"
   echo -e "\n - Execute ifdown <interface> | ifup <interface> "
   echo -e "\n - Reinicie o servico: systemctl restart networking"
   echo -e "\n - Confira as configuracoes de rede"
fi
