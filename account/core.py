import string
import random


def generate_password(length=8):
    candidate = string.ascii_uppercase + string.digits

    return "".join([random.choice(candidate) for _ in range(length)])
