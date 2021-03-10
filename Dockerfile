#
# Build stage
#
FROM maven AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package


#
# Package stage
#
FROM busybox:latest
COPY --from=build /home/app/target/Stateful-Tracker-1.0.0-SNAPSHOT.war Stateful-Tracker-1.0.0-SNAPSHOT.war 
CMD "tail" "-f" "/dev/null"