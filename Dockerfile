FROM kabiraneja/ubuntu-java-maven
EXPOSE 9091
COPY demo-2.jar /
# RUN cd /root && java -jar demo-1-build.jar
ENTRYPOINT ["java","-jar","demo-2.jar"]
