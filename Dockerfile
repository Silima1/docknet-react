# Estágio de construção
FROM node:alpine as builder

WORKDIR /app

# Copie apenas o arquivo package.json inicial para aproveitar o cache de camadas
COPY package.json .

# Instale as dependências, incluindo o preset do Babel
RUN npm install
RUN npm install @babel/preset-react --save-dev

# Copie todo o código-fonte
COPY . .

# Construa o aplicativo
RUN npm run build

# Estágio de produção
FROM nginx
EXPOSE 80

# Copie os arquivos de construção do estágio de construção para o local apropriado no contêiner Nginx
COPY --from=builder /app/build /usr/share/nginx/html
