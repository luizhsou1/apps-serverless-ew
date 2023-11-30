aws s3api create-bucket --bucket lh-hello-bucket

aws s3 cp hello.txt s3://lh-hello-bucket
aws s3 cp s3://lh-hello-bucket/hello.txt h.txt

aws s3 rm s3://lh-hello-bucket --recursive # Apagar todos os arquivos do bucket
aws s3api delete-bucket --bucket lh-hello-bucket # Apagar o bucket
