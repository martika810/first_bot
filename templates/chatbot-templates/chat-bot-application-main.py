import logging
import json

from lexutils import LexBotImporter, LexBotExporter, LexBotDeleter

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

BOT_DEFINITION_FILENAME = 'chat-bot-definition.json'

def read_bot_definition(bot_filename):
    with open(bot_filename) as bot_json_file:
        bot_definition = json.load(bot_json_file)
    logger.info('bot definition succesfully read')
    return bot_definition

def import_bot(bot_definition=None, definition_filename=BOT_DEFINITION_FILENAME):
    if (bot_definition is None):
        bot_definition = read_bot_definition(definition_filename)

    bot_importer = LexBotImporter(
        bot_definition=bot_definition,
        logging_level=logging.INFO,
    )
    bot_importer.import_bot()

    return bot_definition

def handler(event, context):
    try:
        bot_definition = read_bot_definition(BOT_DEFINITION_FILENAME)
        response_import = import_bot(bot_definition='FirstChatBot')
    except Exception as ex:
        error = 'Error while reading or importing bot'
        pass