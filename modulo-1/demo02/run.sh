#instalar
npm i -g serverless

# sls inicializar

sls

# sempre fazer o deploy no ambiente antes de tudo para verficar se está com ambiente ok
sls deploy

# invocar na AWS
sls invoke -f hello

# invocar local
sls invoke local -f hello --log

# configurar dashboard
sls 

# tail logs
sls logs -f hello --tail

# remove everything
sls remove