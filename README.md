# Gesture Robustness Study: Shake vs. Face-Down

## Overview
This study evaluates the robustness and accident-proneness of two common smartphone gestures: shaking and placing the phone face-down. Utilizing accelerometer and gyroscope data, we aim to determine which gesture is less likely to be triggered accidentally in daily scenarios.

## Gesture Design

### Shake Gesture
- **User Action:** Hold the phone and shake it vigorously.
- **Detection:** Accelerometer data checks for at least 3 shakes.
- **Feedback:** Screen shifts to pink.

### Face-Down Gesture
- **User Action:** Place the phone down on a flat surface.
- **Detection:** Gyroscope data determines the phone's orientation within 3 degrees.
- **Feedback:** Screen shifts to dark maroon.

### Rationale
Both gestures are intuitive, differing significantly in their active (shake) versus passive (face-down) nature, making them ideal for assessing accidental activation in various contexts.

## Hypothesis
- **H0:** The shaking gesture is more prone to accidental activation.
- **H1:** The shaking gesture is equally or less prone to accidental activation compared to the face-down gesture.

## UI Design Note
In instances where both gestures are triggered, the screen refreshes to a new color after the initial feedback.

## Accuracy Measurement

### Data Collection
- Capture accelerometer and gyroscope data during gesture execution.
- Record and review user sessions for accuracy.

### Optimization
- Aim for at least 70% accuracy in gesture detection.
- Preliminary tests showed 84% accuracy for shaking and 86% for face-down gestures.

## User Study

### Participants
A diverse group of 8 individuals (from our pool, 6 participated), all with a connection to UChicago.

### Task Execution
Users performed each gesture in varied contexts (e.g., walking, talking, placing the phone on a surface) to test accidental activation.

### Quantitative Analysis
Data and recordings were meticulously analyzed to quantify accidental activations, providing insights into each gesture's robustness.

## Statistical Analysis

Employing t-tests and rank sum tests, we confirmed the shaking gesture's higher accident proneness, validating its lesser robustness compared to the face-down gesture. Both tests, however, come with limitations regarding data distribution assumptions and information loss.
