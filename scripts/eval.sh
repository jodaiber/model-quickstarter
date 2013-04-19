#!/bin/bash

export MAVEN_OPTS="-Xmx26G"

#for WDIR in wdir/*_*; do
for WDIR in wdir/da_DK; do
    LANGUAGE=`echo $WDIR | sed -e "s/_.*//g" -e "s#wdir/##g"`;
    TARGET_DIR="models/$LANGUAGE";
    echo $LANGUAGE
    mvn -f wdir/dbpedia-spotlight/pom.xml -pl eval exec:java -Dexec.mainClass=org.dbpedia.spotlight.evaluation.EvaluateSpotlightModel -Dexec.args="$TARGET_DIR $WDIR" &> $TARGET_DIR/eval.txt &
done
