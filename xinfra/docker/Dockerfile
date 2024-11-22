FROM eclipse-temurin:21-jdk-alpine
VOLUME /tmp
RUN addgroup -S istory && adduser -S istory -G istory
USER istory
WORKDIR /home/istory
#COPY build/libs/*.jar /home/istory/istory.jar
COPY *.jar /home/istory/istory.jar
ENTRYPOINT ["java","-jar","/home/istory/istory.jar"]
# docker run p 8080:8080 -e JAVA_OPTIONS="--Xms1024m --Xmx1024"