// ------------------------------
//    1. FUNCTIONS FOR THESIS TEMPLATE
// ------------------------------
#let set-thesis(body) = {
  set page(margin: (top: 3cm, bottom: 3cm, left: 3.5cm, right: 2cm))
  set heading(numbering: "1.1.1.")
  show heading.where(level: 1): set text(red)
  show heading.where(level: 2): set text(red, weight: "bold")
  set figure(supplement: [*Hình*])
  set text(font: "Times New Roman", size: 13pt)
  set par(leading: 1.5em, first-line-indent: 1.5em, justify: true)
  show math.equation: it => {
      if it.body.fields().at("size", default: none) != "display" {
        return math.display(it)
      }
      it 
  }
  show cite: set text(red)
  show link: set text(red)
  import "@preview/ctheorems:1.1.3": thmrules
  show: thmrules.with(qed-symbol: $square$)


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
  outline(title: [#outline-title\ #v(1em)], indent: outline-indent)
}
#let set-page-numbering(the-numbering: "1", reset: false, body) = {
  if reset {counter(page).update(1)}
  // counter(page).update(1)
  set page(numbering: the-numbering)
  set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Trang #counter(page).display(the-numbering)_ #h(1fr)])

  body
}
#let set-file(body) ={
  include "multi-section-ref.typ"
  // import "tools/tools.typ": eqref, myref, figref, remark-Le, delete-Le, add-Le, theorem, definition, proposition, lemma, proof,
  // import "@preview/cetz:0.1.2": canvas, plot
  // import "@preview/cetz:0.1.2" as cetz
  import "@preview/equate:0.2.1": equate
  show: equate.with(breakable: true, sub-numbering: true)

  import "@preview/ctheorems:1.1.3": thmrules
  show: thmrules.with(qed-symbol: $square$)

  body
}

// ------------------------------
//    2. FORMAT EQUATION LABEL AND REFERENCE
// ------------------------------
#let ieeeEqfmt = (nums) => [(#numbering("1.1", ..nums))]
#let eqref(
  label,
  fmt: ieeeEqfmt,
  //fmt: nums => [(#numbering("1.1", ..nums))],
  style: x => x,
  makelink: true,
) = {
    locate(loc => {
        let elements = query(label, loc)
        let locationreps = elements.map(x => repr(x.location().position())).join(", ")
        assert(elements.len() > 0, message: "label <" + str(label) + "> does not exist in the document: referenced at " + repr(loc.position()))
        assert(elements.len() == 1, message: "label <" + str(label) + "> occurs multiple times in the document: found at " + locationreps)
        let target = elements.first().location()
        let number = counter(math.equation).at(target) 
        if makelink {
            return [
                #show link: style
                #link(target, fmt(number))
            ]
        }
        return fmt(number)
    })
}


//--------------- eqref
#let reffmt = it => text(fill: blue)[#it]
#show ref: reffmt
#let linkfmt = it => [#underline(text(blue)[#it])]
// #import "eqref.typ": eqref, eqnum
#let eqref = eqref.with(style: reffmt) // set defaults
#let customEqfmt = (nums) => [#box[Eq. (#numbering("1.1", ..nums))]]
#let customEqref = eqref.with(fmt: customEqfmt, style: emph) // alternate options
//--------------- eqref


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
//    4. AUTHOR CUSTOM MACROS
// ------------------------------
#let remark-Le(x) = text(fill: blue, size: 10pt)[\[*Remark by LE:* #x\]]
#let delete-Le(x) = text(fill: blue, size: 10pt)[\[*Delete by LE:* #x\]]
#let add-Le(x) = text(fill: blue)[#x]
#let remark-Ngan(x) = text(fill: red, size: 10pt)[\[*Remark by LE:* #x\]]
#let delete-Ngan(x) = text(fill: red, size: 10pt)[\[*Delete by LE:* #x\]]
#let add-Ngan(x) = text(fill: red)[#x]