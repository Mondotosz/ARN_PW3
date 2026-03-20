#import "@local/thesis:0.1.0": *
#import "@preview/gentle-clues:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.8": *

#show: better_ilm.with(
  title: [Mice Sleep Stage Classification with MLP],
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
...
