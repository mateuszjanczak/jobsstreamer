group = "com.mateuszjanczak"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(kotlin("test"))
}

kotlin {
    jvmToolchain(21)
}

tasks.test {
    useJUnitPlatform()
}

tasks.jar {
    manifest {
        attributes(
            "Main-Class" to "com.mateuszjanczak.MainKt"
        )
    }
}

plugins {
    kotlin("jvm") version "2.1.10"
}