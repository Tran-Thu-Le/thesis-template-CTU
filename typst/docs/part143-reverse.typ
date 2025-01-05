
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #import "@preview/cetz:0.1.2": canvas, plot
// #import "@preview/cetz:0.1.2"
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof

#include "../tools/multi-section-ref.typ"
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")

// == BÀI TOÁN REVERSE 1-MEDIAN TRÊN CÂY
=== Bài toán Reverse 1-median 

Trong phần này, chúng ta sẽ tập trung vào _Bài toán reverse_—một bài toán được nghiên cứu rộng rãi và có nhiều ứng dụng thực tế. Trong mô hình reverse các trọng số đỉnh và cạnh có thể thay đổi.Tuy nhiên, trong luận văn này, chúng ta chỉ xem xét một mô hình đơn giản của bài toán, đó là chỉ điều chỉnh trọng số các đỉnh trên đồ thị.

Giả sử chính phủ đã xác định một vị trí quan trọng. Mục tiêu ở đây là tái phân bố dân cư, nhằm tối ưu hóa tổng khoảng cách di chuyển từ các khu dân cư đến vị trí quan trọng đó. Đây là một ví dụ điển hình cho _Bài toán reverse 1-median_.

// === Định nghĩa và giải thuật

Cho đồ thị cây $G = (V, E)$ gồm $n$ đỉnh, mỗi đỉnh $i, i = 1,...,n$ được gán một trọng số không âm $w_i$ và mỗi cạnh cũng có một độ dài không âm. Gọi $delta_i$ là lượng điều chỉnh trọng số của đỉnh $i$, với điều kiện $delta_i <= u_i$, trong đó $u_i$ là giới hạn điều chỉnh của đỉnh $i$ và đặt $c_i$ là chi phí điều chỉnh trọng số của đỉnh $i$.

Xét một đỉnh $v' in V$ bất kỳ, mục tiêu của bài toán reverse 1-median là điều chỉnh trọng số của các đỉnh sao cho hàm mục tiêu $f(v')$ đạt giá trị nhỏ nhất. Đồng thời, việc điều chỉnh phải nằm trong ngân sách cho trước và việc điều chỉnh trọng số mỗi đỉnh phải nằm trong giới hạn nhất định.

Ta có thể viết lại bài toán như sau:

$

 min_(v in V) sum_(i=1)^n (w_i - delta_i) d(v_i,v') \

"s.t." sum_(i=1)^n c_i delta_i <= B \

0 <= delta_i <= u_i \
$ <eq:41>

Để giải bài toán #eqref(<eq:41>), ta có thể chuyển về giải bài toán sau:

$

 max sum_(i=1)^n delta_i d(v_i,v') \

"s.t." sum_(i=1)^n c_i delta_i <= B \

0 <= delta_i <= u_i \
$ <eq:42-in-reverse-file>

Rõ ràng, mô hình bài toán #eqref(<eq:42-in-reverse-file>) tương ứng với bài toán xếp ba lô liên tục. Do đó ta có thể giải quyết bài toán này trong thời gian $O(n)$.

#theorem[ Bài toán reverse 1-median trên cây có thể được giải trong thời gian $O(n)$.]

#example[ Cho đồ thị $G=(V,E)$ có trọng số như hình bên dưới. Ta cần điều chỉnh trọng số các đỉnh trên đồ thị sao cho $f(v_2)$ nhỏ nhất. Đồng thời, thỏa mãn ràng buộc về ngân sách $B=5$ và các ràng buộc sau:

$c_1=1, quad c_2 = 2, quad c_3 = 4, quad c_4 =3, quad c_5=1, quad c_6 = 3$

$
0 <= delta_1 <= 2, quad
0 <= delta_2 <= 1, quad
0 <= delta_3 <= 2, quad
0 <= delta_4 <= 2, quad
0 <= delta_5 <= 1, 
quad$
$0 <= delta_6 <= 3.$]

#let do-thi-cay-trong-so-moi-reverse = canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.left", $v_2 (5)$, anchor: "right", padding: 0.2)

    circle((-3,0), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1 (6)$, anchor: "right", padding: 0.2)

    circle((-3,6), radius: 0.05,fill:black, name: "v3")
    content("v3.left", $v_3 (7)$, anchor: "right", padding: 0.2)

    circle((4,3), radius: 0.05,fill:black, name: "v4")
    content("v4.left", $v_4 (4)$, anchor: "left", padding: 0.2)

    circle((7,6), radius: 0.05,fill:black, name: "v5")
    content("v5.left", $v_5 (3)$, anchor: "left", padding: 0.2)

    circle((7,0), radius: 0.05,fill:black, name: "v6")
    content("v6.left", $v_6 (3)$, anchor: "left", padding: 0.2)

    line("v1","v2", name: "v1v2")
    content("v1v2", $2$, anchor: "bottom", padding: 0.5em)

    line("v3","v2", name: "v2v3")
    // content("v2v3.left", $2$)
    content("v2v3", $2$, anchor: "top", padding: 0.5em)


    line("v4","v2", name: "v4v2")
    // content("v4v2.left", $3$)
    content("v4v2", $3$, anchor: "top", padding: 0.5em)


    line("v4","v5", name: "v4v5")
    // content("v4v5.left", $2$)
    content("v4v5", $2$, anchor: "top", padding: 0.5em)


    line("v4","v6", name: "v4v6")
    // content("v4v6.left", $4$)
    content("v4v6", $4$, anchor: "bottom", padding: 0.5em)


     }
  )
#figure(
  do-thi-cay-trong-so-moi-reverse,
  caption: [Đồ thị cây ví dụ cho bài toán Reverse 1-median],
) 
<fig-do-thi-cay-trong-so-moi-reverse>


Dựa vào dữ kiện ban đầu, ta có $f(v_2)$ nhận giá trị bằng $74$. Bây giờ ta sẽ tiến hành cải thiện giá trị này.
// Tức là ta cần giải bài toán sau:

// $
//     max sum_(i=1)^6 delta_i d(v_i,v_2) \

//     "s.t." sum_(i=1)^6 c_i delta_i <= 3 \

//     0 <= delta_1 <= 2 \
//     0 <= delta_2 <= 1 \
//     0 <= delta_3 <= 2 \
//     0 <= delta_4 <= 2 \
//     0 <= delta_5 <= 1 \
//     0 <= delta_6 <= 3 \
// $ 

Sau khi giải bài toán xếp ba lô liên tục, ta thu được:
$ delta_5 = 1, delta_6 = 3, delta_1 = 2, delta_2 = delta_3= delta_4 = 0. $

Ta được đồ thị cây $G$ với trọng số các đỉnh sau khi được cải thiện như sau:

#let do-thi-cay-reverse = canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.left", $v_2 (5)$, anchor: "right", padding: 0.2)

    circle((-3,0), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1 (4)$, anchor: "right", padding: 0.2)

    circle((-3,6), radius: 0.05,fill:black, name: "v3")
    content("v3.left", $v_3 (7)$, anchor: "right", padding: 0.2)

    circle((4,3), radius: 0.05,fill:black, name: "v4")
    content("v4.left", $v_4 (4)$, anchor: "left", padding: 0.2)

    circle((7,6), radius: 0.05,fill:black, name: "v5")
    content("v5.left", $v_5 (2)$, anchor: "left", padding: 0.2)

    circle((7,0), radius: 0.05,fill:black, name: "v6")
    content("v6.left", $v_6 (0)$, anchor: "left", padding: 0.2)

    line("v1","v2", name: "v1v2")
    content("v1v2", $2$, anchor: "right", padding: 0.2)

    line("v3","v2", name: "v2v3")
    content("v2v3", $2$, anchor: "right", padding: 0.2)

    line("v4","v2", name: "v4v2")
    content("v4v2", $3$, anchor: "bottom", padding: 0.2)

    line("v4","v5", name: "v4v5")
    content("v4v5", $2$, anchor: "left", padding: 0.2)

    line("v4","v6", name: "v4v6")
    content("v4v6", $4$, anchor: "left", padding: 0.2)

})

#figure(
  do-thi-cay-reverse,
  caption: [Đồ thị cây sau khi giải bài toán Reverse 1-median],
) <fig-do-thi-cay-reverse>
Khi đó, $f(v_2) = 44.$
  
