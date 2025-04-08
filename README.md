# Object Detection and Driver Attention Analysis Using YOLOv8 with Data Visualization and Automation

This repository contains the work done during an internship at IITH, focusing on analyzing driver attention and distraction using object detection, eye-tracking data, and advanced data visualization techniques. The project integrates YOLOv8 for object detection, iMotions software for eye-tracking data, and Python for data analysis and automation.

## Table of Contents
- [Overview](#overview)
- [Key Features](#key-features)
- [Use Cases and Applications](#use-cases-and-applications)
- [Implementation Details](#implementation-details)
- [Project Structure](#project-structure)
- [Setup and Usage](#setup-and-usage)
- [Results and Visualizations](#results-and-visualizations)
- [Literature Review](#literature-review)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## Overview

The project aims to analyze driver behavior by detecting objects on the road and measuring the duration of eye fixation on these objects. This is achieved using:
- **YOLOv8**: A state-of-the-art object detection model fine-tuned on manually labeled data.
- **iMotions Eye-Tracking Data**: To capture fixation and saccade thresholds for driver gaze analysis.
- **Data Visualization**: To interpret and present insights on driver distraction and Advanced Driver Assistance Systems (ADAS).

The project also includes literature reviews on driver distraction and ADAS systems, along with automation scripts to streamline workflows.

---

## Key Features

1. **Object Detection**:
   - Fine-tuned YOLOv8 model for detecting objects like cars, pedestrians, traffic lights, etc., on the road.
   - High accuracy achieved through manual labeling and training.

2. **Driver Gaze Analysis**:
   - Integration of eye-tracking data to analyze fixation and saccade thresholds.
   - Insights into how long a driver focuses on specific objects.

3. **Data Analysis**:
   - Extensive analysis of survey data related to ADAS and driver distraction.
   - Visualizations include bar charts, pie charts, radar plots, and more.

4. **Automation**:
   - Batch files and scripts to automate repetitive tasks, improving efficiency.

5. **Literature Review**:
   - Summaries of research papers on driver distraction and ADAS systems.

---

## Use Cases and Applications

### Use Cases
- **Driver Behavior Analysis**: Understand how drivers interact with objects on the road and identify potential distractions.
- **ADAS Development**: Provide insights into how drivers perceive and interact with Advanced Driver Assistance Systems.
- **Traffic Safety Studies**: Analyze driver attention to improve road safety and reduce accidents.

### Applications
- **Automotive Industry**: Enhance ADAS features by understanding driver behavior and attention patterns.
- **Research**: Contribute to academic studies on driver distraction and human-machine interaction.
- **Policy Making**: Inform traffic safety regulations and guidelines based on driver behavior analysis.

---

## Implementation Details

### Object Detection
- **Model**: YOLOv8, fine-tuned on manually labeled data for detecting road objects like vehicles, pedestrians, and traffic lights.
- **Training**: The model was trained on a custom dataset with diverse road scenarios to ensure robustness.

### Eye-Tracking Data
- **Software**: iMotions was used to collect eye-tracking data, including fixation and saccade thresholds.
- **Analysis**: Fixation duration on detected objects was calculated to understand driver attention.

### Data Analysis
- **Survey Data**: Analyzed responses related to ADAS and driver distraction using Python libraries like `pandas` and `matplotlib`.
- **Visualizations**: Generated bar charts, pie charts, radar plots, and more to present insights.

### Automation
- **Batch Files**: Scripts were created to automate tasks like data preprocessing and model inference, saving time and effort.

---

## Project Structure

```
/workspaces/IITH_Internship
├── Documents/
│   ├── Data_analysis.ipynb       # Data analysis and visualization notebook
├── Extract_F&S_from_video/
│   ├── FSD/
│       ├── create_fix.ipynb      # Eye-tracking fixation and saccade analysis
├── Journal/
│   ├── index.html                # 100-Day Journal web application
│   ├── styles.css                # Styling for the journal
├── LICENSE                       # Apache License 2.0
```

---

## Setup and Usage

### Prerequisites
- Python 3.8 or higher
- YOLOv8 installed via [Ultralytics](https://github.com/ultralytics/yolov8)
- iMotions software for eye-tracking data
- Libraries: `pandas`, `matplotlib`, `seaborn`, `numpy`

### Steps
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd IITH_Internship
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run the YOLOv8 model for object detection:
   ```bash
   python yolov8_inference.py --input <video_path> --output <output_path>
   ```

4. Analyze eye-tracking data:
   - Open `create_fix.ipynb` and run the cells to process fixation and saccade data.

5. Perform data analysis:
   - Open `Data_analysis.ipynb` to visualize and analyze survey data.

6. Use the 100-Day Journal:
   - Open `Journal/index.html` in a browser to interact with the journaling app.

---

## Results and Visualizations

### Object Detection
- YOLOv8 successfully detects objects like cars, pedestrians, and traffic lights in real-time.

### Driver Gaze Analysis
- Heatmaps and fixation duration charts provide insights into driver attention.

### Data Analysis
- Visualizations reveal patterns in driver behavior and perceptions of ADAS systems.

---

## Literature Review

As part of this project, a comprehensive literature review was conducted on:
- **Driver Distraction**: Examining factors that lead to driver inattention and their impact on road safety.
- **ADAS Systems**: Understanding the role of advanced driver assistance systems in reducing accidents and improving driving experience.

The literature review provided valuable context and informed the design of experiments and analysis.

---

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- **IITH**: For providing the opportunity and resources for this project.
- **Ultralytics**: For the YOLOv8 framework.
- **iMotions**: For eye-tracking data integration.

---
