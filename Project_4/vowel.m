function numOfVov = vowel(input_string)
X = lower(input_string);
A = 'aieou';
numOfVov = sum(ismember(X,A));
end