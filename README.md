# Q Decision Trees

- An ID3 implementation with a simple API.

## Usage

1. Load a table with some feature columns and a discrete-valued classification
column. For example, the playtennis table.

2. Choose the feature columns you want to build the classifier using, as
well as the column which contains the classifications.

3. Run `.id3.id3[classificationColName;featureColNames;table]`

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
