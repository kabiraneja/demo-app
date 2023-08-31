FROM openjdk:11
EXPOSE 9090
ADD target/demo-1-build.jar demo-1-build.jar
ENTRYPOINT ["java","-jar","/demo-1-build.jar"]
