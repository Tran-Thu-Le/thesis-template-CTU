#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, myref, figref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: none)
#let USR = [USR]
#let USR1 = link(<eq-USR1>)[#text(fill: blue)[(USR1)]]
#let USR2 = link(<eq:23>)[#text(fill: blue)[(USR2)]]
#let PUSR1 = link(<eq:24>)[#text(fill: blue)[(PUSR1)]]
#let PUSR2 = link(<eq:33>)[#text(fill: blue)[(PUSR2)]]



==  Bài toán nâng cấp cận dưới bán kính ổn định 

Như đã đề cập, điểm 1-median đóng vai trò quan trọng trong mạng lưới đồ thị tổng quát, đặc biệt là đồ thị cây. Bán kính ổn định của điểm 1-median phản ánh mức độ ổn định của nó khi trọng số các đỉnh trên đồ thị biến động. Trong mục này, chúng ta sẽ củng cố tính ổn định của cơ sở tối ưu bằng cách nâng cấp (cận dưới) bán kính ổn định với một ngân sách cho trước.
=== Mô hình hóa bài toán


Giả sử $v_1 in V $ là điểm 1-median trên cây $T$ tương ứng với trọng số $w in RR_n^+$ cho trước, thỏa mãn điều kiện tổng trọng số đỉnh có độ lớn không đổi. Với một ngân sách $B >= 0 $, mục tiêu của ta là điều chỉnh trọng số từ $w$ thành một vecto trọng số $tilde(w) in RR_n^+$ trong giới hạn ngân sách, sao cho:

1. Cận dưới của bán kính ổn định mới, $underline(R)(tilde(w))$, là lớn nhất. 

2. Đỉnh $v_1$ vẫn là điểm 1-median ứng với $tilde(w)$.

3. Chi phí thay đổi từ $w$ sang $tilde(w)$ không vượt quá ngân sách $B$. Trong đó, chi phí thay đổi trọng số từ $w$ thành $tilde(w)$ được đo bằng chuẩn $"L1"$, tức là $norm(w - tilde(w))_1$.

4. Tổng trọng số trên cây không đổi, hay nói cách khác $sum_(i=1) ^n tilde(w) = sum_(i=1) ^n w = 1$.

5. Trọng số mới $tilde(w)$ không được chênh lệch quá lớn so với $w$ ban đầu, cụ thể là $tilde(w) in [w-epsilon_0, w + epsilon_0] subset RR^n_+$, với một hằng số $epsilon_0 >0 $ cho trước. 

Bài toán này được gọi là _nâng cấp bán kính ổn định (USR - Upgrading Stability Radius)_ của điểm 1-median $v_1$ với dữ liệu đầu vào là trọng số ban đầu $w$. Trong đó $B$ và $epsilon_0$ là các tham số của mô hình bài toán.

Lúc này, bài toán có thể được viết lại như sau:

$
"(USR1)" quad quad max quad & underline(R)(tilde(w)) \ 

"s.t." quad & norm(tilde(w)-w)_1 <= B \

 & v_1 "is 1-median w.r.t" tilde(w) #<USR-med-cond>\

 & sum^n_(i=1) tilde(w)_i = 1 \

 & norm(tilde(w)-w)_infinity <= epsilon_0 
$ <eq-USR1>



Trước khi giải bài toán này, ta sẽ để đơn giản hóa nó bằng cách đổi biến và giảm bớt các ràng buộc:

1. Viết lại bài toán $max$ thành $min$.

2. Loại bỏ ràng buộc median trong #USR1. // #myref[@USR-med-cond].

3. Đổi biến từ vecto trọng số $tilde(w)$ sang $x = tilde(w) - w$, trong đó $x$ được gọi là vecto điều chỉnh.

// *Định lý 3.1* --> @thm-lower-bound-SR 

Bài toán $underline(R)(w)$ với hàm mục tiêu $max$ có thể được chuyển đổi thành một bài toán $min$ như sau:


$
    "(USR2)" quad quad min quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r \ 

    "s.t." quad & norm(x)_1 <= B \

    & sum^n_(i=1) x_i = 0 \

    & x_i in [-epsilon_0; epsilon_0], quad forall i = 1,...,n 
$ <eq:23>



===  Tham số hóa bài toán
// nâng cấp bán kính ổn định

Sau khi chuyển đổi sang bài toán đơn giản hơn #eqref(<eq:23>), phần này sẽ tập trung vào việc giải quyết #eqref(<eq:23>). Dễ dàng nhận thấy bài toán này có thể được biểu diễn dưới dạng một bài toán quy hoạch tuyến tính với không gian $n$ chiều và $n+2$ ràng buộc. Nhờ vậy, nó có thể được giải bằng các phương pháp kinh điển như thuật toán đơn hình hoặc các thuật toán thời gian đa thức do @karmarkar1984new và @megiddo1984linear đề xuất.

Tuy nhiên, khi số chiều tăng lên, thời gian tính toán tăng đáng kể. Điều này là một rào cản trong thực tế, khi các đồ thị cây được phân tích có thể chứa hàng trăm hoặc thậm chí hàng chục nghìn đỉnh, khiến việc giải bài toán trở nên không khả thi bằng các thuật toán đã nêu. Do đó, trong phần này, tôi sẽ đề xuất một thuật toán tổ hợp nhằm giải quyết bài toán một cách hiệu quả hơn.

Việc giải quyết bài toán #eqref(<eq:23>) thực chất là trả lời cho câu hỏi: _"Giá trị mục tiêu nhỏ nhất có thể đạt được trong giới hạn ngân sách $B$ là bao nhiêu?"_.

Tuy nhiên, thay vì tập trung vào câu hỏi này, ta có thể chuyển sang một câu hỏi ngược lại như sau: _"Với một giá trị mục tiêu $t$ cho trước, ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không vượt quá $t$ là bao nhiêu?"_. Câu hỏi này có thể được diễn đạt dưới dạng bài toán dưới đây:



$
    "(PUSR1)" quad quad min quad & norm(x)_1 \

    "s.t." quad & max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r <= t \

    & sum^n_(i=1) x_i = 0 \

    & x_i in [-epsilon_0; epsilon_0], forall i = 1,...,n 
$ <eq:24>

Khi đó, ta gọi bài toán này là _phiên bản tham số của bài toán nâng cấp bán kính ổn định (PUSR - Parametric USR)_. Thoạt nhìn, bài toán #PUSR1 được xây dựng từ #USR2 bằng cách hoán đổi vai trò giữa mục tiêu và ràng buộc ngân sách. Với các bổ đề và định lý sẽ được trình bày ở phần tiếp theo, chúng ta sẽ thấy rằng việc giải bài toán tham số không chỉ đơn giản hơn so với bài toán gốc, mà còn cho phép ta dễ dàng tìm lại được nghiệm của bài toán gốc khi biết nghiệm của bài toán tham số.

Ta có nhận xét về mối liên hệ giữa #PUSR1 và #USR2:

1. Nếu ngân sách tối thiểu cần thiết để đạt được giá trị mục tiêu không lớn hơn $t$ không vượt quá $B$, thì việc tăng ngân sách lên $B$ sẽ cho phép giảm $t$ để đạt được giá trị mục tiêu nhỏ nhất của bài toán ban đầu. 

2. Ngược lại, khi giá trị $t$ vẫn còn lớn hơn hoặc bằng giá trị mục tiêu tối ưu $t^*$ thì nghĩa là ta vẫn chưa sử dụng hết ngân sách $B$. 

Nói cách khác, giải quyết bài toán tham số này cho phép chúng ta xác định xem $t$ có lớn hơn giá trị mục tiêu nhỏ nhất của bài toán gốc hay không.

Từ nhận xét thú vị này, ta có được bổ đề bên dưới:

#lemma[Ta có 
$ beta(t) <= B <=> t>= t^* $ trong đó $beta(t)$ là ngân sách cần thiết nhỏ nhất để đạt được giá trị $t$ và $t^*$ là giá trị mục tiêu tối ưu của bài toán #eqref(<eq:23>).
] <thm-beta-t>

Để chứng minh bổ đề này, trước hết ta giới thiệu một số ký hiệu bổ sung. Với ngân sách cố định $B$, ta gọi $x^*$ và $t^*$ lần lượt là nghiệm tối ưu và giá trị mục tiêu tối ưu của bài toán #eqref(<eq:23>). Với mỗi tham số $t$ cho trước, giả sử $hat(x)(t)$ và $beta(t)$ lần lượt là nghiệm tối ưu và ngân sách tối thiểu tương ứng trong #eqref(<eq:24>). Cần lưu ý rằng, $beta(dot)$ là một hàm không giảm trên miền xác định của nó và nhận giá trị $+infinity$ nếu tập khả thi của #eqref(<eq:24>) bằng rỗng. Cuối cùng, ta đặt $P(x)= max_(u in N(v_1)) angle.l w + x, bb(1)_T_u angle.r $ là hàm mục tiêu của #eqref(<eq:23>).

#proof[ Chứng minh gồm hai chiều, 

Ta bắt đầu với chiều thuận. Nếu $beta(t) <= B$, thì $hat(x)(t)$ là một nghiệm khả thi ứng với #eqref(<eq:24>), do đó, $P(hat(x)(t)) >= P(x^*)$. Vì thế, $t >= P(hat(x)(t)) >= P(x^*) = t^*$, hay nói cách khác, ta có $t >= t^*$.

Ta tiến hành chứng minh chiều ngược lại. Giả sử rằng $t >= t^*$. Bởi vì $t^* = P(x^*)$, suy ra $P(x^*) <= t$. Do đó, $norm(hat(x)(t))_1 <= norm(x^*)_1$. Vì $x^*$ là nghiệm tối ưu đối với #eqref(<eq:24>) nên $norm(x^*)_1 <= B$. Vì vậy, $beta(t)= norm(hat(x)(t))_1 <= norm(x^*)_1 <= B$. Ta hoàn thành chứng minh.]



Từ @thm-beta-t, ta có thể thấy rằng 
$ beta(t^*) <= B $. <eq:26>

Trong phần tiếp theo, chúng ta sẽ dùng @thm-beta-t để xây dựng một phép biến đổi từ $(hat(x)(t), beta(t))$ của bài toán #eqref(<eq:23>) sang $(x^*, t^*)$ của #eqref(<eq:24>).



#theorem[Giá trị mục tiêu $t^*$ của #eqref(<eq:23>) được tính theo $beta(t)$ như sau:
$ t^* = inf{t: beta(t) <= B}. $ <eq-computing-topt>
Hơn nữa, $hat(x)(t^*)$ là nghiệm tối ưu của #eqref(<eq:23>).] <thm-computing-topt>



#proof[
Từ @thm-beta-t, ta có thể thấy rằng $t^* <= t$  với mọi $t$ thỏa $beta(t)<= B$. Suy ra $t^* <= inf{t: beta(t)<= B}$. Mặt khác, bất đẳng thức #eqref(<eq:26>) kéo theo $t^* >= inf{t: beta(t)<= B}$. Như vậy, $t^*= inf{t: beta(t)<= B}$.




Hơn nữa từ #eqref(<eq:26>), ta suy ra $hat(x)(t^*)$ là một nghiệm khả thi của #eqref(<eq:23>). Do đó, $ P(hat(x)(t^*)) >= P(x^*) = t^* $. 

Hơn nữa, tính khả thi của $hat(x)(t^*)$ trong #eqref(<eq:23>) suy ra $ t^* >= P(hat(x)(t^*)) $.

Từ đây, ta được $ P(hat(x)(t^*)) = t^* $ nghĩa là $hat(x)(t^*)$ là nghiệm tối ưu của #eqref(<eq:23>).]

// *Định lý 3.3* --> @thm-computing-topt

Từ @thm-computing-topt, có thể thấy rằng nếu ta có thể giải được bài toán tham số #eqref(<eq:24>), tức là tìm được $beta(t)$ và $hat(x)(t)$ với $t$ bất kỳ, thì ta có thể xây dựng một nghiệm tối ưu $x^* = hat(x)(t^*)$, trong đó $t^*$ có thể được tính theo công thức #myref[@eq-computing-topt]. 

Để giải bài toán tham số #eqref(<eq:24>) một cách đơn giản và nhanh chóng, trước hết, ta sẽ thực hiện phép đổi biến nhằm giảm chiều bài toán. Để thực hiện được điều này, ta cần lưu ý rằng, tồn tại một nghiệm tối ưu $x$ của bài toán tham số mà trong đó các giá trị thành phần $x_i$ ứng với các $v_i$, $v_i in T_u$ với $u in N(v_1)$, là bằng nhau. Do đó, ta có thể đối $x$ thành biến mới $z$, trong đó mỗi thành phần của $z$ đại diện cho tổng của $x_i$ đối với các đỉnh $v_i in T_u$. Bằng cách đổi biến như trên, ta có thể giảm chiều bài toán một cách đáng kể, cụ thể giảm từ $n$ chiều về $k$ chiều, với $k$ là bậc của đỉnh $v_1$. 

Bây giờ, ta sẽ đi vào cụ thể chi tiết cách đổi biến cho bài toán. Đặt $N(v_1)={u_1,...,u_k}$ nghĩa là $N(v_1)$ là tập hợp tất cả các đỉnh liền kề với $v_1$, $u_0=v_1$ và $T_u_0={v_1}$. Gọi $gamma_j= angle.l w, bb(1)_T_u_j angle.r$ là tổng trọng số đỉnh của cây con lấy gốc tại $u_j$, $j=0,1,...,k$. Cho $x in RR^n$, ta định nghĩa vecto mới $z, overline(z) in RR^(k+1)$, trong đó thành phần thứ $j$ với $j=0,1,...k$ được xác định như sau:

$ z_j= angle.l x, bb(1)_T_u_j angle.r, $
$ overline(z)_j=epsilon_0.abs(T_u_j). $

Từ cách đổi biến như trên, bài toán #eqref(<eq:24>) ban đầu trở thành bài toán mới với số chiều $k$:


$
    "(PUSR2)" quad quad min quad & sum_(j=0)^k abs(z_j) \

    "s.t." quad & max_(j=1,...,k) (gamma_j + z_j) <= t    \

    & sum^k_(j=1) z_j = 0 \

    & z_j in [-overline(z)_j; overline(z)_j], forall j = 0,1,...,k 
$ <eq:33>

Từ nghiệm của bài toán #PUSR2, ta có thể tìm lại nghiệm của #PUSR1 thông qua mệnh đề sau.

#proposition[ Bài toán #PUSR2 và #PUSR1 có cùng giá trị mục tiêu $beta(t)$. Hơn nữa, nếu $hat(z)(t)$ là nghiệm tối ưu của #PUSR2, thì nghiệm tối ưu của bài toán #PUSR1 được xác định như sau:

$ hat(x)_i (t) = (hat(z)_(j)(t))/ abs(T_u_j), quad forall v_i in T_u_j, forall j= 0,1,...,k. $ <eq-z-x>

]<thm-z-to-x>

// (cần viết kỹ lại)

Tiếp theo, ta sẽ xem xét điều kiện để tập nghiệm khả thi của #PUSR2 khác rỗng. Đặt
$ J^(<=) (t)={j in {i,...,k}: gamma_j <=t}
$
$ J^> (t)={j in {1,...,k}: gamma_j >t} $



#proposition[Tập khả thi của #PUSR2 là khác rỗng khi và chỉ khi 
$ overline(z)_0 + sum_(j in J^(<=) (t)) min(overline(z)_j, t- gamma_j) >= sum_(i in J^>(t)) (gamma_i- t). $ <eq-bound-for-cond-of-z>
]

// *Chứng minh*
#proof[
Nếu tập khả thi của #PUSR2 không rỗng thì tồn tại một số nghiệm khả thi $z in RR^(k+1)$ thỏa mãn các ràng buộc #PUSR2, nghĩa là
$ z_0 + sum_(j in J^(<=)(t)) z_j = - sum_(j in J^> (t)) z_j. $ <eq-equal-cond-of-z>

// #myref[@eq-equal-cond-of-z]

Từ tính khả thi của $z$, không khó để xác minh rằng vế trái của #myref[@eq-equal-cond-of-z] bị chặn trên bởi vế trái của #myref[@eq-bound-for-cond-of-z] và vế phải của #myref[@eq-equal-cond-of-z] bị chặn dưới bởi vế phải của #myref[@eq-bound-for-cond-of-z]. Do đó, ta thu được #myref[@eq-bound-for-cond-of-z]. Ngược lại, giả sử rằng #myref[@eq-bound-for-cond-of-z] không thỏa mãn. Bằng cách sử dụng các ước lượng tương tự, ta có thể thu được
$ z_0 + sum_(j in J^(<=) (t)) z_j < - sum_(j in J^> (t)) z_j <==> sum_(j=0)^k z_j < 0. $
Điều này vi phạm ràng buộc thứ hai trong #PUSR2 và do đó tập hợp khả thi là rỗng. Hoàn tất chứng minh.]


#example[
  Chúng ta khảo sát bài toán ....
]

#let example-upgrading-stability-radius = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.6

  circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
  content("v1.bottom", $v_1 (0.15)$, anchor: "left", padding: 0.2)

  circle((-2*h, 2), radius: 0.05, fill: black, name: "v2") 
  content("v2.bottom", $v_2 (0.12)$, anchor: "left", padding: 0.2)

  circle((-3*h, 1), radius: 0.05,fill:black, name: "v5") 
  content("v5.bottom", $v_5 (0.09)$, anchor: "left", padding: 0.2)

  circle((-1*h, 1), radius: 0.05,fill:black, name: "v6") 
  content("v6.bottom", $v_6 (0.09)$, anchor: "left", padding: 0.2)

  circle((0*h, 2), radius: 0.05, fill: black, name: "v3") 
  content("v3.bottom", $v_3 (0.125)$, anchor: "left", padding: 0.2)

  circle((0*h, 1), radius: 0.05, fill: black, name: "v7") 
  content("v7.bottom", $v_7 (0.125)$, anchor: "left", padding: 0.2)

  circle((2*h, 2), radius: 0.05, fill: black, name: "v4") 
  content("v4.bottom", $v_4 (0.1)$, anchor: "left", padding: 0.2)

  circle((1*h, 1), radius: 0.05, fill: black, name: "v8") 
  content("v8.bottom", $v_8 (0.15)$, anchor: "left", padding: 0.2)
  circle((3*h, 1), radius: 0.05, fill:black, name: "v9") 
  content("v9.bottom", $v_9 (0.05)$, anchor: "left", padding: 0.2)
  
  line("v1", "v2")
  line("v1", "v3")
  line("v1", "v4")
  line("v2", "v5")
  line("v2", "v6")
  line("v3", "v7")
  line("v4", "v8")
  line("v4", "v9")    }
)
#figure(
  example-upgrading-stability-radius,
  caption: [Đồ thị cây mới sau khi nâng cấp bán kính ổn định],
) <fig-example-upgrading-stability-radius>



