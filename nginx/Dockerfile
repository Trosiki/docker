FROM nginx:latest

# Copy of Startup.sh
COPY ./scripts/startup.sh /etc/startup.sh
RUN chmod 777 /etc/startup.sh

# Set our TimeZone 
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 80 4200

ENTRYPOINT ["/etc/startup.sh"]
