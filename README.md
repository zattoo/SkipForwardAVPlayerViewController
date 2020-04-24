# Description

When streaming a channel that does not allow skipping forward, there is no way with Apple's API to achieve that. 
We were trying to set requiresLinearPlayback to true, but this would block input from the remote for skip backwards or even pause the stream.

![](skipForward.gif)

# Steps
In this project, we set isSkipForwardEnabled to false, and in the delegate method `playerViewController:timeToSeekAfterUserNavigatedFromTime:toTime:` we return the currentTime in case isSkipForwardEnabled = false. 
Unfortunately the user is still able to skip forward by long press on the remote (see [this similar radar](https://github.com/dcordero/Radar-45550317))

# Feature Request
We would like to have something like `isSkipForwardAllowed` or `isSkipBackwardsAllowed` in order to block all kinds of scrubbing and skipping in the corresponding direction. 
This would be very beneficial in cases when the business case does not allow skipping in certain direction.

# Version
tvOS 13.4
