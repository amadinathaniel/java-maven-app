FROM openjdk:8-jre-latest

EXPOSE 8080

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

CMD ["java" "-jar" "java-maven-app-*.jar"]
