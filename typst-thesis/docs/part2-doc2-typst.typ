#import "../tools/tools.typ": eqnum, figref, theorem, definition, proposition, lemma, proof, example, ctutable



= Cách gõ Typst
==  Định dạng văn bản 


===  Định dạng chữ

- *In đậm*
- _In đậm_
- #highlight[Tô vàng]
- #highlight(fill: blue)[Tô xanh]
- #underline[Gạch dưới]
- #overline[Gạch trên]
- #strike[Gạch bỏ]
- #box(stroke: red)[Đóng khung]
- #box(stroke: red, inset: 0.2em)[Đóng khung rộng]
- #text(font: "PT Sans")[Đổi font chữ]
- #text(size: 1.5em)[Đổi size chữ] 

===  Định dạng list 
- Để tạo list không thứ tự, dùng dấu trừ `-`
    - mục a
    - mục b
    - mục c
- Để tạo list có thứ tự, dùng `+`
    + mục 1
    + mục 2
    + mục 3 

===  Căn giữa

Dùng hàm `#align(center)`. Ví dụ:
  
#align(left)[Nội dung căn trái]
#align(center)[Nội dung căn giữa]
#align(right)[Nội dung căn phải]

===  Cách ẩn một đoạn không dùng nữa 

Ví dụ câu sau sẽ không hiện trên pdf 

// Câu này k xuất hiện 


===  Đề mục 

Ta tạo đề mục bằng dấu `=`

Số lượng dấu `=` sẽ là cấp của đề mục đó. Ví dụ 
  - Cấp 1 `=`
  - Cấp 2 `=`
  - Cấp 3 `===`

Chú ý, hạn chế các đề mục từ cấp 4 trở lên.


==  Lập trình Typst 

===  Biến

Typst là một ngôn ngữ lập trình để soạn thảo văn bản. Như vậy Typst cũng là một ngôn ngữ lập trình. 

Ví dụ sau tính tổng của hai số a và b và in nó ra file pdf.

```typst
#let a  = 5
#let b  = 7
#let c  = a + b
Ta có $a + b = #c$
```

Nhập đoạn code trên vào ta có kết quả

#let a  = 5
#let b  = 7
#let c  = a + b
Ta có $a + b = #c$ 

- Chế độ bình thường của Typst là văn bản 
- #highlight[Chế độ code được bật lên bằng dấu `#`]

===  Hàm 

Ta định nghĩa hàm trong typst như sau 

#let sum(a, b) = a + b 

Khi đó $3 + 4 = #sum(3, 4)$

Khi hàm số được tính toán phức tạp ta đặt đoạn code trong dấu `{}`

#let factorial(a) = {
  let result  = 1
  for i in range(1, a+1) {
    result = result * i
  }
  return result
}

Khi đó $4! = #factorial(4)$

===  Data

Data trong Typst có các dạng chính
- Số 
- Chữ 
- Boolean `true, false`


Data tổng hợp trong Typst có hai dạng chính

- List  `#let a = (1,2,3,4,5)`
- Dictionary  `#let john = (age: 18, name: "john", sex: "men")`
#let john = (age: 18, name: "john", sex: "men")

#let a = (1,2,3,4,5) 

- Cách truy cập phần tử của list: Phần tử thứ hai của list a có giá trị bằng #a.at(1) (do đếm từ 0, 1, 2,....)
- Cách truy cập phần tử của dictionary: Tuổi của John là  #john.age



==  Bảng và hình ảnh

===  Bảng
Trích dẫn bảng:
- `#import "../tools/tools.typ": ctutable`
- Dùng `#ctutable()` (xem thêm cách dùng: https://typst.app/docs/reference/model/table/)
- Chú ý bắt buộc để caption cho bảng




#ctutable(
    columns: (1fr, 1fr, 1fr),
    align: center,
    [*Cột 1*],
    [*Cột 2*],
    [*Cột 3*],

    [Dòng 1], [Dòng 1], [Dòng 1],
    [Dòng 2], [Dòng 2], [Dòng 2],
    caption: "Cách tạo Bảng trong Typst"
) <tab-bang-1>

Bây giờ tôi sẽ trích dẫn @tab-bang-1 bằng `@tab-bang-1`


Muốn cho bảng dãn rộng bằng văn bản, ta đổi biến cột thành `(1 fr, 1 fr, 1 fr)`
#ctutable(
    columns: (1fr, 1fr, 1fr),
    [*Cột 1*],
    [*Cột 2*],
    [*Cột 3*],

    [Dòng 1], [Dòng 1], [Dòng 1],
    [Dòng 2], [Dòng 2], [Dòng 2],
)

Muốn căn giữa nội dung, thêm biến `align` trọng hàm `#table`
#ctutable(
    columns: (1fr, 1fr, 1fr),
    align: center,
    [*Cột 1*],
    [*Cột 2*],
    [*Cột 3*],

    [Dòng 1], [Dòng 1], [Dòng 1],
    [Dòng 2], [Dòng 2], [Dòng 2],
)

Bảng có màu theo từng ô 
#let a = table.cell(
  fill: green.lighten(60%),
)[A]
#let b = table.cell(
  fill: aqua.lighten(60%),
)[B]

#ctutable(
  columns: 4,
  [], [Exam 1], [Exam 2], [Exam 3],

  [John], [], a, [],
  [Mary], [], a, a,
  [Robert], b, a, b,
  caption: [Bảng có màu],
)


===  Hình ảnh 

// Chèn hình bằng hàm `#image()`
// #image("snake.jpg", width: 30%)

// Thêm tiêu đề hình bằng hàm `#figure()`

#figure(
  image("../tools/data-image-1.png", width: 30%),
  caption: [Logo ĐHCT],
) <hinh-logo-DHCT>

Cách trích dẫn hình: @hinh-logo-DHCT.


==  Định dạng Toán

===  Công thức toán 

- Viết công thức trên 1 dòng cùng với text, $a^2 + b^2 = c^2$

- Viết công thức trên 1 dòng riêng

#eqnum[$ integral_a^b f(x) d x = F(b)- F(a) $ <eq-newton>]



- Cách trích dẫn phương trình
  - Cách mặc định dùng `@`, ví dụ: Xét phương trình @eq-newton và @eq-newton-2
  - Cách mặc định dùng `#eqref()`, ví dụ: Xét phương trình @eq-newton (equation reference) và @eq-newton-2

// #set math.equation(numbering: none)
Ta có thể viết tiếp một phương trình không đánh số thứ tự 
$ integral_a^b f'(x) d x = f(b)- f(a) $


Ta có thể tiếp tục một phương trình có đánh số thứ tự bằng hàm `#eqnum()` (equation numbering)

#eqnum[$ integral_a^b f''(x) d x = f'(b)- f'(a) $ <eq-newton-2>]



===  Định lý

#proposition[Trong một tam giác vuông ta có $a^2 + b^2 = c^2$.]

#theorem[(Định lý Pytago) Trong một tam giác vuông ta có $ a^2 + b^2 = c^2. $]

#proof[Ta cần chứng minh ....]

#example[Xét ví dụ sau ....] 

===  Vẽ đồ thị

Để vẽ đồ thị ta sử dụng Cetz - một thư viện của Typst: 
#link("https://typst.app/universe/package/cetz/")[Link Cetz package]. 





===  Trích dẫn bài báo 

Lưu các bài báo cần trích dẫn vào file `ref.bib`. Sau đó là có thể trích dẫn bằng lệnh `@label`. Ví dụ 

- Trong bài báo @alizadehBudgetconstrainedInverseMedian2020a, các tác giả đã ....
- Trong bài báo @espejo2023p, các tác giả đã ....

Các bài báo trích dẫn sẽ tự động xuất hiện trong tài liệu tham khảo.



