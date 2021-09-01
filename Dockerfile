FROM adoptopenjdk/openjdk16-openj9:jre-16_36_openj9-0.25.0-alpine

ARG APP_DIR=/application
ARG JAR_DIR=build/libs

RUN mkdir -p "$APP_DIR"

COPY $JAR_DIR/*.jar $APP_DIR/app.jar

EXPOSE 8080/tcp

CMD ["/bin/sh","-c","java -jar -Dfile.encoding=UTF-8 -Xms32m -Xss512k -XX:+ExitOnOutOfMemoryError -XX:+CompactStrings -XX:+UseContainerSupport /application/app.jar" ]
