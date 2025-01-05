// trích bài báo Up- down grading the 1-median in a network Gassner
// #text(orange)[*Bài toán nâng cấp 1-median*]

// #include "../tools/multi-section-ref.typ"
// #import "../tools/macros.typ": eqref
// #import "../typst-orange.typ": theorem, proof, lemma, proposition, corollary, example
// #import "@preview/cetz:0.1.2": canvas, plot
// #import "@preview/cetz:0.1.2"

#include "../tools/multi-section-ref.typ"
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "../tools/macros.typ": eqref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")


// == BÀI TOÁN NÂNG CẤP 1-MEDIAN TRÊN CÂY
=== Bài toán Upgrading 1-median 

Trong mục này, ta sẽ xem xét một bài toán được gọi là _Nâng cấp đồ thị (Upgrading graphs)_ .

// Giả sử một thành phố có mạng lưới các con đường nối liền các quận với nhau, với một bến xe buýt trung tâm đặt tại quận A - vị trí được chọn làm điểm trung chuyển tối ưu để người dân dễ dàng di chuyển tới các khu vực khác. Tuy nhiên, theo thời gian, khi dân số tăng lên và lưu lượng giao thông trở nên quá tải, việc di chuyển từ các quận tới quận A ngày càng mất nhiều thời gian, gây ra tình trạng tắc nghẽn và phiền toái.

// Trong bối cảnh đó, thành phố đối mặt với thách thức lớn: ngân sách hạn chế không cho phép xây dựng lại hoàn toàn mạng lưới đường sá hay thay đổi vị trí của bến xe buýt trung tâm. Do vậy, giải pháp khả thi nhất là nâng cấp một số tuyến đường hiện có - có thể là mở rộng đường, nâng cao chất lượng cơ sở hạ tầng hoặc giảm tải giao thông ở những tuyến trọng điểm - nhưng vẫn phải đảm bảo không vượt quá giới hạn ngân sách. 

// Mục tiêu của việc nâng cấp này là làm sao giảm thiểu thời gian di chuyển trung bình của người dân từ các quận khác đến bến xe buýt tại quận A, giúp giao thông trở nên thuận tiện và hiệu quả hơn. Đây chính là một ví dụ cơ bản của bài toán nâng cấp, trong đó thành phố cố gắng tối ưu hóa hệ thống giao thông hiện tại thay vì xây dựng lại từ đầu, nhằm đạt được hiệu quả cao nhất trong giới hạn chi phí có sẵn.

Bài toán Upgrading khác với các bài toán vị trí cổ điển. Trong khi, các bài toán vị trí cổ điển vốn tập trung vào việc xác định vị trí tối ưu cho các cơ sở hạ tầng, bài toán Upgrading tập trung vào việc điều chỉnh và nâng cấp mạng lưới cơ sở hạ tầng trong các giới hạn cho phép, nhằm tối ưu hóa giá trị của hàm mục tiêu. 

Trong phần này, chúng ta sẽ tập trung vào _Bài toán nâng cấp hàm mục tiêu 1-median_, trong đó trọng số của các đỉnh được điều chỉnh trong một phạm vi giới hạn, đồng thời phải thỏa mãn một ràng buộc ngân sách nhất định. Bài toán này đã được trình bày bởi @gassner2007up.

// Giả sử một công ty có kế hoạch mở một nhà máy mới với sức chứa $B$. Hiện tại, công ty có $n$ kho hàng, mỗi kho có sức chứa $w_i$ với $i=1,...,n$, (và tổng lượng nguyên liệu thô tại nhà máy là $sum_(i=1)^n w_i$). Công ty muốn xác định số lượng nguyên liệu lưu trữ tại mỗi kho cũng như vị trí tối ưu để đặt nhà máy nhằm giảm thiểu tổng chi phí vận chuyển từ các kho đến nhà máy.

// Ứng dụng này có thể được mô hình hóa bằng bài toán nâng cấp 1-median, trong đó nhiệm vụ là thay đổi trọng số của các đỉnh (ở đây là sức chứa của mỗi kho) trong các giới hạn nhất định (nhà máy có thể nhận tối đa _B_ đơn vị) sao cho tổng chi phí vận chuyển đến vị trí của nhà máy được giảm thiểu. Do đó, bài toán này không cố định một vị trí và cải thiện tối đa chất lượng của nó bằng cách thay đổi trọng số đỉnh, mà thay vào đó, nó thực hiện hai bước: đầu tiên là thay đổi trọng số đỉnh và sau đó xác định vị trí tối ưu dựa trên các trọng số mới. Hay nói một cách cụ thể hơn, trong bài toán nâng cấp 1-median, ta phải thay đổi các tham số của mạng trong những giới hạn nhất định sao cho giá trị hàm mục tiêu 1-median tối ưu được giảm thiểu.


// Các bài toán nâng cấp có mối liên hệ chặt chẽ với các bài toán ngược (reverse), trong đó một nghiệm khả thi được cho trước và nhiệm vụ là thay đổi các tham số trong một số giới hạn nhất định để tối đa hóa giá trị mục tiêu của nghiệm khả thi đó. Ngoài ra, các bài toán ngược (inverse) cũng thuộc loại bài toán sửa đổi mạng, trong đó một nghiệm khả thi đã được cho trước. Tuy nhiên, ở đây nhiệm vụ là thay đổi các tham số trong một số giới hạn nhất định với chi phí tối thiểu để nghiệm khả thi đã cho trở thành nghiệm tối ưu đối với các tham số đã được sửa đổi. Các bài toán xác định vị trí ngược đã được nghiên cứu trong [6, 7, 12]. (xem bài của Gassner)


//Trong bài báo này, chúng tôi xem xét một biến thể của bài toán 1-median, trong đó mạng được sửa đổi trước khi cơ sở được đặt trên mạng. Các bài toán nâng cấp và hạ cấp có thể được xem như các bài toán hai cấp độ, trong đó một người ra quyết định (người hành động) thay đổi trọng số đỉnh trong một số giới hạn nhất định và một người ra quyết định khác (nhà lập kế hoạch vị trí hoặc người phản ứng) định vị cơ sở một cách tối ưu dựa trên các trọng số đỉnh mới. Mục tiêu của nhà lập kế hoạch vị trí là tối thiểu hóa giá trị mục tiêu 1-median. Tùy thuộc vào việc mục tiêu của người hành động và người phản ứng có giống nhau hay mâu thuẫn với nhau, chúng ta sẽ nói về các bài toán nâng cấp hoặc hạ cấp. Trong phiên bản nâng cấp, người hành động muốn tối thiểu hóa giá trị mục tiêu 1-median (tức là, người hành động và người phản ứng có cùng mục tiêu), trong khi trong phiên bản hạ cấp, người hành động tìm cách tối đa hóa giá trị mục tiêu 1-median trong khi nhà lập kế hoạch vị trí muốn tối thiểu hóa giá trị này. Do đó, phiên bản hạ cấp là một bài toán max-min.
// == #text(orange)[CHƯƠNG 2: KIẾN THỨC CHUẨN BỊ]

// === Định nghĩa và giải thuật

// Để tiếp cận bài toán một cách hiệu quả, trước tiên chúng ta sẽ tóm tắt ngắn gọn vấn đề và sau đó xây dựng mô hình toán học của nó.

// Mô tả bài toán: Cho đồ thị $G$, mỗi đỉnh trên đồ thị được gán một trọng số không âm. Từ trọng số trên, ta có thể tìm được điểm 1-median và giá trị hàm mục tiêu đạt được tại điểm đó. Nhiệm vụ của bài toán nâng cấp là điều chỉnh trọng số đỉnh thỏa mãn các ràng buộc nhất định, sao cho giá trị hàm mục tiêu median được tối thiểu. Sau đây, ta sẽ tiến hành mô hình hóa bài toán.

Cho đồ thị $G=(V,E)$, có $n$ đỉnh, mỗi đỉnh được gán một trọng số không âm, gọi là $w_v$. 
Gọi $f(w)$ là giá trị mục tiêu 1-median với vecto trọng số $w$. Mục tiêu của bài toán nâng cấp 1-median là điều chỉnh trọng số đỉnh bằng $delta= (delta_v)_(v in V)$ sao cho $delta$ thỏa mãn điều kiện ràng buộc về ngân sách $B$, giới hạn điều chỉnh $u$ và đồng thời $f(w- delta)$ nhỏ nhất.

Khi đó, bài toán nâng cấp 1-median được biểu diễn như sau:

$

 min_(delta in Delta) f(w- delta) = min_(delta in Delta) min_(x in V) quad & sum_(v in V) (w_v - delta_v) d(v,x) \

"s.t." quad & sum_(v in V) c_v delta_v <= B \

& 0 <= delta_v <= u_v \
$

Hoán đổi hai phép lấy giá trị nhỏ nhất, ta được:

$ 
min_(x in V) min_(delta in Delta) quad & sum_(v in V) (w_v - delta_v) d(v,x) \
"s.t." quad & sum_(v in V) c_v delta_v <= B \

& 0 <= delta_v <= u_v \
$ <eq:42>


Khi cố định một $x in V$ bất kỳ, ta được một bài toán reverse 1-median. Mỗi bài toán reverse 1-median là một bài toán xếp ba lô liên tục được giải trong thời gian $O(n)$ (đã được trình bày ở mục trước). Do đó bài toán #eqref(<eq:42>) có thể được giải bằng cách giải $n$ bài toán xếp ba lô liên tục và sau đó so sánh các giá trị mục tiêu cải thiện.

#theorem[ Bài toán nâng cấp 1-median bằng cách thay đổi trọng số đỉnh có thể được giải trong thời gian $O(n^2)$.]

Ta kết thúc mục này bằng một ví dụ minh họa sau:
Cho đồ thị $G=(V,E)$ có trọng số đỉnh và cạnh như hình bên dưới. Trong đó:

#align(center)[#table(
  columns: 4,
  [$v$], [1], [2], [3],
  [$c_v$], [1], [1], [1],
  [$u_v$], [2], [2], [2] 
)]
với ngân sách $B=2.$

#let do-thi-upgrading = canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v2")
    content("v2.top", $v_2 (1)$, anchor: "top", padding: 0.2)

    circle((-4,3), radius: 0.05,fill:black, name: "v1")
    content("v1.top", $v_1 (4)$, anchor: "top", padding: 0.2)

    circle((4,3), radius: 0.05,fill:black, name: "v3")
    content("v3.top", $v_3 (4)$, anchor: "top", padding: 0.2)

    line("v1","v2")

    line("v2","v3")

})

#figure(
  do-thi-upgrading,
  caption: [Đồ thị cây ví dụ cho bài toán Upgrading 1-median],
) <fig-do-thi-upgrading>
  
  Các giá trị hàm mục tiêu với trọng số ban đầu là $f(v_1)=f(v_3)=9$ và $f(v_2)=8$. Do đó, đỉnh $v_2$ là điểm 1-median.

  Bây giờ, ta sẽ giải bài toán xếp ba lô liên tục khi cố định $v_1$. Ta thu được $ delta_1 = delta_2 = 0 $ và $ delta_3 = 2. $
  Vì vậy, giá trị mục tiêu ứng với trọng số mới của đỉnh $v_1$ là $tilde(f)(v_1) = 5.$

  Do tính đối xứng, ta cũng thu được $ delta_1 = 2 $ và $delta_2 = delta_3 = 0. $
  Giá trị mục tiêu ứng với trọng số mới của đỉnh $v_3$ là $tilde(f)(v_3) = 5.$

  Cuối cùng, cố định đỉnh $v_2$, giải bài toán xếp ba lô liên tục ta được $ delta_1 = delta_3 = 1 $ và $ delta_2 = 0. $
  Do đó, giá trị mục tiêu sau khi cải thiện là $tilde(f)(v_2) = 6.$

  Vậy sau khi nâng cấp, đỉnh $v_1$ và $v_3$ có thể trở thành 1-median và giá trị mục tiêu đạt được là 5. Đồng thời, dẫn đến việc đỉnh $v_2$ không còn giữ được tính tối ưu của nó. 


// Ký hiệu giá trị mục tiêu 1-median tối ưu với trọng số đỉnh $w$ là $f(w)$. Sau đó, nhiệm vụ của bài toán nâng cấp 1-median là tăng các trọng số bằng \( \delta = (\delta_v){v \in V} \) sao cho \( \delta \) là một sự thay đổi trọng số đỉnh khả thi và \( z(w - \delta) \) được tối thiểu hóa. Tương tự, bài toán hạ cấp 1-median là tìm một sự thay đổi trọng số khả thi \( \delta \) sao cho \( z(w + \delta) \) được tối đa hóa.

// Một sự thay đổi trọng số đỉnh \( \delta = (\delta_v){v \in V} \) được gọi là khả thi nếu một ràng buộc ngân sách được đáp ứng và các thay đổi nằm trong các giới hạn nhất định: 

// - Gọi \( c_v \in \mathbb{R}^+ \) cho \( v \in V \) là chi phí thay đổi trọng số của đỉnh \( v \) một đơn vị.
// - Gọi \( u_v \in \mathbb{R}^+ \) cho \( v \in V \) là giới hạn trên cho việc thay đổi trọng số của đỉnh \( v \).
// - Hơn nữa, chúng ta được cung cấp tổng ngân sách \( B \).

// Sau đó, \( \delta \) là khả thi nếu \( \delta \in \Delta \) với ∆ = (δ vX∈V cvδv ≤ B and 0 ≤ δv ≤ uv for all v ∈ V )

// Do đó, chúng ta có thể định nghĩa các bài toán nâng cấp và hạ cấp như sau:

// Gọi \( G = (V, E) \) là một đồ thị với các trọng số đỉnh \( w_v \in \mathbb{R}^+ \), các hệ số chi phí \( c_v \in \mathbb{R}^+ \) và các giới hạn \( u_v \in \mathbb{R}^+ \) cho tất cả \( v \in V \), các độ dài cạnh \( \ell_e \in \mathbb{R}^+ \) cho tất cả \( e \in E \), và tổng ngân sách \( B \).

// Sau đó, bài toán nâng cấp 1-median, viết tắt là Up1Median, là để giải quyết:
// \[
// \min_{\delta \in \Delta} z(w - \delta) = \min_{\delta \in \Delta} \min_{x \in V} \sum_{v \in V} (w_v - \delta_v) d(v, x).
// \]

// Và bài toán hạ cấp 1-median, viết tắt là Down1Median, là để giải quyết:
// \[
// \max_{\delta \in \Delta} z(w + \delta) = \max_{\delta \in \Delta} \min_{x \in V} \sum_{v \in V} (w_v + \delta_v) d(v, x).
// \]

// Trong bài báo này, chúng tôi sẽ trình bày một thuật toán thời gian \( O(n^2) \) cho Up1Median với điều kiện ma trận khoảng cách được cho trước. Đối với Down1Median, một công thức lập trình tuyến tính được đưa ra. Do đó, Down1Median có thể được giải quyết trong thời gian đa thức. Nếu đồ thị cơ bản là một cây, một loại tính chất lõm có thể được chứng minh cho Down1Median, điều này dẫn đến một thuật toán thời gian \( O(n \log n) \).
// // == #text(orange)[Giải bài toán]
// == Giải bài toán

// Phần này dành riêng cho việc nâng cấp 1-median trong một đồ thị. Cho một đồ thị \( G = (V, E) \), trọng số đỉnh \( w_v \in \mathbb{R}^+ \), hệ số chi phí \( c_v \in \mathbb{R}^+ \) và các giới hạn \( u_v \leq w_v \in \mathbb{R}^+ \) cho tất cả \( v \in V \), độ dài cạnh \( \ell_e \in \mathbb{R}^+ \) cho tất cả các cạnh \( e \in E \) và một ngân sách \( B \), nhiệm vụ là giải quyết:
// \[
// \min_{\delta \in \Delta} \min_{x \in V} \sum{v \in V} (w_v - \delta_v)d(v, x)
// \]

// Vì chúng ta có thể hoán đổi hai phép toán tối thiểu đầu tiên, Down1Median tương đương với:

// \[
// \min_{x \in V} \min_{\delta \in \Delta} \sum{v \in V} (w_v - \delta_v) d(v, x)
// \]

// Điều này dẫn đến \( n \) bài toán reverse 1-median. Đối với mỗi đỉnh \( x \in V \), giá trị mục tiêu tương ứng của 1-median phải được cải thiện tối đa bằng một thay đổi trọng số khả thi. Cuối cùng, giá trị mục tiêu tốt nhất sau khi nâng cấp bằng với giá trị mục tiêu tối ưu của Up1Median. Mỗi bài toán reverse 1-median là một bài toán knapsack liên tục có thể được giải quyết trong thời gian \( O(n) \) (Balas và Zemel [1]). Do đó, Up1Median có thể được giải quyết bằng cách giải quyết \( n \) bài toán knapsack liên tục và cuối cùng so sánh các giá trị mục tiêu đã được cải thiện tối đa.

// Định lý 1. Nâng cấp 1-median bằng cách thay đổi trọng số đỉnh có thể được giải quyết trong thời gian \( O(n^2) \) với điều kiện ma trận khoảng cách được cung cấp.

// Chúng tôi kết thúc phần này với một ví dụ minh họa một số tính chất của Up1Median. Nói chung, 1-median thay đổi sau khi thay đổi trọng số tối ưu. Xét ví dụ sau đây của Up1Median được cho trong Hình 1 với \( B = 2 \).

// (vẽ hình)

// Các giá trị mục tiêu đối với các trọng số ban đầu là \( f(1) = f(3) = 9 \) và \( f(2) = 8 \). Do đó, đỉnh 2 là 1-median duy nhất. Bây giờ, cố định đỉnh 1 và cải thiện tối đa giá trị mục tiêu của nó. Khi đó \( \delta_1 = \delta_2 = 0 \) và \( \delta_3 = 2 \) là một cải thiện tối ưu và do đó giá trị mục tiêu mới của đỉnh 1 bằng \( \tilde{f}(1) = 5 \). Do đối xứng, \( \delta_1 = 2 \) và \( \delta_2 = \delta_3 = 0 \) là sự cải thiện tối ưu của đỉnh 3 với giá trị mục tiêu cải thiện \( \tilde{f}(3) = 5 \). Nếu đỉnh 2 được cải thiện tối đa thì \( \delta_1 = \delta_3 = 1 \) và \( \delta_2 = 0 \), và do đó giá trị mục tiêu cải thiện của đỉnh 2 là \( \tilde{f}(2) = 6 \). Như vậy, hoặc đỉnh 1 hoặc đỉnh 3 là 1-median sau khi thay đổi trọng số tối ưu, và do đó đỉnh 2 mất tính tối ưu của nó.