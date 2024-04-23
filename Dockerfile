FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime

RUN apt-get -y -qq update && \
    pip install numpy matplotlib librosa libsndfile1 pandas

RUN apt-get update
RUN apt-get upgrade -y --allow-unauthenticated


ARG FILENAME
ENV FILE_NAME ${FILENAME}

ONBUILD RUN ls -la

COPY . .

RUN echo ${FILE_NAME}
RUN ls -la

CMD python3 $FILE_NAME
