# 1. Criar arquivo de política de segurança (Falar o que a função pode fazer)
# 2. Attachar a role para nossa lambda

aws --version

ROLE_NAME=lambda-example
NODEJS_VERSION=nodejs16.x
FUNCTION_NAME=hello-cli

mkdir -p logs

aws iam create-role \
  --role-name $ROLE_NAME \
  --assume-role-policy-document file://policies.json \
  | tee logs/1.role.log

POLICY_ARN=$(cat logs/1.role.log | jq -r .Role.Arn)

# 3. Criar arquivo com código da função
# 4. Zipar o projeto

zip function.zip index.js

# 5. Criar a função lambda

aws lambda create-function \
  --function-name $FUNCTION_NAME \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime $NODEJS_VERSION \
  --role $POLICY_ARN \
  | tee logs/2.lambda-create.log

sleep 1

# 6. Invoke lambda!

aws lambda invoke \
  --function-name $FUNCTION_NAME logs/3.lambda-exec.log \
  --log-type Tail \
  --query 'LogResult' \
  --output text | base64 -d

# Exemplo de Post
aws lambda invoke \
  --function-name $FUNCTION_NAME logs/3.lambda-exec.log \
  --log-type Tail \
  --query 'LogResult' \
  --cli-binary-format raw-in-base64-out \
  --payload '{"name": "Luiz"}' \
  --output text | base64 -d

# 7. Para atualizar a função, basta zipar novamente e executar o comando abaixo:

zip function.zip index.js

aws lambda update-function-code \
  --zip-file fileb://function.zip \
  --function-name $FUNCTION_NAME \
  --publish \
  | tee logs/4.lambda-update.log

# 8. Para remover a função, basta executar o comando abaixo:

aws lambda delete-function \
  --function-name $FUNCTION_NAME

# 9. Remover a role

aws iam delete-role \
  --role-name $ROLE_NAME