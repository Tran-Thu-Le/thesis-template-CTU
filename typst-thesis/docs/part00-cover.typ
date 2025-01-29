// ----------------------------------
//    1. INPUT CONTENTS FOR COVER
// ----------------------------------
#let head-1 = [TRƯỜNG ĐẠI HỌC CẦN THƠ]
#let head-2 = [TRƯỜNG SƯ PHẠM]
#let head-3 = [KHOA SƯ PHẠM TOÁN VÀ TIN HỌC]
#let thesis-label-1 = [LUẬN VĂN TỐT NGHIỆP]
#let thesis-label-2 = [ĐỀ TÀI:]
#let thesis-name = [BÀI TOÁN VỊ TRÍ 1-MEDIAN \ TRÊN ĐỒ THỊ CÂY]
#let lecturer = [_Giảng viên hướng dẫn_\ *PGS.TS. Nguyễn Văn A*]
#let student = [_Sinh viên thực hiện_\
                *Nguyễn Thị B*\
                *MSSV: B250XXXX*\
                *Lớp: SP Toán học - K50*]
#let end = [_Cần Thơ, tháng XX, năm 20XX_]


// ----------------------------------
//    2. INPUT DATA FOR COVER
// ----------------------------------
#let cover-size = 14pt 
#let head-size = 16pt 
#let title-size = 22pt 


// ----------------------------------
//    3. COVER TEMPLATE
// ----------------------------------
#box(
  width: 100%, 
  height: 100%,
  stroke: 5pt + blue,
  align(center)[
    #v(1fr)

    #text(size: cover-size, weight: "bold")[#head-1\
    #head-2\
    #head-3\
    ---oOo---]

    #v(1fr)

    #image("../tools/data-image-1.png", width: 25%)

    #text(size: head-size, weight: "bold")[#thesis-label-1]

    #v(2fr)


    #text(size: cover-size, weight: "bold")[#align(left)[#thesis-label-2]]
    #text(size: title-size, weight: "bold")[#thesis-name]

    #v(5fr)

    #table(
      // width: 100%,
      columns: (1fr, 1fr),
      align: (left, left), 
      inset: 2em,
      // stroke: black,
      stroke: none,
      [#lecturer],
      [#student]
    )

    #v(1fr)


    #text(size: cover-size)[#end]

    #v(1fr)

])