# Setup local environment for backend app

# Table of contents
1. [Task description](#task)
2. [Install Java on macOS](#java__macos)
3. [Install Maven on macOS](#maven__macos)
4. [Running petclinic locally with maven command line](#spring_petclinic)
5. [Build Lifecycle](#build_lifecycle)

## Task <a name="task"></a>

Clone [spring-petclinic-rest](https://github.com/spring-petclinic/spring-petclinic-rest) repo and setup local development environment. Build the app using instructions in repo’s README.md. Make sure to understand build lifecycle and build artefacts.

# Install Java and Maven on Mac OS
[Tutorial link](https://www.digitalocean.com/community/tutorials/install-maven-mac-os)

**1. Downloading Java for Mac OS** <a name="java__macos"></a>

Go to the latest JDK GA release page (https://jdk.java.net/) and download the tar file for Mac OS. Then extract it to the directory of your choice. I prefer to keep my JDK setup at “/Library/Java/JavaVirtualMachines/” directory.

`$ tar -xvf openjdk-21_macos-x64_bin.tar.gz`
`$ sudo mv jdk-21.jdk/ /Library/Java/JavaVirtualMachines/`

**2. Setting Environment Variables - JAVA_HOME and Path**

Open ~/.bash_profile and add the following entries at the end of it.
```
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"
PATH="${JAVA_HOME}/bin:${PATH}"
export PATH
```
You can relaunch the Terminal to apply these profile changes. Or you can also run source .bash_profile command to apply these environment variable changes. 

**3. Verifying the JDK installation**

Open the Terminal and run java -version command. It should show the following output.
```
$ java -version
openjdk version "21" 2023-09-19
OpenJDK Runtime Environment (build 21+35-2513)
OpenJDK 64-Bit Server VM (build 21+35-2513, mixed mode, sharing)
$
```

**4. Download Maven for Mac OS** <a name="maven__macos"></a>

Go to the Maven Download site: https://maven.apache.org/download.cgi
Download the “Binary tar.gz archive” file. After downloading, extract it using the below command.
```
$ tar -xvf apache-maven-3.9.5-bin.tar.gz
```

**5. Setting Maven Environment Variables - M2_HOME and Path**

The next step is to set up the environment variables - M2_HOME and Path. We have to add the Maven bin directory to the Path variable. Open .bash_profile in your favorite text editor and add below lines to the end of it.
```
export M2_HOME="/Users/adinpilavdzija/Downloads/apache-maven-3.9.5"
PATH="${M2_HOME}/bin:${PATH}"
export PATH
```
You can relaunch Terminal to load these profile settings or use source .bash_profile command to apply it.

**6. Verifying the Maven Installation**

Finally, run the mvn -version command to check if Maven is installed successfully.
```
$ mvn -version
Apache Maven 3.9.5 (57804ffe001d7215b5e7bcb531cf83df38f93546)
Maven home: /Users/adinpilavdzija/Downloads/apache-maven-3.9.5
Java version: 21, vendor: Oracle Corporation, runtime: /Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home
Default locale: en_GB, platform encoding: UTF-8
OS name: "mac os x", version: "13.3", arch: "x86_64", family: "mac"
$
```
The output shows maven home location, the JDK it’s using and also the Mac OS version details. Maven is successfully installed in your Mac OS. You are ready to create a maven based Java projects.

## Running petclinic locally with maven command line <a name="spring_petclinic"></a>
```
git clone https://github.com/spring-petclinic/spring-petclinic-rest.git
cd spring-petclinic-rest
./mvnw spring-boot:run
```
You can then access petclinic here: http://localhost:9966/petclinic/

![Swagger screenshot](https://github.com/adinpilavdzija/devops-internship-atlantbh/blob/d286a474e68624e7801d34cff7d92c54ba1583e3/02-setup-local-env-backend/screenshot_backend.png)

# Build Lifecycle <a name="build_lifecycle"></a>

## Build Lifecycle Basics
Maven is based around the central concept of a build lifecycle. What this means is that the process for building and distributing a particular artifact (project) is clearly defined.

For the person building a project, this means that it is only necessary to learn a small set of commands to build any Maven project, and the [POM](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html) will ensure they get the results they desired.

There are three built-in build lifecycles: default, clean and site. The `default` lifecycle handles your project deployment, the `clean` lifecycle handles project cleaning, while the `site` lifecycle handles the creation of your project's web site.


## A Build Lifecycle is Made Up of Phases
Each of these build lifecycles is defined by a different list of build phases, wherein a build phase represents a stage in the lifecycle.

For example, the default lifecycle comprises of the following phases (for a complete list of the lifecycle phases, refer to the Lifecycle Reference):

- `validate` - validate the project is correct and all necessary information is available
- `compile` - compile the source code of the project
- `test` - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
- `package` - take the compiled code and package it in its distributable format, such as a JAR.
- `verify` - run any checks on results of integration tests to ensure quality criteria are met
- `install` - install the package into the local repository, for use as a dependency in other projects locally
- `deploy` - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects.

These lifecycle phases (plus the other lifecycle phases not shown here) are executed sequentially to complete the `default` lifecycle. Given the lifecycle phases above, this means that when the default lifecycle is used, Maven will first validate the project, then will try to compile the sources, run those against the tests, package the binaries (e.g. jar), run integration tests against that package, verify the integration tests, install the verified package to the local repository, then deploy the installed package to a remote repository.


## Usual Command Line Calls
You should select the phase that matches your outcome. If you want your jar, run `package`. If you want to run the unit tests, run `test`.

If you are uncertain what you want, the preferred phase to call is
```
mvn verify
```
This command executes each default lifecycle phase in order (`validate`, `compile`, `package`, etc.), before executing `verify`. You only need to call the last build phase to be executed, in this case, `verify`. In most cases the effect is the same as `package`. However, in case there are integration-tests, these will be executed as well. And during the `verify` phase some additional checks can be done, e.g. if your code written according to the predefined checkstyle rules.

In a build environment, use the following call to cleanly build and deploy artifacts into the shared repository.

```
mvn clean deploy
```
The same command can be used in a multi-module scenario (i.e. a project with one or more subprojects). Maven traverses into every subproject and executes clean, then executes deploy (including all of the prior build phase steps).

---

**The full guide "Introduction to the Build Lifecycle" can be found on [this link](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html).**
