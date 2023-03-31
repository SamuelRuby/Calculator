FROM ubuntu:20.04
RUN mkdir -p /home/app
RUN apt-get update && apt-get install -y python3.9 python3.9-dev python3-pip
RUN apt-get update \
        && apt-get install libportaudio2 libportaudiocpp0 portaudio19-dev libasound-dev libsndfile1-dev -y \
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# RUN pip install -r requirements.txt
WORKDIR /home/app
COPY . .
EXPOSE 80
CMD ["python3", "calc.py"] 
flask