package io.template;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

public class Application {

    static {
        final String buildNumber = Application.class.getPackage().getImplementationVersion();
        System.setProperty("BUILD_NUMBER", Optional.ofNullable(buildNumber).orElse("1"));
    }

    public static void main(String[] args) {
        final Logger logger = LoggerFactory.getLogger(Application.class);
        final Collection<String> expected = List.of("SECURITY_ENABLED");

        System.getenv().entrySet().stream()
                .filter(e -> expected.contains(e.getKey()))
                .forEach(e -> logger.debug("{}={}", e.getKey(), e.getValue()));
    }
}
