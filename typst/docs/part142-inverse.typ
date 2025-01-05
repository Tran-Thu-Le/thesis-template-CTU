// The inverse 1-median problem on a tree and on a path (Galavii)

// Thêm ý nghĩa của bài toán vào luận văn

// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof
// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
#include "../tools/multi-section-ref.typ"
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")
// == BÀI TOÁN INVERSE 1-MEDIAN TRÊN CÂY
// == INVERSE 1-MEDIAN VÀ CÁC BÀI TOÁN LIÊN QUAN 
// == Inverse 1-median và các bài toán liên quan




// === Định nghĩa bài toán
=== Bài toán Inverse 1-median 

Trong phần này, chúng ta sẽ xem xét một _Bài toán ngược (inverse problem)_ của lý thuyết vị trí có nhiều ứng dụng trong thực tế cuộc sống, đặc biệt là trong quy hoạch đô thị và logistics. Ví dụ, trong quy hoạch đô thị, chính phủ thường xây dựng các công trình công cộng như trường học hay bệnh viện. Tuy nhiên, các công trình này đôi khi chưa thực sự tối ưu so với sự phân bố dân cư và hệ thống giao thông hiện có, gây khó khăn cho việc di chuyển của người dân. Để khắc phục, chính phủ dành một khoản ngân sách để tái cấu trúc lại mật độ dân cư (ví dụ như bằng cách nâng cấp các cơ sở hạ tầng) với mục tiêu đưa các công trình quan trọng này trở thành "1-median" của khu vực. Bài toán này được gọi là _bài toán inverse 1-median trên cây_.

#let wt = $tilde(w)$

Bài toán này được mô hình hóa như sau:

Cho đồ thị cây $T=(V,E)$ với tập đỉnh $V={v_1,v_2,...,v_n}$ và tập cạnh $E$. Mỗi đỉnh trên đồ thị được gán một trọng số không âm, kí hiệu là $w_i, i=1,2,...,n$ và mỗi cạnh cũng có một độ dài không âm. Đặt $d(x,v_i)$ là độ dài đường đi ngắn nhất giữa $x$ và $v_i$. Bây giờ, ta sẽ cố định một đỉnh $s in V$ và thay đổi trọng số các đỉnh sao cho $s$ trở thành điểm 1-median. Giả sử rằng, chúng ta phải chịu một chi phí không âm $c_i$ nếu trọng số $w_i$ được tăng hoặc giảm một đơn vị và giả định rằng không thể tăng hoặc giảm các trọng số đỉnh một cách tùy ý. Cụ thể, các trọng số đỉnh phải tuân theo các giới hạn $underline(w)_i <= w_i <= overline(w)_i,$ $ forall i= 1,2,...,n$. Cuối cùng, ta gọi $p_i$ là lượng mà trọng số $w_i$ được tăng lên và gọi $q_i$ là lượng mà trọng số $w_i$ bị giảm đi.

Bài toán inverse 1-median trên cây có thể được phát biểu như sau: Tìm các trọng số đỉnh mới $w^*_i = w_i + p_i - q_i, forall i=1,2,...,n$ sao cho $s in V $ là điểm 1-median đối với các trọng số mới $w^*_i$, đồng thời các trọng số mới này phải nằm trong các giới hạn cho trước $underline(w)_i <= w^*_i <= overline(w)_i$, $forall$ $i=1,2,...,n$ và tổng chi phí $ sum_(i=1)^n c_i (p_i + q_i) $ cho việc thay đổi các trọng số là nhỏ nhất.

*(a) Điều kiện tối ưu*

Giả sử $ W= sum_(i=1)^n w_i $ là tổng trọng số của tất cả các đỉnh trên cây. 

Giả sử $t$ là điểm 1-median và $s (s != t)$ không phải là điểm 1-median ứng với trọng số cho trước. Lấy cây với gốc tại $s$ và xem xét các cây con $T_1, T_2, ..., T_k$, trong đó $k$ là bậc của đỉnh $s$. Giả sử rằng $T_k$ chứa đỉnh $t$, $tilde(w)_i$ là tổng trọng số của cây con $T_i$, $forall i=1,...,k$ và $tilde(w)_0 = w(s)$. Nếu $s$ không phải là điểm 1-median, ta có $tilde(w)_i < W/2,$ $forall$ $i=1,2,...,k-1$ và $tilde(w)_k > W/2$. 

Giả sử rằng ${v_1,..,v_(s-1)}$ và
$
  R= tilde(w)_k - sum_(i=0)^k (tilde(w)_k)/2
$. 

Định lý bên dưới là điều kiện tối ưu để một đỉnh $s$ bất kỳ trở thành điểm 1-median. Định lý này đã được @burkard2004inverse chứng minh.

#lemma("Điều kiện tối ưu")[Giả sử $tilde(w)_1 <= W/2,...,tilde(w)_(k-1)<= W/2$. Đỉnh $s$ là 1-median nếu và chỉ nếu $R=0$.
]

Phương trình $R=0$ nghĩa là 

$ 
sum_(i=s)^n (p_i - q_i) - sum_(i=1)^(s-1) (p_i - q_i) = 2tilde(w)_k - W
$ <eq:29>.

Do đó, bài toán inverse 1-median trên một cây với các trọng số dương có thể được viết dưới dạng tuyến tính như sau:

$
  min quad & sum_(i=1)^n c_i (p_i + q_i)\

  "s.t." quad & sum_(i=s)^n (p_i - q_i) - sum_(i=1)^(s-1) (p_i - q_i) = 2 wt_k - W\

  & p_i <= overline(w)_i - w_i &, i=1,2...,n\

  & q_i <= w_i -underline(w)_i &, i=1,2...,n \

  & p_i, q_i >= 0 &, i=1,2...,n
$


*(b) Giải thuật cho bài toán inverse 1-median trên cây*

Ý tưởng chính để giải bài toán này là chuyển nó về dạng tương đương với bài toán xếp ba lô liên tục. Khi đó, thay vì trực tiếp giải bài toán inverse 1-median trên cây, ta chỉ cần giải bài toán xếp ba lô liên tục, vốn đã có phương pháp giải đơn giản và hiệu quả như đã trình bày trước đó.

Như đã được @burkard2004inverse chỉ ra, giá trị $R$ sẽ giảm nếu: Trọng số của $s$(hoặc của một đỉnh trong $T_i, i=1,2,...,k-1$) tăng lên hoặc trọng số của một đỉnh trong $T_k$ giảm đi. 

Từ nhận xét trên, chúng ta có thể định nghĩa biến mới $x_i$ như sau:
$
  x_i &:= q_i,&  quad i&=1,...,s-1\
 
  x_i &:= p_i,&  quad i&=s,...,n.
$ 
 Lưu ý rằng, $q_i = 0,$ $forall$ $i= s,...,n$ và $p_i = 0,$ $forall i=1,...,s-1$. 
 
 Vì vậy phương trình #eqref(<eq:29>) có thể viết lại như sau: 
$ sum_(i=1)^n x_i = 2tilde(w)_k - W. $

Ngoài ra, ta cũng có:
$ 0 <= x_i <= cases( overline(w)_i - w_i "nếu" x_i = p_i, w_i - underline(w)_i "nếu" x_i = q_i )
$ <eq:34>

Tiếp theo, ta đặt:
$ u_i := cases(overline(w)_i - w_i "nếu" x_i = p_i, w_i - underline(w)_i "nếu" x_i = q_i) $ <eq:35>

Từ đây, ta có: 
$ 0<=x_i<=u_i  quad quad forall i=1,2,...,n. $

Tóm lại, từ #eqref(<eq:34>) và #eqref(<eq:35>), ta được:

$
  // ("LKP") \
  min quad & sum_(i=1)^n c_i x_i\

  "s.t." quad & sum_(i=1)^n x_i = b\

  & x_i <= u_i &, i=1,2...,n\

  & x_i >= 0 &, i=1,2...,n
$ <eq:37>

Trong đó $c_i$ và $b= 2tilde(w)_k - W$ không âm. 

Từ #eqref(<eq:37>), ta thấy rằng đây là bài toán xếp ba lô liên tục. Như đã trình bày ở phần trước, bài toán trên có thể được giải trong thời gian tuyến tính. Vì vậy, bài toán inverse 1-median trên cây với trọng số dương có thể được giải trong thời gian $O(n).$

#theorem[ Bài toán inverse 1-median trên cây với trọng số không âm có thể được giải trong thời gian đa thức.]

Bây giờ, ta sẽ xét ví dụ sau.

#example[Cho cây $T=(V,E)$ có trọng số như hình bên dưới. $v_2$ là điểm 1-median ứng với trọng số đã cho. Ta cần phải chỉnh $w_i, i=1,...,6$ sao cho $v_4$ trở thành điểm 1-median, đồng thời vẫn thỏa mãn các ràng buộc cho trước. Cụ thể:
$c_1=1, c_2 = 6, c_3 = 4, c_4 =5, c_5=7, c_6 = 8,

4 <= w_1 <= 8, 
4 <= w_2 <= 6,
5 <= w_3 <= 9,
3 <= w_4 <= 5,
2 <= w_5 <= 6,
2 <= w_6 <= 4.$]

#let do-thi-de-giai-inverse = canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.top", $v_2 (5)$, anchor: "right", padding: 0.3)

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

    line("v1","v2")

    line("v3","v2")

    line("v4","v2")

    line("v4","v5")

    line("v4","v6")
})

#figure(
  do-thi-de-giai-inverse,
  caption: [Đồ thị cây ví dụ cho bài toán Inverse 1-median]
)

Ta có
$ b = 2 tilde(w)_k - W = 2.18 - 28 = 8  $

Thế vào #eqref(<eq:37>), ta được:
$

min quad & sum_(i=1)^6 c_i x_i\

"s.t." quad & sum_(i=1)^6 x_i = 8\

 & 0 <= x_1 <= 2\

 & 0 <= x_2 <= 1 \

 & 0 <= x_3 <= 2 \

 & 0 <= x_4 <= 1 \

 & 0 <= x_5 <= 3 \

 & 0 <= x_6 <= 1 \
$ <eq:39>

Vậy, ta đã hoàn thành bước viết lại bài toán inverse 1-median thành bài toán xếp ba lô liên tục. Như đã trình bày ở phần trước ta sẽ tiến hành giải bài toán <eq:39> bằng thuật toán tham lam.

Sau khi giải ta thu được kết quả sau $x_1 = 2, x_2 = 1, x_3 = 2, x_4 =1, x_5 = 2, x_6 = 0.$

Khi đó, ta thu được các trọng số mới của mỗi đỉnh như sau:
$
w^*_1 = w_1 + p_1 - q_1 = 6 - 2 = 4 \

w^*_2 = w_2 + p_2 - q_2 = 5 - 1 = 4 \

w^*_3 = w_3 + p_3 - q_3 = 7 - 2 = 5 \

w^*_4 = w_4 + p_4 - q_4 = 4 + 1 = 5 \

w^*_5 = w_5 + p_5 - q_5 = 3 + 2 = 5 \

w^*_6 = w_6 + p_6 - q_6 = 3 + 0 = 3 \

$

Ta được đồ thị cây $T=(V,E)$ với trọng số mới được biểu diễn ở hình bên dưới.

#let do-thi-cay-trong-so-moi = canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.left", $v_2 (4)$, anchor: "bottom-left", padding: 0.2)

    circle((-3,0), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1 (4)$, anchor: "left", padding: 0.2)

    circle((-3,6), radius: 0.05,fill:black, name: "v3")
    content("v3.left", $v_3 (5)$, anchor: "left", padding: 0.2)

    circle((4,3), radius: 0.05,fill:black, name: "v4")
    content("v4.left", $v_4 (5)$, anchor: "bottom-right", padding: 0.2)

    circle((7,6), radius: 0.05,fill:black, name: "v5")
    content("v5.left", $v_5 (5)$, anchor: "left", padding: 0.2)

    circle((7,0), radius: 0.05,fill:black, name: "v6")
    content("v6.left", $v_6 (3)$, anchor: "left", padding: 0.2)

    line("v1","v2")

    line("v3","v2")

    line("v4","v2")

    line("v4","v5")

    line("v4","v6")

})
#figure(
  do-thi-cay-trong-so-moi,
  caption: [Đồ thị cây sau khi giải Inverse 1-median],
) <fig-do-thi-cay-trong-so-moi>








