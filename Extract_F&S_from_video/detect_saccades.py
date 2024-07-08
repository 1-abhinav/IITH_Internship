import cv2
import numpy as np
import pandas as pd
import time
import sys
import os

def detect_pink_circles(frame):
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    lower_pink = np.array([110, 10, 10])  # Adjusted lower range for lighter shades of pink
    upper_pink = np.array([179, 255, 255])  # Adjusted upper hue limit

    mask = cv2.inRange(hsv, lower_pink, upper_pink)

    mask = cv2.GaussianBlur(mask, (9, 9), 2, 2)

    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, np.ones((5,5), np.uint8))
    mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, np.ones((5,5), np.uint8))

    circles = cv2.HoughCircles(mask, cv2.HOUGH_GRADIENT, dp=1, minDist=20,
                               param1=100, param2=20, minRadius=10, maxRadius=30)

    return circles

def main(video_path, output_csv):

    print(video_path)
    print(output_csv)

    cap = cv2.VideoCapture(video_path)

    if not cap.isOpened():
        print(f"Error: Could not open video file {video_path}.")
        return

    circle_data = []
    frame_number = 0

    start_time = time.time()

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        frame = cv2.convertScaleAbs(frame, alpha=1.5, beta=0)

        circles = detect_pink_circles(frame)

        if circles is not None:
            circles = np.round(circles[0, :]).astype("int")
            for (x, y, r) in circles:
                circle_data.append([frame_number, x, y, r])
        else:
            circle_data.append([frame_number, '', '', ''])

        frame_number += 1

    end_time = time.time()

    cap.release()

    # Calculate timestamps and add to circle_data
    timestamps = [round(fn * 33.333333, 4) for fn in range(frame_number)]
    circle_data_with_timestamp = []
    for i, row in enumerate(circle_data):
        circle_data_with_timestamp.append(row + [timestamps[i]])

    # Convert to DataFrame
    df = pd.DataFrame(circle_data_with_timestamp, columns=['Frame', 'X', 'Y', 'Radius', 'Timestamp'])

    df.to_csv(output_csv, index=False)

    print(f"Detection completed for {video_path}. Coordinates saved to {output_csv}.")
    print(f"Time taken: {end_time - start_time:.2f} seconds")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python detect_pink_circles.py <video_path> <output_csv>")
        sys.exit(1)

    video_path = sys.argv[1]
    output_csv = sys.argv[2]

    main(video_path, output_csv)
