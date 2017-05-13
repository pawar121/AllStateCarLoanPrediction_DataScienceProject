FROM python

MAINTAINER Sumit Deo <deo.s@husky.neu.edu>

RUN apt-get update && \
    apt-get clean && \
            rm -rf /var/lib/apt/lists/*

USER root

		# Install Python 3 packages
		# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
		# use notebook-friendly backends in these images
RUN pip install 'pandas' \
		'numexpr' \
    'numpy' \
		'matplotlib' \
		'scipy' \
		'scikit-learn' \
		'beautifulsoup4' \
		'lxml' \
		'html5lib' \
		'boto' \
		'luigi' \
		'mechanicalsoup'

EXPOSE 8123

ADD clean_data.py clean_data.py
ADD download_data.py download_data.py
ADD start_pipeline.py start_pipeline.py
