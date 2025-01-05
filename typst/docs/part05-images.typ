#pagebreak()
#heading(numbering: none, level: 1)[Danh mục các hình ]
#v(2em)
#{
  show outline.entry.where(
    level: 1
  ): it => {
    text(weight: "light", it)
  }
  outline(
    title: none,
    target: figure.where(kind: image),
  )
}



