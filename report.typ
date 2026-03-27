#import "@local/thesis:0.1.0": *
#import "@preview/gentle-clues:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

#show: better_ilm.with(
  title: [MLP for Mouse Sleep Stages],
  subtitle: [ARN - Lab03],
  branch: [Computer Science and Communication Systems],
  authors: ("David Schildböck", "Kénan Augsburger"),
  date: datetime.today(),
  paper-size: "a4",
  date-format: "[day padding:zero] [month repr:long] [year repr:full]",
  cover-page: true,
  chapter-pagebreak: true,
)

#set text(lang: "en")

#codly(
  languages: (
    pseudocode: (
      name: "pseudocode",
      icon: text(font: "JetBrainsMono NFP", "ⓟ "),
      color: rgb("#89caff"),
    ),
  ),
)

#show: codly-init.with()
#codly(languages: codly-languages)

#show link: underline
#show raw: set text(font: "JetBrainsMono NFP")

= Introduction
In this practical work, we aim to develop a neural-network-based system to
classify sleep stages in mice using Multi-Layer Perceptrons (MLPs) implemented
in Keras. The task involves preparing and pre-processing EEG data from
genetically cloned mice, designing experiments to exploit the available data,
and training and evaluating neural networks to perform accurate automatic
classification.

The training dataset includes EEG recordings from two mice, while a separate
mouse is used for testing. Although the mice are clones, individual differences
in EEG signals exist, requiring careful preprocessing and normalization. For
each experiment, we select 25 relevant features, normalize the data, and employ
3-fold cross-validation with shuffling to assess model performance.

Performance evaluation will include plotting training and validation loss,
computing confusion matrices, and calculating F1-scores for each class. The
report documents experiments on classifying between awake and asleep states,
awake/n-rem/rem states, and a competition phase where additional modifications
to the MLP architecture are explored to improve model performance. Throughout,
the goal is to analyze model behavior, optimize hyperparameters, and provide
insights into classification challenges in real-world EEG data.

The following sections detail the shared preprocessing and validation strategy,
followed by results for each classification task.


= General
== Preprocessing
To select the 25 features used in preprocessing, we combined domain knowledge
with a data-driven statistical approach.

Research in sleep staging suggests that the most informative EEG signals are
concentrated in specific frequency bands:
- $\u{03B4}$: 0.1-4Hz
- $\u{03B8}$: 4-10Hz
- $\u{03B1}$: 10-15Hz
- $\u{03B2}$: 15-30Hz
- $\u{03B3}$: 30-100Hz
These bands are known to exhibit distinct activity patterns across different
sleep stages, making them natural candidates for classification.

Since our dataset includes ground-truth sleep state labels, we were able to go
beyond heuristic band selection and apply a supervised feature selection method.
Specifically, we used scikit-learn's `SelectKBest` with the `f_classif` scoring
function, which ranks features by their ANOVA F-statistic — a measure of how
well each feature discriminates between the labelled classes. The 25 features
with the highest scores were retained, ensuring that the selected subset is
statistically most predictive of sleep state. This approach is more principled
than manual band selection alone, as it lets the label information directly
guide which features are kept.

== Validation

To evaluate model performance, we use 3-fold cross-validation with shuffling.
The data is randomly shuffled before being split into three folds, so each fold
serves as a validation set once while the model is trained on the remaining two.
It is worth noting that shuffling is not a perfect solution in this context.
Because the EEG recordings are a time series, consecutive data points are
temporally correlated — two samples only a few seconds apart may end up in
different folds, meaning the validation set can be highly correlated with the
training set. This risks overestimating how well the model will generalise to
truly unseen data. However, the alternative — splitting the data without
shuffling — introduces a different problem: since sleep recordings follow a
natural progression, contiguous folds would be heavily dominated by a single
sleep state (most notably wakefulness), making them unrepresentative of the full
class distribution. Shuffling is therefore chosen as the lesser of two
imperfections. For each fold, an `MLPClassifier` is trained with early stopping
enabled, monitoring a held-out validation fraction to prevent overfitting. The
model is evaluated using accuracy, per-class F1-score, micro-averaged F1-score,
and a confusion matrix. Training loss and validation score curves are also
recorded to allow inspection of the learning dynamics across folds.

= First experiment: awake / asleep

= Second experiment: awake / n-rem / rem

= Competition: awake / n-rem / rem

= Conclusion

