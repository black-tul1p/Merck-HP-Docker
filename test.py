import gdown as drive
from os import system

# Download dataset
dataset = 'lip'         #select from ['lip', 'atr', 'pascal']
if dataset == 'lip':
    url = 'https://drive.google.com/uc?id=1k4dllHpu0bdx38J7H28rVVLpU-kOHmnH'
elif dataset == 'atr':
    url = 'https://drive.google.com/uc?id=1ruJg4lqR_jgQPj-9K0PP-L2vJERYOxLP'
elif dataset == 'pascal':
    url = 'https://drive.google.com/uc?id=1E5YwNKW2VOEayK9mWCS3Kpsxf-3z04ZE'

output = 'checkpoints/final.pth'
drive.download(url, output, quiet=False)

# Download input images
url = 'https://drive.google.com/drive/folders/1TVhHDkIAdyWAluAaKq1AFj7kwK-lknow?usp=share_link'
drive.download_folder(url, quiet=True)

# Run code
command = "python3 simple_extractor.py --dataset 'lip' --model-restore 'checkpoints/final.pth' --input-dir 'inputs' --output-dir 'outputs'"
system(command)