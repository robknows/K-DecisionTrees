\l playtennis
\l id3.k

// Build the tree
tree:.id3.id3[first cols playtennis;1_cols playtennis;playtennis];

// Unseen data!
forecast:`outlook`temp`humidity`wind!(`sunny`hot`high`weak)

// Classify
playing:.id3.classify[tree;forecast]
