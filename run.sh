#!/bin/bash

wget -q https://raw.github.com/dbpedia-spotlight/dbpedia-spotlight/master/bin/index_db.sh
chmod +x index_db.sh

mkdir wdir
mkdir models

echo "Downloading OpenNLP models..."

for l in en de nl ; do
    cd $l
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-token.bin
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-sent.bin
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-pos-maxent.bin
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-chunker.bin
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-ner-person.bin
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-ner-location.bin
    wget -q http://opennlp.sourceforge.net/models-1.5/$l-ner-organization.bin
    cd ..
done

echo "Indexing..."
#Using OpenNLP models:
./index_db.sh -o en wdir en_US en/stopwords.list EnglishStemmer models/en
./index_db.sh -o de wdir de_DE de/stopwords.list GermanStemmer  models/de
./index_db.sh -o nl wdir nl_NL nl/stopwords.list DutchStemmer   models/nl

#No OpenNLP models:
./index_db.sh wdir fr_FR fr/stopwords.list FrenchStemmer models/fr