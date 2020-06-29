# diagram.py
from diagrams import Diagram
from diagrams.aws.network import CF
from diagrams.aws.storage import S3


with Diagram("Static site", show=False):
     S3("Logging Bucket") << S3("Private Bucket") << CF("Public website")
