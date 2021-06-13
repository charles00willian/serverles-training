# 1 passo crar arquivo de politicas de segurança
# 2 criar role de seguranca

aws iam create-role \
  --role-name lambda-exemplo \
  --assume-role-policy-document file://policies.json \
  | tee logs/role.log

# 3 criar o arquivo zip com conteudo js
zip function.zip index.js

aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs12.x \
  --role arn:aws:iam::808809474730:role/lambda-exemplo \
  | tee logs/lambda-create.log

# 4 invoke lambda

aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

# -- sempre que atualizar lembre-se de zipar
zip function.zip index.js

# -- atualizar lambda
aws lambda update-function-code \
  --zip-file fileb://function.zip \
  --function-name hello-cli \
  --publish \
  | tee logs/lambda-update.log

# -- invake again

aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-update.log

# remover function
aws lambda delete-function \
  --function-name hello-cli 

aws iam delete-role \
  --role-name lambda-exemplo