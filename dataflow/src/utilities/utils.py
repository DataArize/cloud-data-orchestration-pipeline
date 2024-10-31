from utilities.logger import logger


def validate_record(record):
    """
    Validates the given record to ensure it has all required fields.

    Args:
        record: The record to validate, expected to have certain fields.

    Returns:
        The validated record if all required fields are present;
        None if any required field is missing.
    """
    required_fields = ['track_id', 'artists', 'popularity', 'duration_ms']

    try:
        # Check for missing required fields
        missing_fields = [field for field in required_fields if not getattr(record, field, None)]

        if missing_fields:
            logger.warning(f"Missing essential fields in record: {record}. Missing fields: {missing_fields}")
            return None  # Return None if any required field is missing

        logger.info(f"Record validated successfully: {record}")  # Log successful validation
        return record  # Return the validated record if all fields are present

    except (ValueError, AttributeError, KeyError) as e:
        logger.error(f"Validation error in record {record}: {e}")  # Log any exceptions that occur during validation
        return None  # Return None in case of any validation error
