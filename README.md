# Description

When streaming a channel that does not allow skipping forward, there is no way in apple's API to achieve that. 
The only way is to set requiresLinearPlayback to true, but this would block the remote, and won't be possible to skip backwards or even pause the stream.

![](skipForward.gif)

# Steps
In this project, we set isSkipForwardEnabled to false, and in the delegate method playerViewController:timeToSeekAfterUserNavigatedFromTime:toTime: we return the currentTime in case isSkipForwardEnabled = false. 
But the user is able to skip forward with a long press remote.

# Improvements
Would be better if we had something like isSkipForwardAllowed or isSkipBackwardsAllowed, and if this is set to false, would block long press remote only.  
This will be very beneficial in cases when the stream doesn't alloud skipping forward.

# Version
tvOS 13.4
