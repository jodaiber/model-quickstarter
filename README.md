Quickstarter for DB-backed DBpedia Spotlight models
===================================================

You can use this tool for creating models of DBpedia Spotlight in your language.

If you have OpenNLP models, add them to your language folder and add the following line to run.sh (example for Dutch):

    ./index_db.sh -o nl wdir nl_NL nl/stopwords.list DutchStemmer   models/nl

This will create a Spotlight model in `models/nl`. If you do not have OpenNLP models, only add a stopwords file to your 
language folder and add the following to run.sh:


    ./index_db.sh wdir fr_FR fr/stopwords.list FrenchStemmer models/fr
