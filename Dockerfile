FROM jupyter/minimal-notebook

USER root

RUN apt-get update && \
 apt-get install -y --no-install-recommends make curl patch file && \
 apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 && \
 apt-get install -y --no-install-recommends gcc g++

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
 mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y && \
 rm -rf mecab-ipadic-neologd

# torchtext>=0.9.0では、torchtext.data.Fieldが廃止されてしまった
# 最新のgensimではgensim.models.KeyedVectors.wv が廃止されてしまった。3.8.3以前をダウンロード
RUN pip install -U pip && \
 pip install --no-cache-dir janome mecab-python3 'torchtext<0.9.0' gensim spacy attrdict && \
 rm -rf /tmp/pip-tmp

# aptでMecabをインストールすると、mecabrcのパスを明示的に指定する必要がある
ENV MECABRC=/etc/mecabrc

# jovyan
USER ${NB_UID}
# /home/jovyan
WORKDIR "${HOME}"