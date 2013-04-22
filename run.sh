#!/bin/bash

wget -q https://raw.github.com/dbpedia-spotlight/dbpedia-spotlight/master/bin/index_db.sh
chmod +x index_db.sh

mkdir wdir
mkdir models

mvn_version=`mvn -version | grep "Apache Maven" | sed -r "s/Apache Maven (\S+).*/\1/"`
if [[ "$mvn_version" > "3.0.0" ]]; then
   echo "Maven 3 ok."
else         
   echo "One of our dependencies requires Maven 3. Please check your maven version with 'mvn -version'" 
   exit -1
fi


echo "Downloading OpenNLP models..."

for l in en de nl pt da sv; do
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
./index_db.sh -o en wdir en_US en/stopwords.list English models/en
./index_db.sh -o de wdir de_DE de/stopwords.list German  models/de
./index_db.sh -o nl wdir nl_NL nl/stopwords.list Dutch   models/nl
./index_db.sh -o sv wdir sv_SE sv/stopwords.list Swedish models/sv
./index_db.sh -o pt wdir pt_BR pt/stopwords.list Portuguese models/pt
./index_db.sh -o da wdir da_DK da/stopwords.list Danish models/da

#No OpenNLP models:
./index_db.sh wdir fr_FR fr/stopwords.list French models/fr
./index_db.sh wdir pt_BR pt/stopwords.list Portuguese models/pt
./index_db.sh wdir ja_JP ja/stopwords.list None models/ja
./index_db.sh wdir es_ES es/stopwords.list Spanish models/es
./index_db.sh wdir fr_FR fr/stopwords.list French models/fr
./index_db.sh wdir cs_CZ cs/stopwords.list None models/cs
./index_db.sh wdir it_IT it/stopwords.list Italian models/it
./index_db.sh wdir hu_HU hu/stopwords.list Hungarian models/hu
./index_db.sh wdir tr_TR tr/stopwords.list Turkish models/tr


