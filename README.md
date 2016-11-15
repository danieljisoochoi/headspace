# Headspace iOS Applicant Assignment

This is my implementation of the project assignment that Headspace gave me. The project was to refactor calls to service APIs to make it more scalable. The following describes my thought process and reasoning behind my decisions.

## Thought Process

The first thing I noticed about the boilerplate code was how quickly the API calls would blow out of scale. All of the calls were hard-coded, and involved a lot of repetition and room for error. My first thought was to create a service layer to wrap around the calls, and abstract the calls from directly touching the SDKs.

#### Analytics

There were many possible solutions to this problem, but the one I decided on was to implement a singleton Analytics class, that would hold references to different types of analysis calls. I know that singletons can be dangerous to throw in your app, but I decided on this approach for numerous reasons. I saw that the SDKs in this case were all singletons as well. I also assumed that you would never need separate Analytics objects for a given user, since Analytics wants all data pertaining to that specific user. You would use a separate Analytics object only for a different user. Within this Analytics class, you would store variables that held different AnalyticsService-conforming classes.

#### AnalyticsService

I created a base protocol called AnalyticsService, that held a dictionary of data and a function header for sendEvent. Any class that conforms to this protocol would be able to send an event to some API, appropriate for any analyzer, as well as come with default data to test (i.e. specific feature changes). In addition to this base protocol, I added sub-protocols (i.e. LoginService, MeditationService) that outlined further functionality, like login and completedMeditation. The reason I added this extra layer was so that similar functionalities pertaining to a single feature could be grouped together. If I wanted to add a startedMeditation or lengthOfMeditation analysis later, I could add those headers to the MeditationService protocol, and force implementations to all include those functions. An alternative would have been to keep these functionalities separate and not have a secondary protocol conformance, instead creating separate services for CompletedMeditation, StartedMeditation, LengthOfMeditation, etc.

#### Benefits

Now that there are service layers in between the API and the call site, we don't have to hard-code all the different APIs we want to call directly in the view controllers. We can just reference Analytics from anywhere within the app, and access the service to make the call for us, and pass in any additional data we need to. If we want to add an SDK to call, we can simply add it in the specific functions for a service, instead of having to manually add it everywhere in the app where analytics were called. To delete an SDK is just as easy, where you remove it from the same functions within the services instead of at the call sites. If you want to add an entire new service, now you can create a new class that conforms to AnalyticsService and add it into the Analytics singleton. To delete a service, you simply delete the class and remove the variable from Analytics.

#### Drawbacks

When you delete a service, you still have to go to the call sites and remove all the code that references that service. The idea of this implementation is to have all the call sites only call sendEvent, the function in the AnalyticsService protocol, and pass in a string to identify what specific event you want to send. This could be done better with an enum that pertains to that service. However, the function header is too generic to take up specific enums as parameters.

#### Alternatives
An alternative to the singleton would be to have dependency injection, and inject different services into the view controller. This would make sure that the view controller cannot be created without the proper services passed in. I did not choose this approach, because that would mean creating a custom init for the view controller, and I would have to programmatically bring up the view controller instead of through interface builder. Also, if you have too many dependencies to inject into one controller, you should break it up into smaller pieces, which could easily happen for an application.

## Fulfilling Requirements
- Call site is short and sweet
* yes, much more concise than hard-coding
- Events are modular and can be easily removed
* yes, all located in one class
- Events can be named differently per service
* yes and no, there's an abstract layer called sendEvent, that chooses specific function call given key string
- Events can include different data
* yes, takes in optional dictionary of string to string, and each service class comes with default dictionary
- Services are modular and can be easily removed
* yes?, services are easy to remove from class and singleton, but still need to remove calls from call sites
- Services can selectively send events
* yes, pass in a key string to choose which events to send


## Questions

Answer 3 of the following questions using Markdown and include the file in your repository. These responses can be as brief or as involved as you see fit.

1. Swift is a work-in-progress language; how do you stay informed and connected to the community?
 * I try to stay up-to-date with Swift news through many different platforms. I watch Swift talks on new practices, see what changed in version updates, read open-source Github forums on new techniques and best practices, etc.
2. How do you integrate testing with your development workflow?
 * I test as I go along creating a functional view model/view controller, and find any bugs on the way. Or I do test-driven development, and write unit tests first before coding, to ensure my design and scope are not broken right off the bat.
3. What is your favorite open source Swift library?
 * Alamofire
4. Do you usually build interfaces in code or with interface builder?
 * usually interface builder, but if need be (dynamic UI bits), then programmatically
5. How do you analyze application performance and speed?
 * I use unit test's measureBlock function for runtime speed/performance. For analyzing on a larger scale, something like Logmatic.io.
6. What do you do when you have bug reports that you can't reproduce?
 * I first ask the reporter of the bug to give me a more specific description of the bug and the steps they took to cause it. If they say that's as specific as they can get, at the very most try running through the code with random data and cross my fingers. Anything more than that, the bug can't be fixed (yet).
7. What tools have you used to persist data?
 * CoreData, SQL, plist, NSUserDefaults

## Time spent

Rough breakdown:

- Brainstorming: 1.5 hours
- Implementation: 1 hour
- Testing: 15 min
- Documentation: 45 min

Total time: ~3.5 hours

# headspace
