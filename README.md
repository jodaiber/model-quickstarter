Quickstarter for DBpedia Spotlight models
===================================================

You can use this tool for creating models of DBpedia Spotlight in your language.

This script requires Apache Hadoop and Apache Pig, for more information see [this guide](https://github.com/dbpedia-spotlight/dbpedia-spotlight/wiki/Internationalization-%28DB-backed-core%29).

**Tested with Apache Pig version 0.10.0 and Hadoop 1.1.0, as well as the default Pig and Hadoop on AWS.**

If you have OpenNLP models, add them to your language folder and add the following line to run.sh (example for Dutch):

    ./index_db.sh -o nl wdir nl_NL nl/stopwords.list Dutch models/nl

This will create a Spotlight model in `models/nl`. If you do not have OpenNLP models, only add a stopwords file to your 
language folder and add the following to run.sh:


    ./index_db.sh wdir fr_FR fr/stopwords.list French models/fr


## Running on AWS

Some of the pig jobs require a significant amount of memory, so we recommend to run with nodes with at least 8GB of memory and the bootstrap action for memory-intensive job flows. The master nodes performs the post-processing of the data, so it must have enough memory (for indexing English, we recommend 24GB-32GB).

To run the indexing, start an Elastic MapReduce job with an interactive pig session, login to the master node and run:

    $ git clone https://github.com/$YOU/model-quickstarter.git
    $ cd model-quickstarter
    $ ./run.sh
