import apache_beam as beam
from apache_beam.io import ReadFromCsv
from apache_beam.options.pipeline_options import PipelineOptions, SetupOptions

from transformations.transform import Transformations
from utilities.logger import logger


class CustomPipelineOptions(PipelineOptions):
    @classmethod
    def _add_argparse_args(cls, parser):
        """
        Adds custom command line arguments for the pipeline.

        Args:
            parser: The argparse parser object to add arguments to.
        """
        parser.add_argument('--input_path', required=True, help='Path to the input CSV file in GCS')
        parser.add_argument('--output_table', required=True,
                            help='BigQuery output table in the format project_id.dataset_id.table_id')


def run(argv=None):
    """
    Runs the Apache Beam pipeline to read data from a CSV file, transform it, and write to BigQuery.

    Args:
        argv: Command line arguments (optional).
    """
    pipeline_options = PipelineOptions(argv)
    custom_options = pipeline_options.view_as(CustomPipelineOptions)

    # Split the output table into project, dataset, and table IDs
    try:
        project_id, dataset_id, table_id = custom_options.output_table.split('.')
    except ValueError as e:
        logger.error(
            f"Invalid output table format: {custom_options.output_table}. Expected format: project_id.dataset_id.table_id")
        return

    # Enable better error handling
    pipeline_options.view_as(SetupOptions).save_main_session = True

    # Create the pipeline
    pipeline = beam.Pipeline(options=pipeline_options)

    (pipeline
     | 'Read CSV File' >> ReadFromCsv(custom_options.input_path)
     | 'Apply Transformations' >> beam.ParDo(Transformations())
     | 'Write to BigQuery' >> beam.io.WriteToBigQuery(
                project=project_id,
                dataset=dataset_id,
                table=table_id,
                ignore_unknown_columns=False,
                schema='Id:INTEGER,track_id:STRING,artists:STRING,album_name:STRING,track_name:STRING,popularity:INTEGER,duration_ms:FLOAT,explicit:BOOLEAN,danceability:FLOAT,energy:FLOAT,key:INTEGER,loudness:FLOAT,mode:INTEGER,speechiness:FLOAT,acousticness:FLOAT,instrumentalness:FLOAT,liveness:FLOAT,valence:FLOAT,tempo:FLOAT,time_signature:INTEGER,track_genre:STRING',
                write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND
            ))

    # Run the pipeline and wait until it's finished
    pipeline.run().wait_until_finish()


if __name__ == '__main__':
    logger.info("Starting the Dataflow pipeline")
    run()
    logger.info("Pipeline execution completed")
