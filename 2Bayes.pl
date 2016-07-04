{
        no warnings;          # temporarily turn off warnings
        $x = $y + $z;         # I know these might be undef
}
my %HashTest;
my %TrainingTest;
my %testFileHash;
my %testFileCtr=0;
my $misClassified=0;
my $MwellClassified=0;
my $CwellClassified=0;
my $Total=0;
$numOfGraphicsFiles=0;
$numOfAtheismFiles=0;
#**************************************************************************
#*************************************************************************
#******************************************************************
#******************************************************************
#20news-bydate\20news-bydate-train\alt.atheism\");
#deal with the test files

my @files = <C:/Perl/20news-bydate/20news-bydate-test/alt.atheism/*>;
foreach my $file (@files) {
  #somehow the regular expression with backreference does not work here
  my @fileName=split(/\//, $file);
  my $fileNameLength=scalar(@fileName);
  print $file , "\n";
  open(INFILE, $file) or die "Cannot open $file: $!.\n";
  my @lines=<INFILE>;
  #rudimentarily cleaning the corpus
  my $lines=join(' ',@lines);
   $lines=~ s/From.*\n//;
   $lines=~ s/Subject.*\n//;
   $lines=~ s/Organization.*\n//;
   $lines=~ s/Lines.*\n//;
   $lines=~ s/Reply-to.*\n//;
   $lines=~ s/Reply-To.*\n//;
   $lines=~ s/In-Reply-to.*\n//;
   $lines=~ s/NNTP-Posting-Host.*\n//;
   $lines=~ s/Distribution.*//;
   $lines=~ s/In\sarticle.*writes:\n//;
   $lines=~ s/[`\>`]//;
   $lines=~ s/[`\>`][`\>`]//;
   $lines=lc($lines);
   $lines=~ s/\.//g;
   $lines=~ s/\?//g;
   $lines=~ s/\W/\ /g;
   $lines=~ s/\s(\s)+/ /g;
   $lines = join " ", map {lcfirst} split " ", $lines;
   $tblockOne=$tblockOne.' '.$lines;
    #print $lines, "\n";
   my @processedLines=split(/ /,$lines);
    #print @processedLines;
   $testFileHash{$fileName[$fileNameLength-1]}=$lines;
  $numOfAtheismFiles++;    
  last if ($numOfAtheismFiles> 100);
}


my @files = <C:/Perl/20news-bydate/20news-bydate-test/comp.graphics/*>;
foreach my $file (@files) {
  #somehow the regular expression with backreference does not work here
  my @fileName=split(/\//, $file);
  my $fileNameLength=scalar(@fileName);
  print $file , "\n";
  open(INFILE, $file) or die "Cannot open $file: $!.\n";
  my @lines=<INFILE>;
  #rudimentarily cleaning the corpus
  my $lines=join(' ',@lines);
   $lines=~ s/From.*\n//;
   $lines=~ s/Subject.*\n//;
   $lines=~ s/Organization.*\n//;
   $lines=~ s/Lines.*\n//;
   $lines=~ s/Reply-to.*\n//;
   $lines=~ s/Reply-To.*\n//;
   $lines=~ s/In-Reply-to.*\n//;
   $lines=~ s/NNTP-Posting-Host.*\n//;
   $lines=~ s/Distribution.*//;
   $lines=~ s/In\sarticle.*writes:\n//;
   $lines=~ s/[`\>`]//;
   $lines=~ s/[`\>`][`\>`]//;
   $lines=lc($lines);
   $lines=~ s/\.//g;
   $lines=~ s/\?//g;
   $lines=~ s/\W/\ /g;
   $lines=~ s/\s(\s)+/ /g;
   $tblockSix=$tblockSix.' '.$lines;
   #print $lines, "\n";
   #print @processedLines;
   $testFileHash{$fileName[$fileNameLength-1]}=$lines;
   $numOfGraphicsFiles++;
   last if ($numOfGraphicsFiles> 100);
}



my @files = <C:/Perl/20news-bydate/20news-bydate-train/6label/alt.atheism/*>;
foreach my $file (@files) {
  #somehow the regular expression with backreference does not work here
  my @fileName=split(/\//, $file);
  my $fileNameLength=scalar(@fileName);
  print $file , "\n";
  open(INFILE, $file) or die "Cannot open $file: $!.\n";
  my @lines=<INFILE>;
  #rudimentarily cleaning the corpus
  my $lines=join(' ',@lines);
   $lines=~ s/From.*\n//;
   $lines=~ s/Subject.*\n//;
   $lines=~ s/Organization.*\n//;
   $lines=~ s/Lines.*\n//;
   $lines=~ s/Reply-to.*\n//;
   $lines=~ s/Reply-To.*\n//;
   $lines=~ s/In-Reply-to.*\n//;
   $lines=~ s/NNTP-Posting-Host.*\n//;
   $lines=~ s/Distribution.*//;
   $lines=~ s/In\sarticle.*writes:\n//;
   $lines=~ s/[`\>`]//;
   $lines=~ s/[`\>`][`\>`]//;
   $lines=lc($lines);
   $lines=~ s/\.//g;
   $lines=~ s/\?//g;
   $lines=~ s/\W/\ /g;
   $lines=~ s/\s(\s)+/ /g;
   $lines = join " ", map {lcfirst} split " ", $lines;
   $blockSix=$blockSix.' '.$lines;
   $trainingFileHash{$fileName[$fileNameLength-1]}=$lines;
   $numOfAtheismTrainingFiles++;
   last if ($numOfAtheismTrainingFiles> 100);
}


my @files = <C:/Perl/20news-bydate/20news-bydate-train/1label/comp.graphics/*>;
foreach my $file (@files) {
  #somehow the regular expression with backreference does not work here
  my @fileName=split(/\//, $file);
  my $fileNameLength=scalar(@fileName);
  print $file , "\n";
  open(INFILE, $file) or die "Cannot open $file: $!.\n";
  my @lines=<INFILE>;
  #rudimentarily cleaning the corpus
  my $lines=join(' ',@lines);
   $lines=~ s/From.*\n//;
   $lines=~ s/Subject.*\n//;
   $lines=~ s/Organization.*\n//;
   $lines=~ s/Lines.*\n//;
   $lines=~ s/Reply-to.*\n//;
   $lines=~ s/Reply-To.*\n//;
   $lines=~ s/In-Reply-to.*\n//;
   $lines=~ s/NNTP-Posting-Host.*\n//;
   $lines=~ s/Distribution.*//;
   $lines=~ s/In\sarticle.*writes:\n//;
   $lines=~ s/[`\>`]//;
   $lines=~ s/[`\>`][`\>`]//;
   $lines=lc($lines);
   $lines=~ s/\.//g;
   $lines=~ s/\?//g;
   $lines=~ s/\W/\ /g;
   $lines=~ s/\s(\s)+/ /g;
   $blockOne=$blockOne.' '.$lines;
   #print $lines, "\n";
   #print @processedLines;
   $trainingFileHash{$fileName[$fileNameLength-1]}=$lines;
   $numOfGraphicsTrainingFiles++;
   last if ($numOfGraphicsTrainingFiles> 100);
}




my @subjectKeys=("blockOne", "blockSix");

my $anotherDebugCtr=0;


#print $blockOne;
#*************************************************************
#*************************************************************

$aWordCtr1=0;
foreach $sk(@subjectKeys){
        if ($sk eq "blockOne"){
            $lines=$blockOne;       
        }
        else{
            $lines=$blockSix;    
        }
        
        $lines=~ s/\.//g;
        $lines=~ s/\?//g;
        $lines=~ s/\W/\ /g;
        $lines=~ s/\s(\s)+/ /g;
        $lines = join " ", map {lcfirst} split " ", $lines;
        my @processedTrainingLines=split(/ /, $lines);
        my $numOfWords=scalar(@processedTrainingLines);
        #print @processedLinesTraining;
        my $unigramValuePtrTraining=&MakeUnigramArray(\@processedTrainingLines);
        %unigramValueTraining=%{$unigramValuePtrTraining};
        my @theUnigrams=(keys %unigramValueTraining);
        #foreach my $u(@theUnigrams){};

        print "Associating words with topic label...", "\n\n  ";
        print "class: ", $sk, "\n";
        
        $enum=1;
        $denom=$numOfWords;
        $keyCtr=0;
        foreach my $key(%trainingFileHash){
                #print "key1: ", $key1, "\n";
                my $fileLines=$trainingFileHash{$key};
                #print "document: ", $fileLines, "\n";
                $ClassDocumentWord{$sk}{$key}=$fileLines;
                #print "0Class   : ", $sk,  "key :", $key, " Document: ", $fileLines ,"\n";
                my $WordsInDocRef=&getWord_t_in_Doc_i(\$key, \$fileLines);               
                my @WordsInDoc=@{$WordsInDocRef};
                my $DocRef=&makeKey(\$sk, \$key, \@WordsInDoc);
                my %Doc=%{$DocRef};
                $aWordCtr=0;
                foreach my $aWord ( keys %{ $Doc{$key} }) {
                        #print "$key, $aWord: $Doc{$key}{$aWord}\n";
                        $NumOfWordsRef=&word_t_doc_d(\$key, \$aWord, \%Doc);
                        my $NOfWords=${$NumOfWordsRef};
                        $enum+=$NOfWords;
                        #print "NOfWords ",$NOfWords, "\n";
                        #print "enum ",$enum, "\n";
                        for (my $j=0;$j < $numOfWords; $j++){
                                $aWordCtr1=0;
                                foreach my $aWord1 ( keys %{ $Doc{$key} }) {
                                        if($aWord eq $aWord1){
                                                if (&gramWord(\$aWord)){
                                                        #print "1$key, $aWord1: $Doc{$key}{$aWord1}\n";
                                                        $NumOfWordsRef1=&word_t_doc_d(\$key, \$aWord1, \%Doc);
                                                        my $NOfWords1=${$NumOfWordsRef1};
                                                        $denom+=$NOfWords1;
                                                        #print "NOfWords1 ",$NOfWords1, "\n";
                                                        #print "denom1 ", $denom, "\n"; 
                                                        #print "denom1 ", $denom, "\n";
                                                        $aWordCtr1+=$NOfWords1;
                                                        #print "aWordCtr1 ", $aWordCtr1, "\n";
                                                        last if($aWordCtr1> 50);
                                                }
                                        }
                                }
                        #print "j ", $j, "\n";
                        last if ($j>25);
                        }        
                #print "denom2 ",$denom, "\n";
                $aWordCtr+=$NOfWords;
                $result{$aWord}{$sk}=$enum/$denom;
                print "C(w_t|C-j) = ", "C($aWord|$sk) = ", $result{$aWord}{$sk}, "\n";
                last if($aWordCtr> 50);
                }        
        $keyCtr++;
        }
}

foreach $sk(@subjectKeys){
        $result1{$sk}=1/2;    #
        #print " Result1: ", $result1{$sk}, "\n";
}

my $keyLoop=0;



$keyCtr=0;
my @keys=(sort {$a <=> $b} (keys %testFileHash));
$ClassCtr=0;
foreach $sk(@subjectKeys){
        if ($sk eq "blockOne"){
            $lines=$blockOne;       
        }
        else{
            $lines=$blockSix;    
        }
        
        $lines=~ s/\.//g;
        $lines=~ s/\?//g;
        $lines=~ s/\W/\ /g;
        $lines=~ s/\s(\s)+/ /g;
        $lines = join " ", map {lcfirst} split " ", $lines;
        my @processedTestLines=split(/ /, $lines);
        my $fileLines=$testFileHash{$key};
        #print "document: ", $fileLines, "\n";
        $ClassDocumentWord{$sk}{$key}=$fileLines;
        my @fileLines=split(/ /, $fileLines);
        my $numOfWords=scalar(@fileLines);
        $iresult1{$sk}=$result1{$sk};  
        print "\n", " Result1: ", $result1{$sk}, "\n";
        print " i ", $i, "\n";
        $keyLoop=0;
        $keyCtr=0;
        foreach my $key(@keys){
                $keyCtr++;
                #print " key ", $key, "\n" if ($keyCtr < 20);
                my $fileLines=$testFileHash{$key};
                #print "document: ", $fileLines, "\n";
                $ClassDocumentWord{$sk}{$key}=$fileLines;
                my @fileLines=split(/ /, $fileLines);
                my $numOfWords=scalar(@fileLines);
                #print "0Class   : ", $sk,  "key :", $key, " Document: ", $fileLines ,"\n";
                my $WordsInDocRef=&getWord_t_in_Doc_i(\$key, \$fileLines);               
                my @WordsInDoc=@{$WordsInDocRef};
                my $DocRef=&makeKey(\$sk, \$key, \@WordsInDoc);
                my %Doc=%{$DocRef};
                $aWordCtr=0;
                foreach my $aWord ( keys %{ $Doc{$key}}) {
                        if (&gramWord(\$aWord)){
                                #print "$key, $aWord: $Doc{$key}{$aWord}\n";
                                $NumOfWordsRef=&word_t_doc_d(\$key, \$aWord, \%Doc);
                                my $NOfWords=${$NumOfWordsRef};
                                #print "NOfWords ",$NOfWords, "\n";
                                for (my $j=0; $j <$NOfWords; $j++){        
                                        if ($result{$aWord}{$sk}==0){
                                                $result{$aWord}{$sk}=0.5;    
                                         }
                                        $result{$aWord}{$sk}*=$result{$aWord}{$sk};
                                }
                        if(($result{$aWord}{$sk}!=0)
                        && ($numOfWords!=0)
                        && ($result1{$sk}!=0)){
                                $b+= log($result{$aWord}{$sk})+log($result{$aWord}{$sk})+log($numOfWords)+log($result1{$sk});
                        }
                }
        $a{$key}{$sk}=$b;
        print "key 1keyCtr sk value: ",  $key, " ", $keyCtr, " ", " ", $sk, " ",  $a{$key}{$sk}, "\n";
        }
}




$skLoopCtr=0;
foreach my $key (keys %a){
        foreach my $sk (keys %{$a{$key}}){
               if ($skLoopCtr==0){
                        $previousSk=$sk;
                        $skLoopCtr++;
               }
               else{
                        print "key sk : ", $key, " ", $sk,  "\n";
                        if($a{$key}{$previousSk}> $a{$key}{$sk}){
                                print "key previous sk : ", $key, " ", $previousSk, " ", $a{$key}{$previousSk} , "\n";       
                                if (($previousSk=="blockSix")&&((38758 <= $key) && ($key <= 40062))){
                                        $MwellClassified++;
                                        
                                }
                        
                        }
                        else{
                                print "key sk          : ", $key, " ", $sk, " ", $a{$key}{$sk} , "\n";
                                if (($sk=="blockOne")&&((53068 <= $key) && ($key <= 54564))){
                                        $CwellClassified++;
                                        
                                }
                        }
                $skLoopCtr--;

               }
        }
}

print "Correctly classified graphics articles   ", $MwellClassified, "\n";
print "Correctly classified atheism articles   ", $CwellClassified, "\n";
print "unclassified  (sparse data)   ", $unClassifiable, "\n";
print "misclassified articles   ", $misClassified, "\n"; 
print "Total number of atheism articles   ", $numOfGraphicsFiles, "\n";
print "Total number of graphics articles   ", $numOfAtheismFiles, "\n";      




sub word_t_doc_d
{
        
        my $key=${$_[0]};
        my $aWord=${$_[1]};       
        my %Doc=%{$_[2]};
        my $NumWords=$Doc{$key}{$aWord};
        return \$NumWords;
}


sub makeKey
{
        
        my $Class=${$_[0]};
        my $key=${$_[1]};
        my @WInDoc=@{$_[2]};
        
        @WInDoc1=@WInDoc;
        $WordCtr=0;
        for (my $j=0;$j < scalar(@WInDoc); $j++){
              $a=$WInDoc[$j];
              #print "$a \n";
              for (my $k=0;$k < scalar(@WInDoc1); $k++){  
                        $b=$WInDoc[$k];  
                        #print "$b \n";
                        if ($a eq $b){
                                $Doc{$key}{$b}++;    
                        }
                }
        }
return \%Doc;
}


sub getWord_t_in_Doc_i
{
        my $key3=${$_[0]};
        my $fileLines =${$_[1]};
        my @wordsInDoc=split(/ /, $fileLines);   
        return \@wordsInDoc;
}


sub MakeUnigramArray
{
 #print "DEBUG5";
 my ($TotalTrainingRef)=@_;
 my @ary=@{$TotalTrainingRef};
 my $size=scalar(@ary);
 my $unigram;
 my %unigramHash;
 my $i;
 #print "DEBUG89 ", @ary, "\n";
 for ($i=1; $i <= $size; $i++){
        $unigram=$ary[$i];
        $unigram=~ s/^\s*//;
        $unigram=~ s/\s*$//;
        #print "DEBUG167 ", $unigram, "\n";
        if (not(exists($unigramHash{$unigram}))){
             $unigramHash{$unigram}=1;
        }
        else{
                $unigramHash{$unigram}+=1;
        }
 }
return \%unigramHash;
}

sub gramWord{
        my $aword=${$_[0]};
        open(INFILE, $ARGV[0]) or die "Cannot open $ARGV[0]: $!.\n";
        $Ctr=0;
        while ($InputLine = <INFILE>){
                chomp;
                #print $InputLine, "\n";
                $inputTriple{$Ctr++}{$InputLine}=1;
        }
        
        foreach my $k (sort keys %inputTriple){
                foreach my $triple (keys %{ $inputTriple{$k} }){
                        chomp $triple;
                        #print "Counter: ", $k, "\n";
                        #print "Triple:  ", $triple, "\n";
                        my @InputLine=split(/\|/,$triple);
                        $InputLine[1]= lc $InputLine[1];
                        $InputLine[2]= lc $InputLine[2];
                        $InputLine[3]= lc $InputLine[3] if (exists($InputLine[3]));
                        $InputLine[4]= lc $InputLine[4] if (exists($InputLine[4]));
                        #print "Training Subject :", $InputLine[1], "\n";
                        #print "Training Verb    :", $InputLine[2], "\n";
                        #print "Training Object  :", $InputLine[3], "\n";
                        #print "GOAL ACHIEVED ", $triple, "\n"; 
                        for (my $j=1; $j<4;$j++){
                                if ($InputLine[$j] eq $aword){
                                        return 1;
                                }
                        }
                }
        if ($Ctr==$k) {
                return 0;
        }
}
}
}
