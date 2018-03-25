# Q Decision Trees

- An ID3 implementation with a simple API.

## Usage

1. Load a table with some feature columns and a discrete-valued classification
column. For example, the playtennis table.

2. Choose the feature columns you want to build the classifier using, as
well as the column which contains the classifications.

3. Run `tree:.id3.build[classificationColName;featureColNames;table]` to
build a tree and assign it to a variable with an unsurprising name.

4. Run `class:.id3.classify[featureDictionary;tree]` to classify an unseen
feature dictionary. This is just any dictionary with keys matching those used
to build the tree. Note that this can be run against a table of unseen data
points.

## Example

Input: A table, such as this one:

```
q)playtennis
playtennis outlook  temp humidity wind  
----------------------------------------
no         sunny    hot  high     weak  
no         sunny    hot  high     strong
yes        overcast hot  high     weak  
yes        rainy    mild high     weak  
yes        rainy    cold normal   weak  
no         rainy    cold normal   strong
yes        overcast cold normal   strong
no         sunny    mild high     weak  
yes        sunny    cold normal   weak  
yes        rainy    mild normal   weak  
..
q)
```

Output: A decision tree, like this:
```
q)t
attribute| `outlook
mapping  | `sunny`overcast`rainy!(`attribute`mapping!(`humidity;`high`normal!..
q)t[`mapping]
sunny   | `attribute`mapping!(`humidity;`high`normal!`no`yes)
overcast| `yes
rainy   | `attribute`mapping!(`wind;`weak`strong!`yes`no)
q)t[`mapping;`sunny]
attribute| `humidity
mapping  | `high`normal!`no`yes
q)t[`mapping;`sunny;`mapping]
high  | no
normal| yes
q)t[`mapping;`sunny;`mapping;`normal]
`yes
q)
```

And then, using unseen data points, feature dictionaries, like this...:

```
q)forecast
outlook | sunny
temp    | hot
humidity| high
wind    | weak
q)
```

...predicted classifications, like this:

```
q).id3.classify[tree;forecast]
`no
q)
```
