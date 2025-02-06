import easyocr
import sys
import json
import codecs
import cv2

sys.stdout = codecs.getwriter("utf-8")(sys.stdout.buffer)

subsections = [
    (17, 51, 45, 20),
    (103, 51, 45, 20),
    (191, 51, 45, 20),
    
    (17, 141, 45, 20),
    (103, 141, 45, 20),
    (191, 141, 45, 20),

    (17, 227, 45, 20),
    (103, 227, 45, 20),
    (191, 227, 45, 20),

    (17, 314, 45, 20),
    (103, 314, 45, 20),
    (191, 314, 45, 20),

    (17, 402, 45, 20),
    (103, 402, 45, 20),
    (191, 402, 45, 20),
]

image = cv2.imread(sys.argv[1])
hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
mask = cv2.inRange(hsv_image, (0, 0, 200), (180, 50, 255))
white_text_image = cv2.bitwise_and(image, image, mask=mask)

detected_digits = []
for idx, (x, y, w, h) in enumerate(subsections):
    cog = white_text_image[y:y+h, x:x+w]
    cog_filename = f"./test/cog_{idx+1}.jpg"

    cv2.imwrite(cog_filename, cog)
    results = easyocr.Reader(['en'], verbose=False).readtext(cog_filename, allowlist='0123456789', detail=1)
    if(len(results) == 0):
        detected_digits.append('0')
    
    detected_digits.extend([text for _, text, _ in results])
print(json.dumps({"digits": detected_digits}, ensure_ascii=False))