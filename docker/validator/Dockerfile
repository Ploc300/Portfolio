FROM python:3.12.3-alpine3.20

# install dependencies
RUN pip install -r ../../src/requirements.txt
RUN pip install pylint

# copy source code
COPY ../../src /app

# copy validator.py with the validators package
COPY validator* /app/

# set the working directory
WORKDIR /app

# run the validator
ENTRYPOINT ["python", "validator.py"]