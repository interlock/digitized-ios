# Digitized iOS Project

This project is a follow along project to teach some basic iOS/Xcode development. 

## Industry

* 5.9 billion mobile subscriptions in the world (7 billion people total)
* Only 1.3 billion web-enabled
* ___ SMS messages sent last year

### Growth

* It took AOL 9 years to reach 1 million users
* It took Facebook 9 months to reach 1 million users
* It took Draw Something 9 days to reach one million users

[Platform Acceleration](http://www.lukew.com/ff/entry.asp?1524)

### Challenges of small screens

## Follow Along Steps

Download the project [zip](https://github.com/interlock/digitized-ios/zipball/master)

Unzip this file in your work/project folder.

Open up the file, "Digitized.xcworkspace"

### Storyboards

Open up the file "Digitized/MainStoryBoard.storyboard".

Our app is going to have 3 tabs:

* A view of the digitized tumbler feed
* A digitized tweet feed
* A map that zooms in
* A touch tab



### Hooking up the tumblr web view

Lets add our first tab to the app. We have to let the View Controller know about some 
of the widgets we have on our story board.

* webView
* activityIndicator

Our UIWebView can pass some messages to our View Controller when it starts loading a page, or finishes loading a page.
We call this delegation, which is used frequently in ObjC. Our UIWebView has a delgate, lets connect that to our 
ViewController.

We also have a refresh button, instead of using a delegate, it uses an action @selector to pass a message. We can connect
that to our ViewController action "refreshButtonClick:".

### Hooking up the digitized feed

Lets hook up the digitized feed now and customize the twitter hash tag in the code.

Lets walk through how it works in the View Controller.

### Hooking up the map

Hook up the Locate button to locate the user

Connect the MKMapView to the View Controller.


### Touch Tab

Try the touches.

Change the color to [UIColor redColor].

Remove the views.

## Additional resources:

* [Interface Builder Help](https://developer.apple.com/library/ios/#recipes/xcode_help-interface_builder/StoryboardProject.html)
* [Tutorials](http://maniacdev.com/ios-5-sdk-tutorial-and-guide/xcode-4-storyboard/)
