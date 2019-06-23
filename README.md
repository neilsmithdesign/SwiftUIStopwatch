# SwiftUIStopwatch
A SwiftUI implementation of the stopwatch feature in Apple's Clock app on iOS.

A stopwatch is a simple, single screen app. Yet, is a classic example of how an app's UI can easily fall out of sync with it's model. 

SwiftUI promises 'correct' user interfaces through it's declarative syntax. It also encourages explicit expression of 'state' via property bindings. 

This makes the stopwatch example a perfect candidate for a SwiftUI experiment. The aim here is to develop the app in order to compare how the resutling code stacks up against imperative code typically written when working with UIKit.

If successful, SwiftUI should prove (when comparing to imperative code):

* It involves writting significantly less code overall
* Incorrect states are lessly likely to happen
* Readability is improved

An additional observation we can make with this experiment is the performance of SwiftUI's rendering engine. The stopwatch's timer will be updating the UI every millisecond. The promise of SwiftUI is that it will efficiently take care of rendering on the programmer's behalf; diffing the view and only updating what it needs to. We may be able to observe this also.
