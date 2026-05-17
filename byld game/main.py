import cv2
from cvzone.HandTrackingModule import HandDetector
from pynput.keyboard import Key, Controller

cap = cv2.VideoCapture(0)

detector = HandDetector(detectionCon=0.7, maxHands=1)
keyboard = Controller()


while True:
    
    _, img = cap.read()
    hands, img = detector.findHands(img)

    if hands:
        finger = detector.fingersUp(hands[0])
        if finger == [0, 0, 0, 0, 0]  :
            keyboard.press('l')
            keyboard.release('k')
           

        elif finger == [1, 1, 1, 1, 1] :
            keyboard.press('k')
            keyboard.release('l')



    cv2.imshow("Wall Breaker Game", img)
    if cv2.waitKey(1) == ord("q"):
         break
    
# import cv2
# from cvzone.HandTrackingModule import HandDetector
# from cvzone.FaceDetectionModule import FaceDetector
# from pynput.keyboard import Controller as KeyboardController
# from pynput.mouse import Controller as MouseController
# import tkinter as tk

# # 1. Initialize Video Capture
# cap = cv2.VideoCapture(0)
# cap.set(3, 1280)  # Set width
# cap.set(4, 720)   # Set height

# # 2. Initialize Detectors and Controllers
# hand_detector = HandDetector(detectionCon=0.7, maxHands=1)
# face_detector = FaceDetector(minDetectionCon=0.5)

# keyboard = KeyboardController()
# mouse = MouseController()

# # 3. Get your actual screen resolution (for accurate mouse mapping)
# root = tk.Tk()
# screen_width = root.winfo_screenwidth()
# screen_height = root.winfo_screenheight()
# root.destroy()

# # Camera dimensions (must match the cap.set values above)
# cam_width, cam_height = 1280, 720

# while True:
#     success, img = cap.read()
#     if not success:
#         break

#     # Flip the image horizontally for a mirror effect (makes controlling the mouse natural)
#     img = cv2.flip(img, 1)

#     # ---- FEATURE 1: FACE TRACKING & MOUSE MOVEMENT ----
#     img, bboxs = face_detector.findFaces(img, draw=True)
    
#     if bboxs:
#         # Get the center coordinates of the detected face box
#         face_center = bboxs[0]["center"]
#         face_x, face_y = face_center[0], face_center[1]

#         # Map the camera coordinates to your actual monitor screen size
#         # We invert the X mapping if needed, but since we flipped the image, it's already direct
#         mouse_x = int((face_x / cam_width) * screen_width)
#         mouse_y = int((face_y / cam_height) * screen_height)

#         # Move the cursor to the face's mapped location
#         mouse.position = (mouse_x, mouse_y)


#     # ---- FEATURE 2: HAND GESTURES (Your original code) ----
#     hands, img = hand_detector.findHands(img, draw=True)

#     if hands:
#         finger = hand_detector.fingersUp(hands[0])
        
#         # Fist / Closed hand
#         if finger == [0, 0, 0, 0, 0]:
#             keyboard.press('l')
#             keyboard.release('k')
        
#         # Open hand
#         elif finger == [1, 1, 1, 1, 1]:
#             keyboard.press('k')
#             keyboard.release('l')

#     # Display the game window
#     cv2.imshow("Wall Breaker Game", img)
    
#     # Press 'q' to quit
#     if cv2.waitKey(1) == ord("q"):
#         break

# cap.release()
# cv2.destroyAllWindows()