# Library JSP Spring Boot App

This sample Spring Boot application demonstrates managing two entities: Authors and Books using JSP views.

Features
- JPA entities: Author (1..*) Book
- Create, Read, Update operations for both entities via JSP forms
- Custom repository query that performs an inner join (Book -> Author)
- Sample data: 10 Authors and 10 Books inserted at startup
- Basic unit test for service layer (Mockito)

Run locally
1. Ensure you have Java 11+ and Maven installed.
2. From the project root run:

```powershell
cd \workspace\library-jsp
mvn clean package
mvn spring-boot:run
```

If you don't have `mvn` available, import the project into your IDE (IntelliJ, Eclipse) and run `LibraryApplication` as a Spring Boot app.

Access
- Authors list: http://localhost:8080/authors
- Books list (and join view): http://localhost:8080/books
- H2 Console: http://localhost:8080/h2-console (JDBC URL: `jdbc:h2:mem:libdb`)

Notes
- The project is packaged as a WAR (so JSPs are supported). The embedded Tomcat is used by Spring Boot.
- If Maven is not installed in your environment, use your IDE to run the app.
