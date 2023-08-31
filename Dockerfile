FROM openjdk:11
EXPOSE 9090
COPY demo-1-build.jar .
ENTRYPOINT ["java","-jar","/demo-1-build.jar"]
