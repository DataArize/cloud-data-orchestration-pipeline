import apache_beam as beam

from src.utilities.logger import logger
from src.utilities.utils import validate_record


class Transformations(beam.DoFn):
    def process(self, record):
        record = validate_record(record)
        if record:
            # Example transformation: convert duration from ms to minutes
            try:
                record['duration_min'] = round(float(record['duration_ms']) / 60000, 2)
                logger.info(f"Transformed record: {record['track_id']}")
                yield record
            except Exception as e:
                logger.error(f"Error transforming record {record}: {e}")
