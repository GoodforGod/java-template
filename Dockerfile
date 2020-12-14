FROM adoptopenjdk/openjdk14-openj9:alpine-slim

ARG APP_DIR=/application
ARG JAR_DIR=build/libs

RUN mkdir -p "$APP_DIR"

ADD $JAR_DIR/*.jar $APP_DIR/app.jar

EXPOSE 8080/tcp

CMD ["/bin/sh","-c","java -jar -Dfile.encoding=UTF-8 /application/app.jar", "-XX:+UseContainerSupport"]

