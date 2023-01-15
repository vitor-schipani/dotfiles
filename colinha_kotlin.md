# Personal Kotlin study
# Useful links:
> https://developer.android.com/codelabs/kotlin-bootcamp-introduction
> https://www.youtube.com/watch?v=BCSlZIUj18Y


# App structure
## Manifests directory
    manifests
        AndroidManifest.xml

This file is the first thing that is evaluated by the system.
This is where we can set app permissions, list the activities, etc.

## java directory
### Application
    java
        myapplication
            MainActivity
            SecondActivity
            ...

This is where you write most of your '.kt' (kotlin) code.
Those are "view controllers"

### instrumented tests
    java
        androidTest
            ExampleInstrumentedTest
            ...

This is where instrumented tests (that run on the device) will reside.

### unit tests
    java
        androidTest
            ExampleUnitTest
            ...

This is where unit tests (that run on your code) will reside.

## java (generated)
This is where most automatically compiled and generated libraries
and code will reside.

## res (resources)
### drawable
Where app images and figures will stay.

### layout
The '.xml' files that will generate the app screens (views).

### mipmap
Where icons stay in the app. There are different sizes available for
different devices.

### values
Here are constants that you can define once and use everywhere.
    res
        values
            colors.xml
            strings.xml
            themes
                themes.xml
                themes.xml (night)

colors.xml  - can be used to refer to a color only once.
strings.xml - are where buttons are defined.
themes.xml  - how you can customize your app theme

## Gradle Scripts
Here are the automatic build system configurations.
We have to change them here if you add more libraries to the project
for example.




