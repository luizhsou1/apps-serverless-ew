# Instalar Serveless Framework
npm i -g serverless@3.16.0

# usar o comando abaixo para criar um projeto
sls

# Sempre que mudar o código usa:
sls deploy

# Obter infos do serverless project
sls info

# Invocar localmente
sls invoke local -f hello1

# Invocar em produção
sls invoke -f hello1

# ver o serverless console
sls --console

# matar todo mundo!!!
sls remove