import cv2
import numpy as np
import pandas as pd
import os
import time
import sys

def detect_circles(frame):
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    mask = cv2.inRange(hsv, np.array([0, 50, 50]), np.array([179, 255, 255]))
    mask = cv2.GaussianBlur(mask, (9, 9), 2, 2)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, np.ones((5, 5), np.uint8))
    mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, np.ones((5, 5), np.uint8))

    contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    
    circles = []
    
    for contour in contours:
        area = cv2.contourArea(contour)
        if area > 100:  # Adjust minimum area threshold as needed
            perimeter = cv2.arcLength(contour, True)
            circularity = 4 * np.pi * area / (perimeter * perimeter)
            
            if circularity > 0.5:  # Adjust circularity threshold as needed
                (x, y), radius = cv2.minEnclosingCircle(contour)
                circles.append((int(x), int(y), int(radius)))
    
    return circles

def main(video_path,output_csv):

    print(video_path)
    print(output_csv)

    cap = cv2.VideoCapture(video_path)

    if not cap.isOpened():
        print("Error: Could not open video file.")
        exit()

    start_time = time.time()
    circle_data = []
    frame_number = 0

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        frame = cv2.convertScaleAbs(frame, alpha=1.5, beta=0)

        circles = detect_circles(frame)

        if circles:
            for (x, y, r) in circles:
                circle_data.append([frame_number, x, y, r])

        frame_number += 1

    end_time = time.time()

    cap.release()
    cv2.destroyAllWindows()

    # Calculate timestamps and add to circle_data
    timestamps = [round(fn * 33.333333, 4) for fn in range(frame_number)]
    circle_data_with_timestamp = []
    for i, row in enumerate(circle_data):
        circle_data_with_timestamp.append(row + [timestamps[i]])

    # Convert to DataFrame
    df = pd.DataFrame(circle_data_with_timestamp, columns=['Frame', 'X', 'Y', 'Radius', 'Timestamp'])

    # Save the DataFrame to a CSV file
    csv_output_path = output_csv
    df.to_csv(csv_output_path, index=False)

    # Print the time taken
    print(f"Detection completed. Coordinates saved to {csv_output_path}.")
    print(f"Time taken: {end_time - start_time:.2f} seconds")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python detect_all_circles.py <video_path> <output_csv>")
        sys.exit(1)

    video_path = sys.argv[1]
    output_csv = sys.argv[2]

    main(video_path, output_csv)