// == #text(orange)[1.2 Bài toán 1-median]

// == Bài toán 1-median
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #import "@preview/cetz:0.1.2": canvas, plot
// #import "@preview/cetz:0.1.2"
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example

// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref

// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof

#include "../tools/multi-section-ref.typ"
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example, corollary
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: none)

#import "@preview/lovelace:0.3.0": pseudocode-list
// == BÀI TOÁN 1-MEDIAN
== Bài toán 1-median

Trong phần này, ta sẽ xem xét bài toán 1-median. Bài toán này là một bài toán tối ưu trong lý thuyết vị trí, với ứng dụng thực tiễn rộng rãi trong nhiều ngành khác nhau. Chẳng hạn, trong quy hoạch đô thị, bài toán này được sử dụng để chọn vị trí đặt các dịch vụ công cộng như bệnh viện, trường học, hoặc trạm xăng sao cho tổng khoảng cách di chuyển của người dân đến các địa điểm này là nhỏ nhất. Tương tự, trong quản lý chất thải, bài toán 1-median giúp tìm vị trí đặt nhà máy xử lý hoặc bãi rác nhằm tối ưu hóa chi phí vận chuyển rác từ các khu vực dân cư đến nơi xử lý, giảm thiểu chi phí và thời gian vận chuyển.

Ta sẽ xem xét bài toán 1-median trên hai loại đồ thị: đồ thị tổng quát và đồ thị cây.
// == #text(orange)[1.2.1 Bài toán 1-median trên đồ thị tổng quát]

=== Bài toán 1-median trên đồ thị tổng quát


Cho đồ thị $G$ gồm tập đỉnh $E$ và tập cạnh $V$, ký hiệu $G = (V, E)$, với mỗi cạnh và mỗi đỉnh được gán một trọng số tương ứng, gọi là trọng số cạnh và trọng số đỉnh. Ta đặt $w_i$ là trọng số của đỉnh $v_i$ và giả sử tất cả các đỉnh đều có trọng số dương. Mục tiêu của bài toán này là tìm vị trí của một điểm (gọi là 1-median) sao cho tổng khoảng cách từ điểm đó đến các điểm khác trên đồ thị là nhỏ nhất. Hay nói cách khác, ta cần phải tìm một điểm $x in G$ sao cho
$ f(x)=sum_(v_i in V) w_i d(v_i,x) $ <eq:5> nhỏ nhất 

//Cần trích dẫn hay không?

Thuật toán tìm điểm 1-median trên đồ thị tổng quát được trình bày bởi @hamacher1998classification. Thuật toán gồm các bước sau:

1. Xác định khoảng cách gần nhất giữa các cặp đỉnh trong $G$. Ký hiệu là $d(v_i,v_j)$

2. Tính giá trị của $f(v_i), forall v_i in V$

3. Tìm $ o p t = min{f(v_i) bar.v v_i in V}$

4. Trả về $(x^*)={v_i bar.v f(v_i)= o p t}$ là các điểm 1-median của $G$.

#example[Tìm điểm 1-median của đồ thị được cho ở hình bên dưới.]

Với trọng số đỉnh và cạnh đã được cho trong hình vẽ. Tiếp theo, ta sẽ tính toán khoảng cách giữa các cặp đỉnh trong đồ thị $G$.

$ d(u,v)=4, d(z,v)=6, d(t,v)=10, d(z,u)=3, d(t,u)=6, d(t,z) = 3 $

Khi đó, giá trị hàm mục tiêu tại các đỉnh được tính như ở #eqref(<eq:5>), ta có thể thu được:

$ f(v)= 2.4 + 6.4 + 10.1 = 42 $
$ f(u)= 3.4 + 4.3 + 1.6 = 30 $
$ f(z)= 3.6 + 2.3 + 1.3 = 27 $
$ f(t)= 3.10 + 6.2 + 3.4 = 54 $

#let do-thi-co-trong-so = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "u")
    content("u", $u (2)$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v") 
    content("v", $v (3)$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "z") 
    content("z", $z (4)$, anchor: "left", padding: 0.2)

     circle((-3, 0), radius: 0.05, fill: black, name: "t") 
    content("t", $t (1)$, anchor: "right", padding: 0.2)

    line("u", "v", name: "v1v2")
    content("v1v2.bottom", $4$, anchor: "bottom", padding: 0.1)

    // bezier("u","v", (-1.5,2), name: "be1")
    // content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    line("u", "z", name: "v1v3")
    content("v1v3.right", $3$, anchor: "right", padding: 0.1)

    line("v", "z", name: "v2v3")
    content("v2v3.right", $6$, anchor: "right", padding: 1)

     line("t", "z", name: "tz")
    content("tz.top", $3$, anchor: "top", padding: 0.1)

     line("t", "u", name: "tu")
    content("tu.left", $5$, anchor: "left", padding: 1)

    // bezier("z","v", (-4,-3), name: "be2")
    // content("be2.right", $e_5$, anchor: "right", padding: 2.7)
})
#figure(
  do-thi-co-trong-so,
  caption: [Đồ thị tổng quát với điểm median $z$],
) <fig-do-thi-co-trong-so>

  Vì $f(z) < f(u) < f(v) < f(t)$, nên $z$ là điểm 1-median cần tìm. 

 Tiếp theo, ta sẽ nghiên cứu bài toán 1-median trên một loại đồ thị đơn giản hơn, đó là đồ thị cây. Trên cấu trúc đồ thị này, //@goldmanOptimalCenterLocation1971 đã phát triển một thuật toán tuyến tính hiệu quả để xác định điểm 1-median, mang lại lời giải tối ưu cho bài toán.
// == #text(orange)[1.2.1 Bài toán 1-median trên cây]

// #remark-Le[
//   - Đề cập định lý điểm tối ưu đạt tại đỉnh của đồ thị.
// ]

=== Bài toán 1-median trên đồ thị cây

// #remark-Le[
//   - Chứng mình tính chất hàm median trên cây là convex.
// ]

// *Điều kiện tối ưu của điểm 1-median trên đồ thị cây*


Cho đồ thị cây $T$ gồm tập đỉnh $V$ và tập cạnh $E$, ký hiệu là $T=(V,E)$.//Để thuận tiện cho việc chứng minh, ta ký hiệu $angle.l w, bb(1)_T_u angle.r = sum_(v_i in T_u) w_i $. 
Đặt $u_i in N(x_0)$ là tập hợp những đỉnh liền kề với $x_0$. Gọi $T_u$ là cây con của $T$ được lấy gốc tại đỉnh $u$.


#theorem[Điều kiện tối ưu của 1-median trên cây][Một điểm $x_0$ là điểm 1-median của cây $T$ khi và chỉ khi
$
  w(T_u_i) <= w(T)/2, quad quad forall u_i in N(x_0)
$ <eq-opt-cond-median>

] <thm-opt-cond>


//$angle.l w, bb(1)_T_u angle.r <= 1/2$ $forall u in N(x_0)$.
#proof[
Định lý này gồm hai chiều, ta bắt đầu với chiều đầu tiên.

Giả sử $x_0$ là điểm 1-median. Ta cần chứng minh #eqref(<eq-opt-cond-median>).

Trước tiên, ta đặt bậc của đỉnh $x_0$ là $k$, ký hiệu là $ deg(x_0) = k$. Khi đó, nếu xóa bỏ $x_0$, ta được $k$ cây con với gốc lần lượt là $T_u_1, T_u_2,...,T_u_k$, trong đó $u_i in N(x_0), i=1,...,k$.

Ta lại có $x_0$ là một điểm 1-median, nghĩa là giá trị $f(x_0)$ nhỏ nhất. Nói cách khác:

 $ f(u_i) - f(x_0) >= 0, quad quad forall u_i in N(x_0) $ 

 Khi đó, $ f(u_1) - f(x_0) >= 0 $ <eq:13> 

 Hơn nữa, 
 $ f(x_0)= sum_(v_i in V(T_u_1)) w_i d(v_i, x_0) + sum_(v_i in.not V(T_u_1)) w_i d(v_i, x_0) $

 $ f(u_1)= sum_(v_i in V(T_u_1)) w_i d(v_i,u_1) + sum_(v_i in.not V(T_u_1)) w_i d(v_i,u_1)\
 = sum_(v_i in V(T_u_1)) w_i [d(v_i,x_0)- d(u_1,x_0)] + sum_(v_i in.not V(T_u_1)) w_i [d(v_i,x_0)+ d(u_1,x_0)] \ = f(x_0) + [sum_(v_i in.not V(T_u_1)) w_i - sum_(v_i in V(T_u_1)) w_i] d(u_1,x_0) \ = 
 f(x_0) + [sum_(v_i in V(T)) w_i -2 sum_(v_i in V(T_u_1)) w_i]d(u_1,x_0) $

 Thế vào #eqref(<eq:13>), ta được: 
 $ w(T_u_1) <= w(T)/2 $

 Chứng minh tương tự với các trường hợp còn lại. Từ đó ta được $ w(T_u_i) <= w(T)/2, quad quad forall u_i in N(x_0). $

#let do-thi-cay-median = canvas(length: 8%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "x0")
    content("x0.left", $x_0$, anchor: "left", padding: 0.2)

    circle((-2, 5), radius: 0.05, fill: black, name: "u1") 
    content("u1.left", $u_1$, anchor: "left", padding: 0.2)

    circle((-2, 7), radius: 0.05, fill: black, name: "1") 
    // content("z.top", $z (4)$, anchor: "top", padding: 0.2)

    circle((-1, 9), radius: 0.05, fill: black, name: "2") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((-4, 8), radius: 0.05, fill: black, name: "3") 
    // content("t1.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((-5, 7), radius: 0.05, fill: black, name: "4") 
    content("4.right", $T_u_1$, anchor: "right", padding: 1)

    circle((-4, 5), radius: 0.05, fill: black, name: "5") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((-5, 4), radius: 0.05, fill: black, name: "6") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((3, 5), radius: 0.05, fill: black, name: "u2") 
    content("u2.top", $u_2$, anchor: "top", padding: 0.2)

    // circle((4, 7), radius: 0.05, fill: black, name: "7") 
    // // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((5, 5), radius: 0.05, fill: black, name: "8") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((6, 7), radius: 0.05, fill: black, name: "10") 
    content("10.right", $T_u_2$, anchor: "right", padding: 1)

    circle((6, 3), radius: 0.05, fill: black, name: "9") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((0, 1), radius: 0.05, fill: black, name: "u3") 
    content("u3.right", $u_3$, anchor: "right", padding: 0.2)

    circle((1,-1), radius: 0.05, fill: black, name: "muoihai") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    circle((-1, -1), radius: 0.05, fill: black, name: "11") 
    content("11.right", $T_u_3$, anchor: "right", padding: 1)

    // circle((0, -4), radius: 0.05, fill: black, name: "t") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    // circle((-4, -4), radius: 0.05, fill: black, name: "t") 
    // content("t.right", $t (1)$, anchor: "right", padding: 0.2)

    line("u1", "1", name: "u11")
    // content("v1v2.bottom", $4$, anchor: "bottom", padding: 0.1)

    // // bezier("u","v", (-1.5,2), name: "be1")
    // // content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    line("1", "2", name: "12")
    // content("v1v3.right", $3$, anchor: "right", padding: 0.1)

    line("1", "3", name: "13")
    // content("v2v3.right", $6$, anchor: "right", padding: 1)

    line("4", "5", name: "tz")
    // content("tz.top", $3$, anchor: "top", padding: 0.1)

    line("u1", "5", name: "")
    // content("tu.left", $5$, anchor: "left", padding: 1)

    line("6", "5", name: "")

    // line("u2", "7", name: "")

    line("u2", "8", name: "")

    line("8", "10", name: "")

    line("8", "9", name: "")

    line("u3", "11", name: "")

    line("u3", "muoihai", name: "")

    line("u1", "x0", stroke: (dash: "dashed"))

    line("u2", "x0", stroke: (dash: "dashed"))

    line("u3", "x0", stroke: (dash: "dashed"))
    // bezier("z","v", (-4,-3), name: "be2")
    // content("be2.right", $e_5$, anchor: "right", padding: 2.7)
    
})

  // *Hình... ĐỒ THỊ MINH HỌA*
#figure(
  do-thi-cay-median,
  caption: [Đồ thị cây có gốc tại $x_0$ và các đỉnh lân cận của nó],
) <fig-do-thi-tong-bac>


Vậy ta đã hoàn thành chứng minh chiều đầu tiên. Tiếp theo, ta giả sử rằng $ w(T_u_i) <= w(T)/2, quad quad forall u_i in N(x_0). $
Ta cần chứng minh $x_0$ là điểm 1-median. Nói cách khác, ta cần chỉ ra rằng $f(x_0)$ là giá trị nhỏ nhất. 
Ta có:
$ w(T_u_i) <= w(T)/2 <=> f(u_i) - f(x_0) >= 0, quad quad forall u_i in N(x_0). $
Điều này nghĩa là $x_0$ là cực tiểu địa phương của hàm mục tiêu $f$ trên $T$. Theo @thm-distance-function-is-convex, hàm $f$ là hàm lồi nên $x_0$ là cực tiểu toàn cục. Nghĩa là $f(x_0)$ đạt giá trị nhỏ nhất trên hàm $f$ (điều cần phải chứng minh).]

// $ angle.l w, bb(1)_T_u angle.r <= W/2 = (angle.l w, bb(1)_T_u angle.r + angle.l w, bb(1)_(T without T_u) angle.r ) /2 
// <=> angle.l w, bb(1)_T_u angle.r <= angle.l w, bb(1)_(T without T_u) angle.r $ 

@cor-opt-cond là một kết quả quan trọng. Trong Chương 2, ta sẽ sử dụng hệ quả này để kiểm tra một điểm $x_0$ nào đó có phải là điểm 1-median hay không.

#corollary[ Điểm $x_0$ là 1-median khi và chỉ khi với mọi $u in N(x_0)$,
$ w(T_u_i) <= w(T without T_u_i) $ ]
// $ angle.l w, bb(1)_T_u angle.r <= angle.l w, bb(1)_(T without T_u) angle.r $ 
// 
<cor-opt-cond>

// (viết lại chỗ này)

//  (angle.l w, bb(1)_T_u_i angle.r) d(v',u_1)$ + $(angle.l w, bb(1)_(T without T_u_i) angle.r)d(v,u_i)$ = $(angle.l w, bb(1)_u_i angle.r)[d(w,x_0)-d(u_i,x_0)]$ + $(angle.l w, bb(1)_(T without T_u_i) angle.r)[d(v,x_0)+d(x_0,u_i)] = f(x_0) + (angle.l w, bb(1)_(T without T_u_i) angle.r - angle.l w, bb(1)_(T_u_i) angle.r) d(u_i,x_0)= 1- 2 angle.l w, bb(1)_T_u_i angle.r$.

//  $f(x_0)= (angle.l w, bb(1)_T_u_i) d(v,x_0) + (angle.l w, bb(1)_(T without T_u_i))d(v,x_0)$.

//  Thế vào (5), ta được $1- 2 angle.l w, bb(1)_T_u_i angle.r >= 0$ hay nói cách khác $angle.l w, bb(1)_T_u_i angle.r <= 1/2$

//  (Vẽ hình minh họa)

//  Ngược lại, ta giả sử rằng $angle.l w, bb(1)_T_u_i angle.r <= 1/2$. Ta cần chứng minh $x_0$ là một điểm 1-median.

//  Nghĩa là, ta cần phải chỉ ra rằng giá trị $f(x_0)$ nhỏ nhất .$angle.l w, bb(1)_T_u_i angle.r <= 1/2 <=> f(u_i)-f(x_0) >= 0 <=> f(x_0) <= f(u_i)$, $forall u in N(x_0)$. Khi đó, $x_0$ là cực tiểu địa phương của hàm mục tiêu $f$ trên $T$. Gọi $v$ là điểm nằm trên đường đi nối giữa $x_0$ và $v'$, trong đó $v'$ là một đỉnh bất kỳ, sao cho $v$ vẫn thuộc vào lân cận $x_0$. Khi đó $v= alpha x_0 + (1-alpha)v'$ (viết lại, dựa vào phần chứng minh hàm khoảng cách là lồi ở mục chapter1). $forall alpha in [0;1]$. Ta có: $f(x_0) <= f(v)=f(alpha x_0 + (1-alpha)v')$ $<= alpha(x_0) + (1-alpha)f(v')$ $=> f(x_0) <= f(v')$. Vậy $f(x_0)$ đạt giá trị nhỏ nhất tại $x_0$, hay nói cách khác $x_0$ là điểm 1-median.

Tóm lại, @thm-opt-cond đóng vai trò quan trọng trong việc xác định điểm 1-median trên đồ thị cây. Đây là một kết quả đã được công nhận rộng rãi và được nhiều nhà nghiên cứu áp dụng trong các bài toán tối ưu thuộc lĩnh vực lý thuyết vị trí.

Sau đây, ta sẽ giới thiệu một thuật toán dựa trên định lý này để xác định điểm 1-median.

Thuật toán tuyến tính tìm 1-median trên cây được độc lập đưa ra bởi @goldman1971optimal. Ý tưởng cơ bản của thuật toán là "nuốt lá", tức là xóa từng lá và cộng trọng số của lá đó vào trọng số của đỉnh liền kề với nó. Quá trình tiếp diễn cho đến khi có một lá có trọng số lớn hơn phân nửa trọng số của cây $T$, lá này chính là điểm 1-median của cây $T$.

Thuật toán được biểu diễn bên dưới như sau:



// #set table.hline(stroke: .7pt)

// #table(
//   table.hline(),
//   stroke: none,
//   columns: (auto, 4fr),
//   [*ĐẦU VÀO*],  [Cây $T=(V,E)$, mỗi cạnh có chiều dài $l$, mỗi đỉnh $v_i$ được gán một trọng số không âm $w_i$],
//    table.hline(),
//   [*Bước 0*],  [Tính $W=w(T)$.],

//   [*Bước 1*],  [Chọn một lá $v_k in V(T)$.],

//   [*Bước 2*],  [Nếu $V={v_k}$ thì $X^*={v_k}.$],

//   [*Bước 3*],  [],
//   [], [],
//   [],[],
//   [$w_k$ = $W/2$],  [$X^*={x in v_k v_l}$, trong đó $v_l$ liền kề $v_k$.],
//   [], [],
//   [], [],
//   [$w_k >$ $W/2$],  [Trả về: $X^*={v_k}$],
//   [], [],
//   [], [],
//   [$w_k <$ $W/2$],  [Sang Bước 4.],
//   [], [],
//   [*Bước 4*],  [Đặt $w_l := w_l + w_k$ với $v_l$ liền kề $v_k$ và xét cây mới $T:= T without {v_k}$. Trở về Bước 1.],
//   table.hline(),
//   [*ĐẦU RA*],  [$X^*$ là tập hợp tất cả các điểm 1-median.],
//   table.hline(),
// )

#figure(
  kind: "algorithm",
  supplement: [Thuật toán],

  pseudocode-list(booktabs: true, line-gap: 1.6em, numbered-title: [Tìm điểm 1-median], line-numbering: none)[
    - *Input:* Cây $T$ với trọng số $w$
    - *Bước 0:* Đặt $W=w(T), X^*= emptyset$
    - *Bước 1:* Chọn một lá $v_k in V(T)$
    - *Bước 2:* Nếu $V={v_k}$ thì $X^*={v_k}$. Kết thúc.
    - *Bước 3:* Xét các trường hợp sau:
      + Nếu $w_k$ = $W/2$, thì $X^*={x in (v_k v_l)}$, trong đó $v_l$ liền kề $v_k$. Kết thúc.
      + Nếu $w_k >$ $W/2$, thì $X^*:={v_k}$. Kết thúc. 
      + Nếu $w_k <$ $W/2$, thì chuyển sang Bước 4.
    - *Bước 4:* Đặt $w_l := w_l + w_k$ với $v_l$ liền kề $v_k$ và $T := T without {v_k}$. Trở về Bước 1.
    - *Output:* $X^*$ là tập các điểm 1-median
  ]
) <alg-find-all-medians>


Để hiểu rõ hơn về cách hoạt động của thuật toán, ta xét ví dụ sau:

#example[Tìm điểm 1-median của đồ thị được cho hình như bên dưới.]

#let do-thi-cay-median-vi-du = canvas(length: 6%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2", $v_2 (1)$, anchor: "bottom-left", padding: 0.2)

    circle((-3,0), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1 (1)$, anchor: "left", padding: 0.2)

    circle((-3,6), radius: 0.05,fill:black, name: "v3")
    content("v3.left", $v_3 (3)$, anchor: "left", padding: 0.2)

    circle((-4,9), radius: 0.05,fill:black, name: "v4")
    content("v4.left", $v_4 (2)$, anchor: "left", padding: 0.2)

    circle((-6,5), radius: 0.05,fill:black, name: "v5")
    content("v5.left", $v_5 (3)$, anchor: "left", padding: 0.2)

    circle((3,3), radius: 0.05,fill:black, name: "v6")
    content("v6", $v_6 (4)$, anchor: "bottom", padding: 0.2)

     circle((5,4), radius: 0.05,fill:black, name: "v7")
    content("v7.left", $v_7 (1)$, anchor: "left", padding: 0.2)

     circle((6,7.5), radius: 0.05,fill:black, name: "v8")
    content("v8.left", $v_8 (3)$, anchor: "left", padding: 0.2)

     circle((5,1.5), radius: 0.05,fill:black, name: "v9")
    content("v9.left", $v_9 (2)$, anchor: "left", padding: 0.2)

    circle((6,-1), radius: 0.05,fill:black, name: "v10")
    content("v10.left", $v_10 (1)$, anchor: "top", padding: 0.2)

    circle((9,0), radius: 0.05,fill:black, name: "v11")
    content("v11.left", $v_11 (1)$, anchor: "left", padding: 0.2)

    line("v1", "v2")

    line("v2", "v3")

    line("v3", "v4")

    line("v3", "v5")

    line("v2", "v6")

    line("v6", "v7")
    
    line("v7", "v8")

    line("v6", "v9")

    line("v9", "v10")

    line("v10", "v11")


})
#figure(
  do-thi-cay-median-vi-du,
  caption: [Đồ thị cây với điểm median $v_6$],
) <fig-do-thi-cay-median-vi-du>
// do-thi-cay-median-vi-du

Ta có $W(T)=22$, các lá $s:= {v_1, v_4, v_5, v_8, v_11}$

Xét lá $v_1$, vì $w_1 = 1 < W/2 = 11$ nên $w_2:= w_2 + w_1 = 1+1= 2$ và xét cây mới $T:= T without {v_1}.$

Xét lá $v_4$, vì $w_4 = 2 < W/2 = 11$ nên $w_3 := w_3 + w_4 = 2+3=5$ và xét cây mới $T:= T without {v_4}.$

Xét lá $v_5$, vì $w_5 = 3 < W/2 = 11$ nên $w_3 := w_3 + w_5= 5+ 3 = 8$ và xét cây mới $T:= T without {v_5}.$

Xét lá $v_3$, vì $w_3 = 8 < W/2 = 11$ nên $w_2:= w_3 + w_2 = 8 + 2= 10$ và xét cây mới $T:= T without {v_3} $

Xét lá $v_2$, vì $w_2= 10 < W/2 =11 $ nên $w_6:= w_6 + w_2 = 4 + 10 = 14$ và xét cây mới $T:= T without {v_2}.$

Xét lá $v_6$, vì $w_6 = 14 > W/2 = 11$ nên trả về $X^* = { v_6}.$

Vậy $v_6$ là điểm 1-median cần tìm. 

