FROM ruby:2.6.6

RUN apt-get update -qq \
 && apt-get install -y build-essential libpq-dev nodejs 

WORKDIR /var/www/redmine
# download redmine
RUN wget -O /var/www/redmine.zip https://www.redmine.org/releases/redmine-4.1.1.zip \
    && unzip '/var/www/redmine.zip' -d /var/www \
    && cp -r /var/www/redmine-4.1.1/* /var/www/redmine \
    && rm -r /var/www/redmine-4.1.1 \
    && rm /var/www/redmine.zip || true;

RUN mkdir /var/www/redmine/pids

# Adding gems
RUN gem install mysql2 \
    && bundle install --jobs 20 --retry 5

# Set working directory

COPY database.yml config/database.yml
COPY puma.rb config/puma.rb
COPY entrypoint.sh entrypoint.sh
# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 

EXPOSE 3000
ENTRYPOINT [ "./entrypoint.sh" ]
