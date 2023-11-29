CPATH=".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"


rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone --quiet $1 student-submission 
echo 'Finished cloning'

cd student-submission

if [ -e ListExamples.java ] && [ -f ListExamples.java ]; then
    echo 'ListExamples.java exists. Copying into directory...'
    cp ListExamples.java ../grading-area
    cp ../TestListExamples.java ../grading-area

else 
    echo 'Score = 0.0% \n ListExamples.java not found!'
    exit
fi

cd ../grading-area
cp -r ../lib lib

javac -cp $CPATH *.java
echo "Grade Results: "
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples




# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests