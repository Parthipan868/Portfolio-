import shutil
import os

source = r"C:\Users\arunp\.gemini\antigravity-ide\brain\920ae3d9-4415-44d0-9e52-aed0015ae638\media__1780667217881.png"
target = os.path.join(os.path.dirname(os.path.abspath(__file__)), "images", "invoice_tracker.png")

try:
    shutil.copy(source, target)
    print(f"Success: Copied image to {target}")
except Exception as e:
    print(f"Error: {e}")
