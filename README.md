# 🌐 Site Estático na AWS S3 com Terraform

Este repositório contém um projeto de **Infraestrutura como Código (IaC)** para provisionar e gerenciar um site estático na **Amazon S3** usando **Terraform**.

---

## ✨ O que este Projeto Faz

Este projeto automatiza a implantação de um site estático, configurando:

* **Bucket S3**: Cria um bucket S3 para hospedagem de site estático.
* **Permissões**: Configura o **S3 Public Access Block** e a **Política de Bucket S3** para permitir acesso público ao site de forma segura.
* **Upload de Conteúdo**: Envia os arquivos HTML e CSS para o bucket S3, com detecção de mudanças nos arquivos.

---

## 🛠️ Tecnologias Utilizadas

* **AWS S3**: Serviço de armazenamento de objetos da Amazon Web Services.
* **Terraform**: Ferramenta de Infraestrutura como Código (IaC) da HashiCorp.

---

## ⚙️ Pré-requisitos

Para executar este projeto, você precisará de:

* **Conta AWS Ativa**: Com credenciais configuradas (via AWS CLI).
* **AWS CLI**: Instalada.
* **Terraform CLI**: Instalada (versão 1.x+).

---

## 🚀 Como Usar

Siga estes passos para implantar o site:

1.  **Clone o Repositório**:
   

2.  **Inicialize o Terraform**:

    ```bash
    terraform init
    ```

3.  **Gere o Plano de Execução**:

    ```bash
    terraform plan
    ```
    Forneça uma região da AWS quando solicitado.
    Forneça um `bucket_name` **globalmente único** quando solicitado.

4.  **Aplique as Mudanças**:

    ```bash
    terraform apply
    ```
    Forneça uma região da AWS quando solicitado.
    Forneça um `bucket_name` **globalmente único** quando solicitado.
    Confirme com `yes`. A **URL do site** será exibida ao final.

5.  **Acesse o Site**:
    Copie a `website_url` do terminal e acesse no navegador.

---

## 🧹 Limpeza (Removendo a Infraestrutura)

Para destruir todos os recursos criados e evitar custos:

```bash
terraform destroy
```

Confirme com 'yes'
