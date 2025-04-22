# Etapa de build
FROM golang:1.23 AS builder

WORKDIR /app

# Copiar os arquivos de dependências
COPY go.mod go.sum ./

# Baixar as dependências
RUN go mod download

# Copiar o código-fonte
COPY . .

# Construir o binário
WORKDIR /app/cmd/ordersystem

RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Etapa final
FROM alpine:latest

WORKDIR /root/

# Copiar o binário da etapa de build
COPY --from=builder /app/cmd/ordersystem/main .

COPY --from=builder /app/cmd/ordersystem/.env.example .env

# Expor as portas necessárias
EXPOSE 8000 50051 8080

# Comando para executar a aplicação
CMD ["./main"]