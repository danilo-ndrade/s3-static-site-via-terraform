# Configura aws
provider "aws" {
  region = var.aws_region
}

# Cria um bucket utilizando a variavel bucket_name de variables.tf
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  tags = {
    Name        = "StaticWebsiteBucket"
    Environment = "Dev"
  }
}

# COnfigura Public Acess Block para permitir acesso público e uso de policies
resource "aws_s3_bucket_public_access_block" "public_acess_block" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Habilita hospedagem de site estático no S3
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

#   error_document {
#     key = "error.html" 
#   }
}

# Define uma policy para o bucket que permite leitura dos objetos 
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
  depends_on = [aws_s3_bucket_public_access_block.public_acess_block]
}

# Faz upload de index.html
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = "${var.website_source_path}/index.html"
  content_type = "text/html"
  # Permite que o terraform detecte se houve alguma mudança no arquivo numa execução subsequente
  etag         = filemd5("${var.website_source_path}/index.html")
}

# Faz upload de styles.css
resource "aws_s3_object" "style_css" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "style.css"
  source = "${var.website_source_path}/style.css"
  content_type = "text/css"
  # Permite que o terraform detecte se houve alguma mudança no arquivo numa execução subsequente
  etag         = filemd5("${var.website_source_path}/style.css")
}