
#set page(margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2cm))
#set heading(numbering: "1.1.1.")
#show heading.where(level: 1): set text(red)
#show heading.where(level: 2): set text(red, weight: "bold")
#set figure(supplement: [*Hình*])
#set text(font: "Times New Roman", size: 13pt)
#set par(leading: 1.5em, first-line-indent: 1.5em, justify: true)
#show math.equation: it => {
    if it.body.fields().at("size", default: none) != "display" {
      return math.display(it)
    }
    it 
}
#show cite: set text(red)
#show link: set text(red)
#import "@preview/ctheorems:1.1.3": thmrules
#show: thmrules.with(qed-symbol: $square$)


// -----------------------------------
//    THESIS COVER
// -----------------------------------
#include "../docs/part00-cover.typ"

// -----------------------------------
//    CONTENTS  LIST
// -----------------------------------
// --------- page numbering as i, ii, iii, iv
#set page(numbering: "i")
#set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Trang #counter(page).display("i")_ #h(1fr)])
#{
  show outline.entry.where(
    level: 1
  ): it => {
    strong(it)
  }
  show outline.entry.where(
    level: 2
  ): it => {
    text(weight: "bold", it)
  }
  outline(title: [Mục lục\ #v(1em)], indent: true)
}
// --------- CHƯƠNG 0
#include "../docs/part01-thanks.typ"
#include "../docs/part02-commit.typ"
#include "../docs/part03-intro.typ"
#include "../docs/part04-notations.typ"
#include "../docs/part05-images.typ"
#include "../docs/part06-tables.typ"



// --------- CHƯƠNG 1
// --------- page numbering as 1,2,3,4
#set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Trang #counter(page).display()_ #h(1fr)])
#set page(numbering: "1")
#counter(page).update(1)
#pagebreak()
#include "../docs/part11-graphs.typ"
#include "../docs/part13-median.typ"
#include "../docs/part141-knapsack.typ"
#include "../docs/part142-inverse.typ"
#include "../docs/part143-reverse.typ"
#include "../docs/part144-upgrading.typ"

// --------- CHƯƠNG 2
#pagebreak()
#include "../docs/part21-SR.typ"
#include "../docs/part22-USR.typ"


// --------- Kết luận và Tài liệu tham khảo
#pagebreak()
#include "../docs/part31-conclusion.typ"
#pagebreak()
#heading(numbering: none, level: 1, outlined: true)[Tài liệu tham khảo]
\ //this line is a hack fix indent issue
#bibliography("../docs/ref.bib", title: none, style: "annual-reviews-author-date", )