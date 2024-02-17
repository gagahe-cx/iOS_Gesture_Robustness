[OBJECTIVE]

Assess the robustness of shake gesture versus face-down gesture.



[GESTURE DESIGN]

1.  Shake Gesture
    User Action: users hold the phone and shake it vigorously
    Detection: we use accelerometer data to check for at least 3 shakes
    Activation Feedback: the screen will shift to pink

    Face-Down Gesture
    User Action: users place their phone down on a flat surface
    Detection: utilize gyroscope data to determine the phone's orientation within 3 degrees
    Activation Feedback: the screen will shift to dark maroon

2. Why these gestures?
Both the shake gesture and face-down gesture are common gestures already utilized by Apple and various apps. Neither gesture is too complicated, and they can be easily performed in a variety of daily-life scenarios, whether accidental or not. These gestures were chosen because they are very distinct from one another: the shaking gesture requires a deliberate effort to perform and is very active, whereas the face-down gesture represents a lack of or stopping of action entirely.

3. Hypothesis
H0: We hypothesize that the shaking gesture is more accident-prone than the face-down gesture.
H1: The shaking gesture is equally or less prone to accidents compared to the face-down gesture.

4. Reasoning
Although the shaking gesture may be more of a deliberate gesture than the face-down gesture (it requires a conscious effort to some extent), common activities experienced in daily life (walking, running, moving the phone generally) are more likely to trigger this gesture than the face-down gesture. The face-down gesture requires the user to be stationary in order to be triggered, making this gesture less accident-prone.

5. Extra notation on the UI Design
When both shaking and face-down gestures are trigurred, the screen will refresh to another color after shifting to pink or dark maroon.




[ACCURACY MEASUREMENT BEFORE CONDUCTING MAIN STUDY]

1.  Data Collection
    Collect accelerometer and gyroscope data during users' execution of gestures. 
    Film each user completing the study. 
    Record data during study and review video after to confirm results.

2.  Labeling
    Manually comb through data and label which instances are which gesture, as well as when gestures are triggered intentionally or unintentionally in different scenarios and contexts.

3.  Optimization
    Refine code to ensure at least 70% accuracy with each gesture (and take note of each gesture's accuracy).
    3.1. We performed each gesture 50 times to see whether it will be activated. For shake gesture, the accuracy rate is 84%. For face-down gesture, the accuracy rate is 86%.

**The accuracy rate**

```math
\text{Accuracy Rate} = \frac{\text{Number of Times Gesture Activated}}{\text{Number of Times Gesture Performed}}
```



[USER STUDY]

1.  Participants
    Include a group of 8 users (for our group, we only have 6 users) from assigned groups (Group 1 Section 1, Group 2 Section 1). They have different backgrounds but all studied at UChicago with similar age.

2.  Task Execution
    Ask users to perform each gesture multiple times in various contexts. The two gestures will be tested independently; only one will be activated at a time.
        Potential contexts:
        - walking with phone in hand
        - walking with phone in bag
        - talking to someone while holding phone in hand
        - placing phone down on a surface

3.  Accident Activation
    Introduce scenarios likely to cause accidental activation and record instances of unintended activations for each gesture.
        Design:
        1. walking with phone in hand (shaking-prone): 5 secs for 5 times 
        2. walking with phone in bag (shaking-prone): 5 secs for 5 times 
        3. putting phone in pocket (both): 5 times 
        4. putting phone in bag (both): 5 times
        5. passing the phone flipped (both): 5 times 
        6. holding phone at a flat angle while using it, such as holding it upside down while laying down (flipping-prone): 5 secs 5 times
        7.  taking a selfie from above (flipping-prone): 5 times
        8.  dropping the phone at a random angle (both): 5 times
    We're going to count the number of times each gesture is activated for each participant, and compare to test the robustness of each.

5.  Quantitative Analysis
    Manually go through data and recordings to ensure each trial's data is accurately labeled. Analyze the collected data to quantify the frequency of accidental activations for each gesture. 





[STATISTICAL ANALYSIS]

In our project, we employed two main tests: the t-test and the rank sum test.

The t-test primarily assesses the difference in accidental activation proportions for two gestures under different scenarios. It assumes that if there's no statistically significant difference in robustness between the two gestures, any disparity should follow a normal distribution with at least 95% confidence. Our results showed that the shaking gesture is more accident-prone than the face-down gesture at a statistically significant level, indicating that the face-down gesture is more robust.

The rank sum test ranks the frequency of each scenario for each gesture, and these combined ranks are used as the test statistics. This test also revealed that the shaking gesture is more accident-prone than the face-down gesture at a statistically significant level, consistent with the t-test results.

Both tests have their limitations. The t-test assumes a normal distribution of differences between gestures, while the rank sum test focuses more on data ordering, potentially losing some information. 
