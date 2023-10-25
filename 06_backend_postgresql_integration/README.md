# Deploy Backend with PostgreSQL integration

# Table of contents
1. [Task description](#task)
2. [Check PostgreSQL Dependency](#postgresql_dependency)
2. [Database configuration](#db_config)

## Task <a name="task"></a>
Deploy Backend with PostgreSQL integration.

## Check PostgreSQL Dependency <a name="postgresql_dependency"></a>
Make sure you have the PostgreSQL JDBC driver as a dependency in 'pom.xml' file. The JDBC driver enables Java applications to interact with Postgres databases.

For Maven, add the following dependency if needed:

```
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>
```

## Database configuration <a name="db_config"></a>

In its default configuration, Petclinic uses an in-memory database (HSQLDB) which gets populated at startup with data.
A similar setups is provided for MySql and PostgreSQL in case a persistent database configuration is needed.
To run petclinic locally using persistent database, it is needed to change profile defined in application.properties file.

For PostgeSQL database, it is needed to change param "hsqldb" to "postgresql" in string defined in application.properties file:
```
spring.profiles.active=hsqldb,spring-data-jpa
```
```
spring.profiles.active=postgresql,spring-data-jpa
```

 > **Note**
 > `src/main/resources/application.properties`

Before do this, would be good to check properties defined in application-postgresql.properties file.

```
//application-postgresql.properties

spring.datasource.url=jdbc:postgresql://localhost:5432/db_name
spring.datasource.username=username #username of the user with the necessary permissions for the above specified database 
spring.datasource.password=password #password of the user above
spring.datasource.driver-class-name=org.postgresql.Driver
spring.jpa.database=POSTGRESQL
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.hibernate.ddl-auto=none
```

<details>
<summary>ddl-auto property</summary>

The ddl-auto property sets the behavior of Hibernate’s schema generation tool and has five possible values:
- create – On application start-up, drop all tables managed by Hibernate, - then create them from scratch.
- create-drop – On application start-up, create all tables managed by - Hibernate. On shutdown, drop all of them.
- update – On application start-up, update the existing tables to match the schema Hibernate expects if necessary.
- validate – On application start-up, check that the existing tables match the schema Hibernate expects, and throw an exception if they do not match.
- none – Do not perform any automatic schema management.
</details>
<br>

Needed to set ddl-auto to update:
```
spring.jpa.hibernate.ddl-auto=update
```

<details>
<summary>Screenshots</summary>

01
02
...

</details>