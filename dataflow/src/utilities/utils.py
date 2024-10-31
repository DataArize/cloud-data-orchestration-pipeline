from src.utilities.logger import logger


def validate_record(record):
    try:
        # Basic field presence check
        required_fields = ['track_id', 'artists', 'popularity', 'duration_ms']
        for field in required_fields:
            if not record.get(field):
                logger.warning(f"Missing required field {field} in record: {record}")
                return None

        # Data type validation
        record['popularity'] = int(record['popularity'])
        record['duration_ms'] = float(record['duration_ms'])

        return record
    except (ValueError, KeyError) as e:
        logger.error(f"Validation error in record {record}: {e}")
        return None
