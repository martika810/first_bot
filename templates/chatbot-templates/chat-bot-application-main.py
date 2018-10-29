import logging
import json

from lexutils import LexBotImporter, LexBotExporter, LexBotDeleter

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

def handler(event,context):
    try:
        bot_definition = read_bot_definition('chat-bot-definition.json')
        response_import = import_bot('chatbot')
    except Exception as ex:
        error = 'Error while reading or importing bot'
        pass