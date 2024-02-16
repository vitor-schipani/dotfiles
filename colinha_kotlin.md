# Personal Kotlin study
# Useful links:
- https://developer.android.com/codelabs/kotlin-bootcamp-introduction
- https://www.youtube.com/watch?v=BCSlZIUj18Y

# Jetpack Compose Tutorials
- https://developer.android.com/jetpack/compose/tutorial

## Where Jetpack Compose lives?
Jetpack Compose is a part of the AndroidX library.

The AndroidX library is the heart of the Android Framework and
the compose library lives inside AndroidX.

## @Composable annotation
A function is Composable (it is a reusable building block)
if you add a @Composable annotation to it.

## @Preview annotation
You can also individually preview functions using:
    @Preview(showBackground = true)

But only functions that do not take parameters can be
previewed. Which means you usually need to create a function
only to preview the content and pass default parameters to
the other functions so you can see something in the preview.

## Declaring dataclasses in Kotlin
Data classes are easy to define with no boilerplate code.
Example:

    data class Message(val author: String, val body: String)

These objects can be passed to composable functions for example.

## Declaring variables in Kotlin
To instantiate a class or a variable you need to use the val keyword

    val msg = Message("Myself", "This is my message")

## Columns and Rows in Compose
The Column can be used to arrange elements vertically.

    Column{
        Text(text = msg.author)
        Text(text = msg.body)
    }

You can also nest elements:

    Row {
        Text {
            Text(text = "This msg on the left")
        }
        Column {
            Text(text = msg.author)
            Text(text = msg.body)
        }
    }

## The Resource Manager
The resource manager is the way to import pictures into your
Android project.

- https://developer.android.com/studio/write/resource-manager#import

For me what worked was dragging the image directly to
res/drawable

instead of importing it using the Resource Manager.

## The Modifier class
The Modifier is used as additional parameters to the Row, Column or
Spacer classes.

The Modifier has a number of attributes that can be changed and
that Modifier object is passed to elements that accept a Modifier obj.
This way you alter the way UI elements look.

Modifiers will be used for padding, altering width, height, etc.

Some of the Modifier attributes:

> width
> height
> padding (e.g.: Modifier.padding(all = 8.dp))
> size
> clip (e.g.: Modifier.clip(CircleShape))
> border (e.g.: Modifier.border(1.5dp, MaterialTheme.colorScheme.primary, CircleShape)

## Modifiers in Rows or Columns using Padding
Inside the Row and Column elements you can use 

> Row(modifier = Modifier.padding(all = 8.dp))

## Modifiers in Images
Images also accept the Modifier class.

    Image(
        painter = painterResource(R.drawable.profile_picture),
        contentDescription = "blablabla",
        modifier = Modifier.size(40.dp).clip(CircleShape)
        )

## Modifier in Spacers
We can also use the Spacer() element to add even more spacing
between elements.

The Spacer can be used in any part of the hierarchy.
Usually this is a way spacer is used:

    Spacer(modifier = Modifier.width(8.dp))
    Spacer(modifier = Modifier.height(4.dp))

Therefore the Spacer class takes a Modifier object.
The modifier object itself requires an .dp (density pixels) number.

Modifiers can have their width, height and many other attributes
altered and passed.

## MaterialDesign, Themes and Surfaces.
First of all you should always wrap your Composable functions
like this:

    YourAppTheme{
        Surface{
            ComposableFunction()
        }
    }

By wrapping into the theme (both in the main onCreate body and
also in the Preview functions) you give access to elements from the
MaterialDesign theme.

Surfaces can also feature modifiers and colors, for example:

    class MainActivity : ComponentActivity() {
        override fun onCreate(savedInstanceState: Bundle?){
            super.onCreate(savedInstanceState)
            setContent {
                YourAppTheme{
                    Surface(
                        modifier = Modifier.fillMaxSize(),
                        color = MaterialTheme.colorScheme.background,
                    ) {
                        // A composable function here...
                    }
                }
            }
        }
    }

The only annoying thing is the levels of nesting there.
You have 5:

1. The Android Activity itself (home_screen, feature1_screen, etc.)
2. When this will be called (see: https://developer.android.com/guide/components/activities/activity-lifecycle)
3. Then you set the content (kinda redundant but ok)
4. The app theme
5. The surface

## Colors
Color is the first element of MaterialDesign.

Anywhere you need to use color you can use the MaterialTheme
colors. For example:

    Text(color = MaterialTheme.colorScheme.secondary)

That will help you maintain a consistent color scheme across the app.

Examples of elements that accept Colors are Text, and the Modifiers.

## Typography
Typography is the second element of MaterialDesign.

You can add typography usually to Text elements.

    Text(style = MaterialTheme.typography.titleSmall)

## Shape
Shape is the third element of MaterialDesign.

Shapes usually represent elevation. It is usually added to Surfaces.

    Surface(shape = MaterialTheme.shapes.medium, shadowElevation = 1.dp){
        // Text or other stuff here
    }

## Lists and animations
You can use LazyColumn (vertical scrolling) and LazyRow (horizontal scrolling)
for generating infinite lists of elements.

In the example below there is a composable function that takes
a list of Message objects. Then LazyColumn uses the list and
the list receives a Lambda (the function to be applied to each
member of the list).

       @Composable
       fun Conversation(messages: List<Message>){ 
            LazyColumn{
                items(messages){
                    message -> MessageCard(message)
                }
            }
        }


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




