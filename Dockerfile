FROM elasticsearch:7.13.4
ENV WORKDIR=/usr/share/elasticsearch
ENV downloaded_files=${WORKDIR}/files

# Names of plugin
ENV icu_analysis_plugin=analysis-icu-7.13.4.zip
ENV kuromoji_analysis_plugin=analysis-kuromoji-7.13.4.zip

USER root

RUN mkdir ${downloaded_files}

# ICU plugin
RUN curl -o ${downloaded_files}/${icu_analysis_plugin} \
    https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-icu/${icu_analysis_plugin}
RUN ${WORKDIR}/bin/elasticsearch-plugin install file://${downloaded_files}/${icu_analysis_plugin}

# Kuromoji plugin
RUN curl -o ${downloaded_files}/${kuromoji_analysis_plugin} \
    https://artifacts.elastic.co/downloads/elasticsearch-plugins/analysis-kuromoji/${kuromoji_analysis_plugin}
RUN ${WORKDIR}/bin/elasticsearch-plugin install file://${downloaded_files}/${kuromoji_analysis_plugin}

EXPOSE 9200 9300

CMD ["eswrapper"]