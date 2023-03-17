FROM ruby

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
apt update && apt install -y nodejs ruby-dev nginx && \
npm install -g @shopify/cli @shopify/theme 

EXPOSE 3456
EXPOSE 9292

WORKDIR /usr/src/app
COPY ./nginx/shopify.conf /etc/nginx/sites-available/default
CMD ["/usr/src/app/entrypoint.sh"]
