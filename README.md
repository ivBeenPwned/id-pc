# id-pc remotely
Script feito em Powershell para listar informações remotas sobre hardware de outros computadores disponíveis na rede.
O script invocará um comando ao Controlador de Domínio do Active Directory para consultar estas informações de computadores remotos, pois em alguns casos, podem haver computadores que estão em faixas diferentes da rede onde o script será executado e não estarem devidamente configurados pelo Administrador ou configurações padrões.

IMPORTANTE: O USUÁRIO QUE EXECUTARÁ O SCRIPT DEVERÁ TER PRIVILÉGIOS ADMINISTRATIVOS OU PERMISSÕES RELEVANTES PARA INVOCAR COMANDOS EM ALGUM DC DO AD.

USOS:

NORMAL: uso normal do script que facilita a leitura e pode ser salvo como um script .ps1 convencional.

ONE LINE: facilita o uso do copia e cola no prompt de comando do Powershell para execução do script.

B64: script codificado em base64 para execução do mesmo (de forma eficaz) através de outro terminal, como por exemplo o CMD. Ainda também facilita no escape de caracteres como ["-'()] durante a execução do script, pois os mesmos serão decodificados durante a execução e não na leitura pelo prompt.
