# Base Image
FROM ruby:2.7

# Switching to root user
USER root

# Installing required libraries
RUN apt-get update -qq
RUN apt-get install -y build-essential curl git nodejs libmariadb-dev figlet

# Installing gems in gems's playground
RUN mkdir /gem_playground
WORKDIR /gem_playground

RUN gem install bundler
COPY Gemfile* ./
#RUN bundle update --bundler
RUN bundle install

RUN mkdir -p /app
WORKDIR /app
COPY . .

# Adding a non root user
RUN groupadd --system ims
RUN useradd -u 1001 --system ims -g ims -d /home/ims -m -s /bin/bash
RUN chown -R ims /app
RUN chmod -R 777 /app

# Adding figlet :)
RUN echo "figlet -cl 'ims'" >> /home/ims/.bashrc

# Switching to non-root user 'ims'
USER ims

# Exposing 3000 port
EXPOSE 3000

ENTRYPOINT ["sh", "./config/docker/startup.sh"]