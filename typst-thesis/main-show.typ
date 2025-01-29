#import "tools/tools.typ": set-thesis, set-page-numbering, set-outline
// -----------------------------------
//    THESIS COVER
// -----------------------------------
#show: set-thesis.with()
#include "docs/part00-cover.typ"

// -----------------------------------
//    CONTENTS
// -----------------------------------
// --------- CHƯƠNG 0
#show: set-page-numbering.with(the-numbering: "i")
#set-outline()
#include "docs/part0.typ"
// --------- CHƯƠNG 1
#show: set-page-numbering.with(the-numbering: "1", reset: true)
#pagebreak()
#include "docs/part1-graphs.typ"
// --------- CHƯƠNG 2
#pagebreak()
// #include "../docs/part21-SR.typ"
#include "docs/part2-Typst.typ"
// --------- Kết luận và Tài liệu tham khảo
#pagebreak()
#include "docs/part3-conclusion.typ"
#pagebreak()
#heading(numbering: none, level: 1, outlined: true)[Tài liệu tham khảo]
\ //this line is a hack to fix indent issue
#bibliography("tools/data-ref.bib", title: none, style: "annual-reviews-author-date", )