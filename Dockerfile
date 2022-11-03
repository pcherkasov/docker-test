FROM maven:3.8.5-openjdk-17-slim as BUILD
WORKDIR /usr/app
COPY ./src ./src
COPY pom.xml ./
RUN mvn clean package

FROM openjdk:17-jdk-slim
COPY --from=build /usr/app/target/dockerTest.jar ./
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "dockerTest.jar"]
