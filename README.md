# Headspace iOS Applicant Assignment

Thank you for your interest in Headspace and spending the time to let us get to know you over the phone. We're interested in moving forward and want to see an example of your iOS chops.

The assignment includes a coding portion and a written portion. We expect you to spend less than 4 hours total.

## Analytics Management App

In the early stages an app might only need to send a few simple analytics events to a service like Google Analytics. Using the service SDK is trivial and the code footprint is small. There's not much to worry about at this point – piece of cake. But as an app grows analytics become increasingly important. More events are added, more services are integrated, more context needs to be sent with each event.

Without refactoring this can become chaotic really quick. Call sites are cluttered and require too much implementation details. Adding a service requires sprinkling the service's SDK methods at each call site, so removing the service requires a gigantic find and delete. It's difficult to verify that the right events are sending to the right services. The list goes on...

**To efficiently manage the dispatch of analytics events at scale a better solution is needed. Your mission is to propose an approach that addresses this problem. Feel free to build this however you want. The architecture is completely up to you.**

### Requirements

*Write everything in Swift and do not use any external libraries*.

The analytics management solution should aim to meet the following aesthetic and functional requirements:
- Call site is short and sweet
- Events are modular and can be easily removed
- Events can be named differently per service
- Events can include different data
- Services are modular and can be easily removed
- Services can selectively send events

### Proof of Concept

To demonstrate your implementation we will use 2 events: login and meditation completion. We need to send events to 2 services: Google Analytics and Snowplow. The login event should include the user's ID and be sent to both services. The meditation completion event should include the user's ID and the meditation ID, but only needs to be sent to Snowplow.

We’ve provided a ``.zip`` with a boilerplate app and basic UI that should be used as a starting point for your app. It does not need to look any prettier than it already is – focus on the analytics manager component. We've also included stub SDKs to fake the API for each service.

## Questions

Answer 3 of the following questions using Markdown and include the file in your repository. These responses can be as brief or as involved as you see fit.

1. Swift is a work-in-progress language; how do you stay informed and connected to the community?
2. How do you integrate testing with your development workflow?
3. What is your favorite open source Swift library?
4. Do you usually build interfaces in code or with interface builder?
5. How do you analyze application performance and speed?
6. What do you do when you have bug reports that you can't reproduce?
7. What tools have you used to persist data?

## Submission

Use Git to iterate on your work and email the repository as a ``.zip`` when you are finished.

