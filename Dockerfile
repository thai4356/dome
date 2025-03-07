FROM maven:3.9.9-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:21-slim
COPY --from=build /target/demo123-0.0.1-SNAPSHOT.jar demo123.jar/
EXPOSE 8080
ENTRYPOINT ["java","-jar","demo123.jar"]