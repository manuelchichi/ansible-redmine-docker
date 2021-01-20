FROM ruby:2.6.6

RUN apt-get update -qq \
 && apt-get install -y build-essential libpq-dev nodejs 

# download redmine
RUN wget -O /var/www/redmine.zip https://www.redmine.org/releases/redmine-4.1.1.zip \
    && unzip '/var/www/redmine.zip' -d /var/www/redmine \
    && rm /var/www/redmine.zip || true;

# Set working directory
WORKDIR /var/www/redmine

COPY docker/redmine/database.yml config/database.yml
COPY docker/redmine/puma.rb config/puma.rb
COPY docker/redmine/entrypoint.sh entrypoint.sh
# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 

# Adding gems
RUN gem install mysql2 \
    && bundle install --jobs 20 --retry 5

EXPOSE 3000
ENTRYPOINT [ "entrypoint.sh" ]
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]