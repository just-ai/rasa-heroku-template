FROM rasa/rasa:1.6.2

COPY app /app
COPY server.sh /app/server.sh

RUN rasa train nlu

ENTRYPOINT ["/app/server.sh"]