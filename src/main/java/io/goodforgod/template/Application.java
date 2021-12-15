package io.goodforgod.template;

import java.util.Collection;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Application {

    static {
        final String buildNumber = Application.class.getPackage().getImplementationVersion();
        System.setProperty("BUILD_NUMBER", Optional.ofNullable(buildNumber).orElse("1"));
    }

    public static void main(String[] args) {
        final Logger logger = LoggerFactory.getLogger(Application.class);
        final Collection<String> expected = Set.of("SECURITY_ENABLED");

        final Map<String, String> envs = System.getenv();
        for (String env : expected) {
            logger.debug("{}={}", env, envs.get(env));
        }
    }
}
