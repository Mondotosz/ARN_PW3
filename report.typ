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
  date-format: "[day padding:zero] [month repr:short] [year repr:full]",
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

= First experiment: awake / asleep

= Second experiment: awake / n-rem / rem

= Competition: awake / n-rem / rem

= Conclusion

