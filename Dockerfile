FROM librasteve/rakudo:ipyjk

USER root

RUN zef install https://github.com/librasteve/raku-physics-measure.git

#USER ${NB_UID}

ENTRYPOINT ["/bin/bash"]

#EXPOSE 8888
#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
