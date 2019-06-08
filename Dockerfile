FROM jupyter/all-spark-notebook:033056e6d164

# last update: Sat Dec 29 13:50:00 EST 2018
# p6steve 0.0.2

USER root

ENV NB_USER jovyan
ENV NB_UID 100
ENV HOME /home/${NB_USER}

RUN apt-get update \
  && apt-get install -y build-essential \
  && git clone https://github.com/rakudo/rakudo.git -b 2019.03.1 \
  && cd rakudo && perl Configure.pl --prefix=/usr --gen-moar --gen-nqp --backends=moar \
  && make && make install && cd .. && rm -rf rakudo \
  && export PATH=$PATH:/usr/share/perl6/site/bin \
  && git clone https://github.com/ugexe/zef.git \
     && cd zef && perl6 -Ilib bin/zef install . \
     && cd .. && rm -rf zef \
  && zef -v install https://github.com/bduggan/p6-jupyter-kernel.git@master \
  && zef -v install SVG::Plot --force-test \
  && zef -v install Math::Polygons --force-test \
  && zef -v install https://github.com/p6steve/perl6-Physics-Measure.git \
  && git clone https://github.com/p6steve/perl6-Physics-Measure.git \
  && mv perl6-Physics-Measure/eg ${HOME} \
  && rm -rf perl6-Physics-Measure \
  && chown -R $NB_UID ${HOME} \
  && fix-permissions ${HOME} \
  && jupyter-kernel.p6 --generate-config

ENV PATH /usr/share/perl6/site/bin:$PATH

USER ${NB_USER}

