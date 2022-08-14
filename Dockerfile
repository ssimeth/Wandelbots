#############################################
### Dockerfile for Wandelbots ipc-monitor ###
#############################################

FROM alpine

#ARG USER=wandelbots
#ENV HOME /home/$USER

# Add new user
#RUN adduser -D $USER

# Install webserver
RUN apk update \
    && apk add lighttpd \
    && rm -rf /var/cache/apk/*

# Copy ipc-monitor 
COPY ./ipc-monitor /ipc-monitor

# Fix permissions
RUN chmod +x /ipc-monitor

# set unprivileged user
#USER $USER
#WORKDIR $HOME

# Runtime
ENTRYPOINT ["sh", "-c", "/ipc-monitor"]

# Expose webserver port
EXPOSE 80
