FROM alpine

#ARG USER=wandelbots
#ENV HOME /home/$USER

# Add new user
#RUN adduser -D $USER

# Install minimal webserver
RUN apk update \
    && apk add lighttpd \
    && rm -rf /var/cache/apk/*

# Copy html template and ipc-monitor and fix permissions
COPY ./ipc-monitor /var/www/localhost/htdocs
RUN chmod +x /var/www/localhost/htdocs/ipc-monitor

# Runtime
ENTRYPOINT ["sh", "-c", "/var/www/localhost/htdocs/ipc-monitor"]

EXPOSE 80

# set unprivileged user
#USER $USER
#WORKDIR $HOME
