# tc5-infra
Este projeto contém os manifestos de infraestrutura como código do Tech Challenge 5, escritos em Terraform para provisionamento dos recursos da AWS, como:
- S3
- Cognito
- DynamoDB
- EKS

### Arquitetura técnica

![arquitetura-tecnica](docs/image/arquitetura-process-video2.png)

#### Pré-requisitos e configuração de ambiente

- Terraform
- Git
- Credenciais AWS

#### Passos para implementar o projeto usando uma conta da AWS Academy:

1. Inicie o laboratório e visualize as credenciais da AWS Academy.
2. Clique no botão "AWS Details" e, em seguida, pressione o botão "AWS CLI" para exibir as credenciais.
3. Copie e cole o conteúdo das credenciais diretamente no terminal no diretório `~/.aws/credentials`.
4. Atualize a opção "Settings > Variable Set" nos workspaces do HCP infra-kitchen com os valores das credenciais AWS: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` e `AWS_SESSION_TOKEN`.

#### Comandos utilizados

- `terraform init` - comando usado para inicializar o Terraform no diretório local;
- `terraform fmt` - formata os arquivos `.tf` corrigindo a indentação;
- `terraform validate` - verifica se uma configuração é sintaticamente válida e internamente consistente, independentemente de quaisquer variáveis fornecidas ou estado existente;
- `terraform plan` - cria o plano de execução para visualizar as alterações na infraestrutura do provedor.