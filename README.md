<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A Desktop/Web scrollbar for flutter that implements correct track click > jump behavior.

## Desktop Scrollbar

Please see the comparisions below. On the top, you have the default flutter scrollbar. On the bottom, a Desktop scrollbar using this package.

Notice how when the track is clicked on the default flutter scrollbar, that it only jumps toward the cursor by a small amount? That is not how scrollbars are supposed to work on desktop. 

You can see the correct behavior in the desktop scrollbar example gif, where the scrollbar thumb jumps to the clicked position on the track.
   
![Flutter Default Scrollbar](https://raw.githubusercontent.com/dannyglover/flutter_desktop_scrollbar/main/images/default_flutter_scrollbar_example.gif)
    ![DesktopScrollbar](https://raw.githubusercontent.com/dannyglover/flutter_desktop_scrollbar/main/images/desktop_scrollbar_example.gif)

## Features

* Correct implementation of scrollbar track click > jump behavior.
* Uses the same code as the flutter [RawScrollbar](https://api.flutter.dev/flutter/widgets/RawScrollbar-class.html) widget, meaning the API is the same for the desktop_scrollbar package.

## Install

To install, import the plugin using 
```dart
flutter pub add desktop_scrollbar
```

Or, add `desktop_scrollbar` to your dependencies in your `pubspec.yaml` file
```yaml
# pubspec.yaml
dependencies:
  desktop_scrollbar:
```

Then include it in your source code by importing the library via:
```dart
import 'package:desktop_scrollbar/desktop_scrollbar.dart';
```

## Usage

To use a desktop scrollbar, wrap a scrollable widget with `DesktopScrollbar` and pass a `ScrollController`instance to both `DesktopScrollbar` and the scrollable widget:

```dart
DesktopScrollbar(
     controller: scrollController,
     child: ListView.builder(
        controller: scrollController,
```
#### Preventing duplicate scrollbars on Desktop

To hide the scrollbar that automatically gets attached to scrollable widgets on desktop platforms, use the following code to disable the default scrollbar.
```dart
DesktopScrollbar(
        controller: widget.scrollController,
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 10,
        trackColor: Colors.black,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.builder()
```

You can find a full example in the [example](example/main.dart) file.

## Customization 

Please refer to the [RawScrollbar](https://api.flutter.dev/flutter/widgets/RawScrollbar-class.html) documentation, as DesktopScrollbar uses the same underlying code.

### Support this project

<a href='https://ko-fi.com/D1D13Y754' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
