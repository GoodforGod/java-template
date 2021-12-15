FROM bellsoft/liberica-openjre-alpine-musl:17.0.1

ARG APP_DIR=/application
ARG JAR_DIR=build/libs

RUN mkdir -p "$APP_DIR"
ADD $JAR_DIR/*.jar $APP_DIR/app.jar

EXPOSE 8080/tcp

CMD ["/bin/sh","-c","java -jar -Dfile.encoding=UTF-8 -Xms32m -Xss512k -XX:+ExitOnOutOfMemoryError -XX:+CompactStrings -XX:+UseContainerSupport -XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC /opt/application/app.jar" ]