# Order System

Este projeto é uma aplicação de exemplo que implementa um sistema de pedidos utilizando os princípios da **Clean Architecture**. O objetivo é demonstrar uma arquitetura escalável e bem organizada, com suporte a múltiplas interfaces de comunicação e eventos assíncronos.

---

## 🛠 Tecnologias Utilizadas

- **Linguagem**: [Go (Golang)](https://golang.org/)
- **Banco de Dados**: MySQL
- **Mensageria**: RabbitMQ

### 📦 Frameworks e Bibliotecas

- [gqlgen](https://github.com/99designs/gqlgen): Para criação da API GraphQL.
- [gRPC](https://grpc.io/): Para comunicação remota eficiente e estruturada.
- [net/http](https://pkg.go.dev/net/http): Para criação da API REST.
- [amqp](https://github.com/streadway/amqp): Cliente RabbitMQ para Go.
- [go-sql-driver/mysql](https://github.com/go-sql-driver/mysql): Driver MySQL para Go.

---

## 🧱 Estrutura do Projeto

A estrutura do projeto segue uma organização em camadas, com separação clara de responsabilidades:

```
order-system/
│
├── cmd/
│   └── ordersystem/         # Ponto de entrada da aplicação
│
├── internal/
│   ├── event/handler/       # Handlers para eventos assíncronos via RabbitMQ
│   ├── infra/
│   │   ├── graph/           # Implementação do servidor GraphQL
│   │   ├── grpc/            # Implementação do servidor gRPC
│   │   └── web/             # Implementação do servidor REST
│
├── pkg/
│   └── events/              # Lógica de despacho de eventos
```

---

## ⚙️ Configuração

### 🔒 Arquivo `.gitignore`

O projeto ignora arquivos relacionados ao Docker:

```
.docker/
```

### 📂 Configuração do Banco de Dados

As configurações do banco de dados são carregadas a partir de um arquivo de configuração. Exemplo:

```ini
DBDriver=mysql
DBUser=root
DBPassword=senha
DBHost=localhost
DBPort=3306
DBName=orders
```

---

## 🔄 Comunicação entre Módulos

O sistema foi projetado para ser extensível e suportar múltiplos protocolos de comunicação:

- **REST**: Interfaces HTTP usando `net/http`
- **gRPC**: Comunicação de alta performance entre serviços
- **GraphQL**: Consultas flexíveis para o cliente
- **RabbitMQ**: Utilizado para eventos assíncronos como criação de pedidos e notificações

---

## 🚀 Como Rodar o Projeto

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/order-system.git
cd order-system
```

2. Configure o `.env` ou arquivo de configuração com os dados do banco.

3. Suba o RabbitMQ e o Mysql via Docker:

```bash
docker-compose up -d
```
4. Após subir o container crie a tabela orders no banco de dados:

```sql
CREATE TABLE orders (id varchar(255) NOT NULL, price float NOT NULL, tax float NOT NULL, final_price float NOT NULL, PRIMARY KEY (id))
```

5. Execute a aplicação:

```bash
go run cmd/ordersystem/main.go wire_gen.go
```

---

## 📊 Possibilidades de Expansão

- Suporte a autenticação e autorização
- Deploy com Docker e Kubernetes

---

## 🙌 Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir _issues_, enviar _pull requests_ ou sugerir melhorias.

---

## ✉️ Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

