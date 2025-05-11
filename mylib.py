import os
from dotenv import load_dotenv
load_dotenv()

for key, value in os.environ.items():
    os.environ[key] = value 