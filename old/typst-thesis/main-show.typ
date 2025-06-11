#import "tools/tools.typ": set-thesis, set-page-numbering, set-outline
#show: set-thesis.with()

// -----------------------------------
//    CONTENTS
// -----------------------------------
// --------- Phần A. Bìa, lời cảm ơn, cam đoan, lý do chọn đề tài, ...
#include "docs/part0-cover.typ" // Bìa
#show: set-page-numbering.with(the-numbering: "i") // Đánh số trang i, ii, iii, iv, ...
#set-outline() // mục lục
#include "docs/part0-thanks.typ" // lời cảm ơn, ...


// --------- PHẦN B. Nội dung
// --------- CHƯƠNG 1
#show: set-page-numbering.with(the-numbering: "1", reset: true) // đánh số trang 1, 2, 3, ...
#pagebreak()
#include "docs/part1-doc1-graphs.typ" // chương 1
#pagebreak()
#include "docs/part2-doc2-typst.typ"  // chương 2


// --------- PHẦN C. Kết luận và Tài liệu tham khảo
#pagebreak()
#include "docs/part3-conclusion.typ"
#pagebreak()
#heading(numbering: none, level: 1, outlined: true)[Tài liệu tham khảo]
\ // xuống dòng + thục đầu dòng
#bibliography("tools/data-ref.bib", title: none, style: "annual-reviews-author-date", )