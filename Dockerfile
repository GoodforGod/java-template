FROM bellsoft/liberica-openjre-alpine-musl:17.0.1

ARG APP_DIR=/opt/application
ARG BUILD_DIR=build/libs

RUN mkdir -p "$APP_DIR"
COPY $BUILD_DIR/*all.jar $APP_DIR/application.jar

EXPOSE 8080/tcp
ENTRYPOINT ["java", \
            "-Duser.timeZone=Europe/Moscow",  \
            "-Dfile.encoding=UTF-8", \
            "-Xss256k", \
            "-Xms32m", \
            "-XX:+UnlockExperimentalVMOptions", \
            "-XX:+UseShenandoahGC", \
            "-XX:+ExitOnOutOfMemoryError", \
            "-XX:+UseContainerSupport", \
            "-XX:+CompactStrings", \
            "-jar", \
            "/opt/application/application.jar" ]