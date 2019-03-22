FROM python:3.7-stretch

ENV AIRFLOW_USER=airflow \
    AIRFLOW_HOME=/usr/local/airflow \
    AIRFLOW_DB_USER=airflow \
    SLUGIFY_USES_TEXT_UNIDECODE=yes

RUN mkdir -p ${AIRFLOW_HOME}
WORKDIR ${AIRFLOW_HOME}

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN ipython kernel install --user --name=airflow_jupyter

COPY scripts/entrypoint.sh /entrypoint.sh
COPY scripts/check_postgres.py ${AIRFLOW_HOME}/check_postgres.py

RUN useradd -ms /bin/bash -d ${AIRFLOW_HOME} airflow && \
    chown -R airflow: ${AIRFLOW_HOME} && \
    mkdir -p /tmp/work/ && \
    chown -R airflow: /tmp/work && \
    chmod 755 /entrypoint.sh

EXPOSE 8080 8793 7999

USER ${AIRFLOW_USER}
WORKDIR ${AIRFLOW_HOME}
ENTRYPOINT ["/entrypoint.sh"]
