resource "aws_sqs_queue" "process" {
# Essa fila SQS queue é usada para processar os vídeos que o usuário envia
  name  = "process"
}

resource "aws_sqs_queue" "processed" {
# Essa fila SQS queue é usada para armazenar os vídeos que já foram processados
  name  = "processed"
}