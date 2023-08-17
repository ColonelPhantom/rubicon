FROM movesrwth/stormpy:ci-release

RUN mkdir /opt/rubicon
WORKDIR /opt/rubicon

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# install latex
RUN apt-get update && apt-get install texlive-latex-recommended texlive-latex-extra -y 

# install dice

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt --break-system-packages

COPY . .

RUN python3 setup.py install

RUN mkdir -p /opt/rubicon/dice-examples
RUN mkdir -p /opt/rubicon/factory
