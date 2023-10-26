# Use a imagem Ruby on Rails
FROM ruby:3.0.2

# Instale as dependências do sistema
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Configure a pasta de trabalho
WORKDIR /app

# Copie o Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instale as gems
RUN bundle install

# Copie o código fonte do aplicativo para o contêiner
COPY . .

# Exponha a porta usada pelo aplicativo (por padrão, o Rails roda na porta 3000)
EXPOSE 3000

# Inicialize o aplicativo
CMD "./start.sh"
