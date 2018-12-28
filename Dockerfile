FROM openjdk:8-jre-slim

# Add the jar with all the dependencies
ADD  build/libs/test.jar /usr/share/tag/container-test.jar

# Add the suite xmls
ADD my_test.xml /usr/share/tag/order-module.xml

# Command line to execute the test
# Expects below ennvironment variables
# BROWSER = chrome / firefox
# MODULE  = order-module / search-module
# SELENIUM_HUB = selenium hub hostname / ipaddress

ENTRYPOINT /usr/bin/java -cp /usr/share/tag/container-test.jar -DseleniumHubHost=$SELENIUM_HUB -Dbrowser=$BROWSER org.testng.TestNG /usr/share/tag/$MODULE