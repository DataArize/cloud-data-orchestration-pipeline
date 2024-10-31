import apache_beam as beam
from utilities.logger import logger
from utilities.utils import validate_record


class Transformations(beam.DoFn):
    """
    A DoFn for transforming records from the input dataset.

    This class handles the conversion of input records to JSON format
    and applies necessary transformations.
    """

    @staticmethod
    def convert_to_json(record):
        """
        Converts the record into a JSON-like dictionary format.

        Args:
            record: A record object with the required attributes.

        Returns:
            dict: A dictionary representing the JSON format of the record.
        """
        return {
            "Id": record.Id,
            "track_id": record.track_id,
            "artists": record.artists,
            "album_name": record.album_name,
            "track_name": record.track_name,
            "popularity": record.popularity,
            "duration_ms": record.duration_ms,
            "explicit": record.explicit,
            "danceability": record.danceability,
            "energy": record.energy,
            "key": record.key,
            "loudness": record.loudness,
            "mode": record.mode,
            "speechiness": record.speechiness,
            "acousticness": record.acousticness,
            "instrumentalness": record.instrumentalness,
            "liveness": record.liveness,
            "valence": record.valence,
            "tempo": record.tempo,
            "time_signature": record.time_signature,
            "track_genre": record.track_genre
        }

    def process(self, record):
        """
        Processes the input record and yields transformed records.

        Args:
            record: The input record to be transformed.

        Yields:
            dict: The transformed record in JSON format.
        """
        # Validate the record before processing
        valid_record = validate_record(record)
        if valid_record:
            try:
                # Example transformation: convert duration from ms to minutes
                valid_record = valid_record._replace(duration_ms=valid_record.duration_ms / 60000)
                data = self.convert_to_json(valid_record)
                logger.info(f"Transformed record: {data}")
                yield data
            except Exception as e:
                logger.error(f"Error transforming record {record}: {e}")
