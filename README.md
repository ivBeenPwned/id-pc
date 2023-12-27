# id-pc remotely
Script feito em Powershell para listar informações remotas sobre hardware de outros computadores disponíveis na rede.
O script invocará um comando ao Controlador de Domínio do Active Directory para consultar estas informações de computadores remotos, pois em alguns casos, podem haver computadores que estão em faixas diferentes da rede onde o script será executado e não estarem devidamente configurados pelo Administrador ou configurações padrões.

IMPORTANTE: O USUÁRIO QUE EXECUTARÁ O SCRIPT DEVERÁ TER PRIVILÉGIOS ADMINISTRATIVOS OU PERMISSÕES RELEVANTES PARA INVOCAR COMANDOS EM ALGUM DC DO AD.
