# Sugar Beet Disease Detection BeetApp

Overview

This project focuses on real-time rust disease detection in sugar beets using the YOLOv8 object detection model, integrated with a cross-platform mobile application developed using Flutter. The system processes images from the device's camera and applies deep learning techniques to identify rust disease in sugar beets.

# Features

Real-time disease detection using YOLOv8

Cross-platform mobile application built with Flutter

Camera-based image processing

User-friendly UI for displaying disease classification results

Efficient model inference for mobile deployment

# Tech Stack

Deep Learning Framework: YOLOv8 (Ultralytics)

Mobile Development: Flutter (Dart)

Deployment: ONNX / TensorFlow Lite (TFLite) for mobile inference

# Dataset

The dataset used for training the YOLOv8 model consists of annotated images of sugar beet plants affected rust disease. The dataset was preprocessed and augmented to improve model performance.

# Model Training

Dataset Preparation

Collected and annotated images.

Applied data augmentation techniques such as rotation, flipping, and contrast adjustments.

Model Training

Used the Ultralytics YOLOv8 framework for training.

Trained on a GPU ( Google Colab).

Optimized hyperparameters including batch size, learning rate, and number of epochs.

Model Export for Mobile

Converted the trained YOLOv8 model to ONNX / TensorFlow Lite for efficient mobile inference.

Quantized the model to reduce size and improve speed without compromising accuracy.

# Flutter Application Development

*Project Setup*

Created a Flutter project using flutter create.

Integrated the necessary dependencies (camera, image_picker, tflite_flutter, etc.).

*Model Integration*

Loaded the YOLOv8 model into the Flutter app using TFLite/ONNX runtime.

Implemented real-time image processing using the device's camera.

Processed model output to extract bounding boxes and classification results.

# UI/UX Design

Developed an intuitive interface for capturing and analyzing images.

Displayed detection results with bounding boxes and confidence scores.

Implemented feedback options for users to report false positives/negatives.

# Deployment

Tested on Android devices.

Optimized model inference for low-latency performance.

Packaged and released the application via Google Play Store (if applicable).

# Challenges and Solutions

Challenge: Handling real-time inference with a large model.

Solution: Model quantization and performance optimizations.

Challenge: Integrating YOLOv8 into a Flutter application.

Solution: Used ONNX/TFLite for mobile compatibility.

Challenge: Improving accuracy for rare disease cases.

Solution: Applied advanced augmentation and increased dataset diversity.

# Future Improvements

Enhancing model accuracy with a larger dataset.

Adding cloud-based inference for improved efficiency.

Implementing user feedback mechanisms for active learning.

# Conclusion

This project successfully combines deep learning and mobile application development to create an efficient sugar beet disease detection system. By leveraging YOLOv8 and Flutter, we achieved real-time disease detection capabilities on mobile devices, making it accessible for farmers and agricultural experts.


<img src="https://github.com/user-attachments/assets/d968c0ed-d6f4-4049-acb4-2cd16b595753" alt="Home Page">
<br>
<img src="https://github.com/user-attachments/assets/b117b6f2-29ae-4a6f-8b50-d20c813813aa" alt="About App Page">
<br>
<img src="https://github.com/user-attachments/assets/1d48a301-c956-4d15-ba86-b9ad9e35104f" alt="Model Loading Page">
<br>
<img src="https://github.com/user-attachments/assets/8cc69380-3d9f-44c5-92db-1fa60448a888" alt="Detection Page">










- ## Installation

To set up and run the application, follow these steps:

1. **Clone the Repository:**
    ```sh
    git clone https://github.com/nisanurtas/Sugar-Beet-Disease-Detection-App-BeetApp-.git
    ```


2. **Install Dependencies:**

    ```sh
    cd BeetApp
    ./gradlew build
    ```

3. **Open in Android Studio:**

    Open the project in Android Studio and run it.


## Technologies

- **Android:** Provides the platform for the mobile application.
- **AI and Machine Learning:** YOLOv8 algorithm is used for disease detection.
- **Flutter:** Used for developing the user interface.

## Contributing

If you'd like to contribute, please feel free to create pull requests or file issues. We welcome all contributions and feedback!


## Contact

For any questions or feedback regarding the project, please contact [nisaanurtas@gmail.com](mailto:nisaanurtas@gmail.com).
