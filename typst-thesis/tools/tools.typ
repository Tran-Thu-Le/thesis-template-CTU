// ------------------------------
//    1. FUNCTIONS FOR THESIS TEMPLATE
// ------------------------------
#let set-thesis(body) = {
  set page(margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2cm))
  set heading(numbering: "1.1.1.")
  show heading.where(level: 1): set text(red)
  show heading.where(level: 2): set text(red, weight: "bold")
  set figure(supplement: [*Hình*])
  set text(font: "New Computer Modern", lang: "vn", size: 13pt)
  set par(leading: 1.5em, first-line-indent: 1.5em, justify: true)
  // show math.equation: it => {
  //     if it.body.fields().at("size", default: none) != "display" {
  //       return math.display(it)
  //     }
  //     it 
  // }
  show cite: set text(red)
  show link: set text(red)
  import "@preview/ctheorems:1.1.3": thmrules
  show: thmrules.with(qed-symbol: $square$)
  set figure.caption(separator: ". ")
  // ----equation format
  set math.equation(numbering: "(1)")
  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      // Override equation references.
      link(el.location(),numbering(
        el.numbering,
        ..counter(eq).at(el.location())
      ))
    } else {
      // Other references as usual.
      it
    }
  }


  [#body]
}
#let set-outline(outline-title: [Mục lục], outline-indent: true)={
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
  outline(title: [#outline-title\ #v(1em)], indent: 1em)
}
#let set-page-numbering(the-numbering: "1", reset: false, body) = {
  if reset {counter(page).update(1)}
  // counter(page).update(1)
  set page(numbering: the-numbering)
  set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Trang #counter(page).display(the-numbering)_ #h(1fr)])

  body
}
// #let set-file(body) ={
//   include "multi-section-ref.typ"
//   // import "tools/tools.typ": eqref, myref, figref, remark-Le, delete-Le, add-Le, theorem, definition, proposition, lemma, proof,
//   // import "@preview/cetz:0.1.2": canvas, plot
//   // import "@preview/cetz:0.1.2" as cetz
//   import "@preview/equate:0.2.1": equate
//   show: equate.with(breakable: true, sub-numbering: true)

//   import "@preview/ctheorems:1.1.3": thmrules
//   show: thmrules.with(qed-symbol: $square$)

//   body
// }


//--------------- section-ref
// #show bibliography: none
// #bibliography("../contents/machine-learning.bib")

#let section-refs = state("section-refs", ())

// Add bibliography references to the current section's state
#show ref: it => {
  it
  if it.element != none {
    // Citing a document element like a figure, not a bib key
    // So don't update refs
    return
  }
  section-refs.update(old => {
    old.push(it.target)
    old
  })
}

// Clear the previously stored references every time a level 1 heading
// is created
#show heading.where(level: 1): it => {
  section-refs.update(())
  it
}

#let section-bib() = locate(loc => {
  for target in section-refs.at(loc) {
    block(cite(target, form: "full"))
  }
})
//--------------- section-ref


#let myref(x) = text(fill: blue,)[(#x)]
#let figref(x) = text(fill: red,)[#x]

#let eqnum(it) = [
  #set math.equation(numbering: "(1.1)")
  #it
]

// ------------------------------
//    3. THEOREM ENVIRONMET
// ------------------------------
#import "@preview/ctheorems:1.1.3": thmbox, thmrules, thmproof
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Định lý", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let proposition = thmbox("theorem", "Mệnh đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let definition = thmbox("theorem", "Định nghĩa", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let lemma = thmbox("theorem", "Bổ đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let corollary = thmbox("theorem", "Hệ quả", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let hypothesis = thmbox("theorem", "Giả thiết", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let example  = thmbox("theorem", "Ví dụ", base_level: 1, fill: none, stroke: none, radius: 2pt)
#let proof = thmproof("proof", "Chứng minh")

// ------------------------------
//    4. TABLES
// ------------------------------
#let ctutable(..x, caption: [#text(fill: red)[Thiếu tên Bảng]], supplement: [*Bảng*]) = {
  figure(
    table(..x),
    caption: caption,
    kind: "ctutable",
    supplement: supplement,
    numbering: "1",
  )
}

// ------------------------------
//    5. AUTHOR'S FUNCTIONS
// ------------------------------
