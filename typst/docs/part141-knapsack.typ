//knapsack book

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
#set math.equation(numbering: "(1.1)", supplement: none)

#import "@preview/lovelace:0.3.0": pseudocode-list
// === BÀI TOÁN KNAPSACK
== Inverse 1-median và các bài toán liên quan


// Bài toán xếp ba lô (knapsack) có thể được định nghĩa một cách chính thức như sau: Chúng ta có một chiếc ba lô với $N$ là tập hợp các vật phẩm, bao gồm $n$ vật phẩm $x_j$ với lợi nhuận $P_j$ và trọng lượng $W_j$, cùng với sức chứa $c$. Thông thường, tất cả các giá trị này đều là số nguyên dương. Mục tiêu là chọn một tập con của $N$ sao cho tổng lợi nhuận của các vật phẩm được chọn là lớn nhất và tổng trọng lượng không vượt quá $c$.
=== Bài toán Xếp ba lô
Trong phần này, chúng ta sẽ xem xét _Bài toán xếp ba lô (Knapsack Problem)_ - một bài toán kinh điển trong tối ưu tổ hợp, được sử dụng rộng rãi để giải quyết nhiều bài toán tối ưu phức tạp trong thực tế. Trong bài toán này, ta phải lựa chọn các đối tượng trong một tập hợp sao cho tối đa hóa giá trị tổng thể mà không vượt quá một giới hạn nhất định, thường là về trọng lượng hoặc dung lượng.

Để dễ hình dung, ta xem xét ví dụ sau: Một tên trộm đột nhập vào cửa hàng và thấy có $n$ món hàng, mỗi món có trọng lượng và giá trị khác nhau. Tuy nhiên, hắn chỉ có một chiếc ba lô với sức chứa $c$. Vấn đề đặt ra là tên trộm nên chọn những món nào, và số lượng bao nhiêu, để thu được nhiều tiền nhất mà vẫn đảm bảo tổng trọng lượng của những món đồ không vượt quá khả năng chứa của chiếc ba lô.

Bài toán xếp ba lô có nhiều dạng. Trong đó, hai dạng được biết đến nhiều nhất là _Bài toán xếp ba lô 0-1_ và _Bài toán xếp ba lô liên tục_.

*(a) Bài toán xếp ba lô 0-1*





// ==== Định nghĩa bài toán

_Bài toán xếp ba lô 0-1 (0-1 Knapsack Problem)_ là một trong những dạng quan trọng và phổ biến nhất của bài toán xếp ba lô. Trong bài toán này, mỗi vật phẩm đều chỉ có hai lựa chọn: 

- Một là, vật phẩm được chọn để xếp vào ba lô.
- Hai là, vật phẩm bị bỏ qua (không được chọn). 

Điều này đã tạo nên tên gọi "0-1". Trong đó, 0 nghĩa là không được chọn và 1 là được chọn.


Thách thức chính trong bài toán này là phải cân đối các vật thể để không vượt quá sức chứa của ba lô mà vẫn phải đảm bảo tối ưu hóa được giá trị tổng thể. Bài toán này thuộc lớp các bài toán _NP-khó_, nghĩa là không tồn tại thuật toán nào có thể giải chính xác bài toán trong thời gian đa thức. Do đó, việc phát triển các thuật toán xấp xỉ hoặc giải gần đúng là một hướng tiếp cận thiết thực và hiệu quả.

Tiếp theo, chúng ta sẽ tiến hành mô hình hóa bài toán xếp ba lô 0-1. Bài toán xếp ba lô 0-1 có thể được định nghĩa như sau: Gọi $c$ là sức chứa tối đa của chiếc ba lô. Ta có $n$ vật phẩm $(j = 1,...,n)$, mỗi vật phẩm có một giá trị $p_j >=0$ và trọng lượng $w_j >=0$. Mục tiêu của bài toán là chọn ra một tập hợp các vật phẩm sao cho tổng giá trị của chúng là lớn nhất, nhưng tổng trọng lượng không được vượt quá sức chứa $c$.

Bài toán xếp ba lô có thể được viết dưới dạng bài toán tối ưu như sau:

// $(K P 0-1)$
$
max quad & sum_(j=1)^n p_j x_j\

"s.t." quad & sum_(j=1)^n w_j x_j <= c\

 & x_j in {0,1}, quad quad quad quad j= 1,...,n
$
Trong đó, nếu $x_j = 0$ nghĩa là ta không chọn vật phẩm $j$. Ngược lại, nếu $x_j =1$ ta sẽ chọn vật phẩm đó.

//  Một cá nhân hoặc nhà đầu tư tổ chức giàu có có một số tiền nhất định $c$ mà họ muốn đầu tư vào các dự án kinh doanh có lợi nhuận. Để làm cơ sở cho những quyết định của mình, họ lập một danh sách dài các khoản đầu tư có thể, bao gồm số tiền cần thiết $W_j$ và lợi nhuận ròng dự kiến $p_j$ trong một khoảng thời gian cố định cho mỗi khoản đầu tư. Yếu tố rủi ro không được xem xét rõ ràng ở đây. Rõ ràng, việc kết hợp các quyết định nhị phân cho mỗi khoản đầu tư sao cho tổng lợi nhuận đầu tư là lớn nhất có thể được mô hình hóa bởi bài toán xếp ba lô $(K P)$. 

// Một ví dụ minh họa thứ ba về tình huống thực tế được thể hiện qua bài toán xếp ba lô $(K P)$ là trong kinh doanh vận chuyển hàng hóa của hãng hàng không. Nhân viên điều phối của một hãng hàng không vận chuyển hàng hóa phải quyết định xem yêu cầu vận chuyển nào từ khách hàng nên được thực hiện. Quyết định của anh ta dựa trên danh sách các yêu cầu chứa trọng lượng $W_j$ của mỗi kiện hàng và mức phí trên mỗi đơn vị trọng lượng được tính cho từng yêu cầu. Lưu ý rằng, mức phí này không cố định mà phụ thuộc vào các thỏa thuận dài hạn cụ thể của mỗi khách hàng. Do đó, lợi nhuận $p_j$ mà công ty thu được từ việc chấp nhận một yêu cầu và xếp kiện hàng tương ứng lên máy bay không tỷ lệ trực tiếp với trọng lượng của kiện hàng. Rõ ràng, trong thực tế, mỗi chiếc máy bay có một sức chứa tối đa $c$ cụ thể không được vượt quá bởi tổng trọng lượng của các kiện hàng được chọn. Vấn đề hậu cần này là một tương đồng trực tiếp với việc đóng gói ba lô của người leo núi. 

// Ngoài những bài toán thực tiễn liên quan đến xếp ba lô, cần lưu ý rằng nhiều phương pháp giải quyết các bài toán phức tạp hơn thường sử dụng bài toán xếp ba lô như một bài toán con. Do đó, việc nghiên cứu kỹ lưỡng về bài toán xếp ba lô không chỉ giúp ta nắm vững vấn đề này mà còn mang lại nhiều lợi ích cho việc phát triển và áp dụng các mô hình toán học đa dạng khác.

// ==== Giải thuật tham lam cho bài toán xếp ba lô 0-1

_Thuật toán tham lam_ là thuật toán giải các bài toán tối ưu bằng cách đưa ra lựa chọn tại mỗi bước dựa trên tiêu chí tốt nhất tại thời điểm đó, mà không xem xét các lựa chọn trong tương lai. Mỗi bước lựa chọn là _tham lam_ vì nó cố gắng tối đa hóa hoặc tối thiểu hóa một số yếu tố tức thời, với hy vọng rằng chuỗi các lựa chọn này sẽ dẫn đến kết quả tối ưu toàn cục. Cần chú ý rằng, thuật toán tham lam sẽ cho ta nghiệm gần đúng mà không phải là nghiệm chính xác. Tuy vậy, trong nhiều trường hợp mà tìm nghiệm chính xác là không quá quan trọng, người ta thường dùng thuật toán tham lam do tính đơn giản của chúng. 

Áp dụng vào bài toán xếp ba lô 0-1, một cách tiếp cận phổ biến là đánh giá tỷ lệ lợi nhuận trên trọng lượng của mỗi vật phẩm hay còn gọi là _hiệu suất_ của vật phẩm. Ký hiệu là $e_j$

$ e_j = p_j / w_j. $

Sau đó, ta sẽ cố gắng đặt các vật phẩm có hiệu suất cao nhất vào ba lô. Rõ ràng, những vật phẩm này sẽ tạo ra giá trị cao nhất trong khi tiêu tốn ít không gian nhất. Do đó, trong phần này, chúng ta sẽ giả định rằng các vật phẩm được sắp xếp theo thứ tự giảm dần hiệu suất của chúng. Nghĩa là:
$ p_1 / w_1 >= p_2/w_2  >= ... >= p_n/w_n $ <eq:21>

Ý tưởng của thuật toán tham lam áp dụng trong bài toán này là: Bắt đầu với một chiếc ba lô rỗng, sau đó lần lượt xem xét các vật phẩm theo thứ tự giảm dần của hiệu suất và thêm từng vật phẩm vào ba lô đến khi đạt giới hạn sức chứa của chiếc ba lô đó.

// #set table.hline(stroke: .7pt)

// #table(
//   table.hline(),
//   stroke: none,
//   columns: (auto, 4fr),
//   [*ĐẦU VÀO*],  [Các vật phẩm $x_j, j=1,...,n$, $p_j, w_j$ lần lượt là giá trị và khối lượng vật phẩm $x_j$, ba lô với sức chứa $c$],
//   [*Bước 0*],  [Sắp xếp các vật phẩm theo thứ tự giảm dần của hiệu suất $e_j$, $overline(w):= 0, z_G := 0$],
//   [*Bước 1*],  [Xem xét vật phẩm $x_1$],
//   // [*Bước 2*],  [Nếu $V={v_k}$ thì trả về: $X^*={v_k}.$],
//   [*Bước 3*],  [],
//   [$w_1$ ],  [Trả về: $X^*={x in v_k v_l}$, trong đó $v_l$ liền kề $v_k$.],
//   [$w_k >$ $W$/2],  [Trả về: $X^*={v_k}$],
//   [$w_k <$ $W$/2],  [Sang Bước 4.],
//   [*Bước 4*],  [Đặt $w_l := w_l + w_k$ với $v_l$ liền kề $v_k$ và xét cây mới $T:= T without {v_k}$. Trở về Bước 1.],
//   table.hline(),
//   [*ĐẦU RA*],  [$X^*$ là tập hợp tất cả các điểm 1-median.],
// )

// #import "@preview/showybox:2.0.1": showybox

// #showybox(
//   [*THUẬT TOÁN THAM LAM*

//   *ĐẦU VÀO:* Ta có $n$ vật phẩm $x_j$, trong đó, $p_j, w_j$ lần lượt là giá trị và khối lượng vật phẩm, các vật phẩm này đã được sắp xếp theo giá trị giảm dần của hiệu suất $e_j$ và ba lô có sức chứa $c$.

//   $overline(w) := 0 quad quad quad$ $overline(w)$: _cân nặng của các vật phẩm đã được thêm vào ba lô_

//   $z_G:=0 quad quad quad$ $z_G$: _giá trị các vật phẩm được bỏ vào ba lô_

//   *for* $quad$ $j:= 1$ đến $n$ $quad$ *do*

//   $quad quad $ *if*  $quad$ $overline(w)+w_j <= c$ $quad$ *then*

//    $quad quad quad quad x_j:=1$  $quad quad$ _đặt vật phẩm thứ $j$ vào ba lô_

//    $quad quad quad quad overline(w):= overline(w) + w_j$

//    $quad quad quad quad z_G := z_G + p_j$

//    $quad quad$ *else* $quad$ $x_j := 0$

//  *ĐẦU RA:* $z_G$ và $overline(w)$.
  
//   ]
// )

#figure(
  kind: "algorithm",
  supplement: [Thuật toán],

  pseudocode-list(booktabs: true, line-gap: 1.6em, numbered-title: [Thuật toán tham lam cho bài toán xếp ba lô 0-1], line-numbering: none)[
    - *Input:* $n$ vật phẩm $1,..., n$
      + $p_j, w_j$ lần lượt là giá trị và khối lượng vật phẩm
      + $e_j = p_j/w_j$ thỏa $e_1 >= ...>=e_n$
      + Ba lô có sức chứa $c$
      + 
    - Khởi tạo:
      + $x_j in {0, 1}$, bằng $0$ nếu $j$ không được chọn, bằng $1$ nếu ngược lại
      + $overline(w) := 0$, $overline(w)$ là cân nặng của các vật phẩm đã được thêm vào ba lô
      + $z_G:=0$, $z_G$ là tổng giá trị các vật phẩm được bỏ vào ba lô
    - *for* $j=1,...,n$
      - *if*  $overline(w)+w_j <= c$
        - $x_j:=1$  (cho vật phẩm thứ $j$ vào ba lô)
        - $overline(w):= overline(w) + w_j$
        - $z_G := z_G + p_j$
      - *else*
          - $x_j := 0$ (không cho vật phẩm thứ $j$ vào ba lô)
      - *end if*
    - *end for*
    - *Output:* $x_j$, $j=1,..., n$, $overline(w)$,  $z_G$ 
  ]
) <alg-greedy>




#example[
Ta có một chiếc ba lô với sức chứa $c=9$ và có $n=7$ vật phẩm có thể để vào ba lô với giá trị và trọng lượng được cho ở bảng bên dưới.]

#import "@preview/tablem:0.1.0": tablem

// #tablem[
//   | *j*    | 1 | 2 | 3  | 4 | 5 | 6 | 7 |
//   | ------ |---|---|----|-----------------|
//   | p_j    | 6 | 5 |  8 | 9 | 6 | 7 | 3 |
//   | w_j    | 2 | 3 |  6 | 7 | 5 | 9 | 4 |
// ]

// #import "@preview/tablem:0.1.0": tablem

// #tablem[
//   | *Name* | *Location* | *Height* | *Score* |
//   | ------ | ---------- | -------- | ------- |
//   | John   | Second St. | 180 cm   |  5      |
//   | Wally  | Third Av.  | 160 cm   |  10     |
// ]

#align(center)[#table(
  columns: 8,
  [$j$], [1], [2], [3], [4], [5], [6], [7],
  [$p_j$], [6], [5], [8], [9], [6], [7], [3],
  [$w_j$], [2], [3], [6], [7], [5], [9], [4]
  
)]

Trước tiên, ta thấy rằng, các vật phẩm đã được sắp xếp theo hiệu suất giảm dần. Tiếp theo, thuật toán tham lam sẽ hoạt động như sau:

Xét vật phẩm $x_1$, lúc này $overline(w):= overline(w) + w_1 = 0 + 2 = 2 <= c = 9$, đưa $x_1$ vào ba lô và $z_G := z_G + p_1 = 0 + 6 =6$.

Xét đến vật phẩm $x_2$, $overline(w):= overline(w) + w_2 = 2 + 3 = 5 <= c =9$, đưa $x_2$ vào ba lô và $z_G := z_G + p_2 = 6 +5 = 11 $.

Xét vật phẩm $x_3$, $overline(w) := overline(w)+ w_3 = 5 + 6 = 11 > c = 9$, không đưa $x_3$ vào ba lô.

Xét vật phẩm $x_4$, $overline(w):= overline(w) + w_4 = 5 + 7 = 12 > c =9 $, không đưa $x_4$ vào ba lô.

Xét vật phẩm $x_5$, $overline(w):= overline(w) + w_5 = 5 + 5 = 10 > c =9$, không đưa $x_5$ vào ba lô.

Xét vật phẩm $x_6$, $overline(w):= overline(w) + w_6 = 5 + 9 = 14 > c =9$, không đưa $x_6$ vào ba lô.

Xét vật phẩm $x_7$, $overline(w):= overline(w)+ w_7 = 5 + 4 = 9 = c$, đưa $x_7$ vào ba lô và $z_G := z_G + p_7 = 11 + 3 = 14$.

Vậy, dựa vào thuật toán tham lam, ta sẽ xếp các vật phẩm thứ 1,2 và 7 vào ba lô và giá trị ba lô lúc này là $z_G =14$.

// ==== Độ phức tạp tính toán
Sắp xếp các vật phẩm theo #eqref(<eq:21>) tốn thời gian $O(n log n)$. Tiếp theo, mỗi vật phẩm được xem xét tối đa $n$ lần, nên cần thêm thời gian là $O(n)$.

*(b) Bài toán xếp ba lô liên tục*

_Bài toán xếp ba lô liên tục (continuous knapsack problem)_ là một dạng phổ biến khác của bài toán xếp ba lô cổ điển. Sự khác biệt giữa bài toán này và bài toán xếp ba lô 0-1 đề cập ở trên là: Các vật phẩm cần xét lúc này có thể được chia nhỏ thay vì chỉ có thể chọn toàn bộ hoặc không chọn. Chẳng hạn, ta có một chiếc ba lô với sức chứa $c$ và các vật phẩm ta cần để vào ba lô là đường, muối, bột ngọt và hạt niêm. Rõ ràng, ta có thể thấy rằng, các gia vị trên có thể dễ dàng chia thành các phần nhỏ hơn.

// ==== Định ngĩa bài toán
Bài toán xếp ba lô liên tục có thể được định nghĩa như sau: Ta có một chiếc ba lô với sức chứa tối đa $c$, có $n$ vật phẩm $(j = 1,...,n)$, mỗi vật phẩm có một giá trị $p_j >= 0$ và trọng lượng $w_j >=0$. Tương tự như bài toán xếp ba lô 0-1, mục tiêu của bài toán là chọn ra một tập hợp các vật phẩm sao cho tổng giá trị của chúng là lớn nhất, nhưng tổng trọng lượng không được vượt quá sức chứa $c$.

Bài toán xếp ba lô liên tục được phát biểu như sau:

$
max quad & sum_(j=1)^n p_j x_j\

"s.t." quad & sum_(j=1)^n w_j x_j <= c\

 & x_j in [0,1] quad quad quad quad j= 1,...,n
$

Trong đó $x_j in [0,1]$ nghĩa là phần trăm vật thể thứ $j$ được lấy ra.

// Giải thuật tham lam cho bài toán xếp ba lô liên tục
Tương tự như bài toán xếp ba lô 0-1, một cách tiếp cận phổ biến cho bài toán xếp ba lô liên tục là đánh giá hiệu suất $e_j$ của mỗi vật phẩm 

$ e_j = p_j / w_j. $

Sau đó, ta sẽ cố gắng đặt các đối tượng có hiệu suất cao nhất vào ba lô và cũng giả sử rằng các đối tượng được sắp xếp theo hiệu suất của chúng theo thứ tự giảm dần, sao cho
$ p_1 / w_i >= p_2/w_2  >= ... >= p_n/w_n $

Bằng cách tương tự, ta cũng sẽ bắt đầu với một chiếc ba lô rỗng và lần lượt xem xét qua các vật phẩm theo thứ tự giảm dần của hiệu suất.

#set table.hline(stroke: .7pt)

// #table(
//   table.hline(),
//   stroke: none,
//   columns: (auto, 4fr),
//   table.hline(),
//   [*ĐẦU VÀO*],  [ $n$ vật phẩm, mỗi vật phẩm có giá trị $p_j$ và $w_j$ tương ứng, $j= 1,...,n$, $z := 0, overline(w):= c, x_j := 0, j:= 1$. Các vật phẩm đã được xếp theo thứ tự giảm dần của hiệu suất.],
//   table.hline(),
//   [],[],
//   [*Bước 1*],  [],
//   [],[],
//   [Nếu $w_j <= overline(w)$],   [$ x_j:= 1, quad z:= z + p_j.x_j, quad overline(w):= overline(w) - w_i$],
//   [], [],
//   [Nếu $w_j > overline(w)$],  [$ x_j:= overline(w)/w_j, quad z:= z + p_j.x_j, quad overline(w):= overline(w) - w_i, quad overline(w):= 0$],
//   [],[],
//   [*Bước 2*],  [$j:= j+ 1$, trở về Bước 1],
//   [],[],
//   table.hline(),
//   [*ĐẦU RA*],  [$z$ và $x_j$],
//   table.hline(),
// )

#figure(
  kind: "algorithm",
  supplement: [Thuật toán],

  pseudocode-list(booktabs: true, line-gap: 1.6em, numbered-title: [Thuật toán tham lam cho bài toán xếp ba lô liên tục], line-numbering: none)[
    - *Input:* $n$ vật phẩm $1,..., n$
      + $p_j, w_j$ lần lượt là giá trị và khối lượng vật phẩm $j$
      + $e_j = p_j/w_j$ thỏa $e_1 >= ...>=e_n$
      + Ba lô có sức chứa $c$
    - Khởi tạo:
      + $x_j in [0, 1]$, $j=1,..., n$
      + $overline(w):=c$ (sức chứa còn lại của ba lô)
    - *for* $j=1,...,n$
      - Nếu $w_j <= overline(w)$, thì $x_j:=1$, $overline(w):= overline(w) - w_j$
      - Nếu $w_j > overline(w)$, thì $x_j:=overline(w)/w_j$, $overline(w):= 0$. Kết thúc.
    - *end for*
    - *Output:* $x_j$, $j=1,..., n$
  ]
) <alg-greedy-knapsack-continuous>



#example[
Giả sử, ta là một nhà buôn muốn vận chuyển hàng hóa bằng một chiếc xe với sức chứa tối đa $c=50$ kg và ta có một số loại hàng hóa như sau (mỗi loại hàng hóa bên dưới đều có thể chia nhỏ được):]

#align(center)[#table(
  columns: 5,
  [$j$], [1], [2], [3], [4],
  [$p_j$], [120], [200], [300], [240],
  [$w_j$], [10], [20], [30], [40]
  
)]

Nhận thấy rằng, 4 loại hàng hóa trên đã được sắp xếp theo hiệu suất giảm dần, tức là
$ p_1/ w_1 >= p_2/w_2 >= p_3/ w_3 >= p_4/ w_4 $

Tiếp theo, ta sẽ bắt đầu xếp hàng hóa vào xe bằng thuật toán tham lam như sau:

$overline(w):= c = 50, z:= 0, x_j := 0, j = 1,...,4$

Xem xét $w_1$:

$w_1 = 10 <= overline(w)= 50$ nên $x_1 := 1, z:= z+ p_1.x_1 = 0 + 120.1 = 120, overline(w):= overline(w)- w_1 = 50 - 10 = 40.$

Xem xét $w_2$:

$w_2 = 20<= overline(w) = 40$ nên $x_2 := 1, z:= z+ p_2.x_2 = 120 + 200.1 = 320, overline(w):= overline(w)- w_2 = 40 - 20 = 20.$

Xem xét $w_3$:
$w_3 = 30 > overline(w) = 20$ nên $x_3: overline(w)/ w_3 = 20/30 = 2/3, z:= z + p_3.x_3 = 320 + 300. 2/3= 520, overline(w):= 0.$

Vậy giá trị tối đa mà xe có thể chở là $520$ với hàng hóa thứ 1 và thứ 2 được lấy toàn bộ, hàng hóa thứ 3 được lấy một lượng $2/3$ đang có.

Để giải bài toán này, ta có thể sử dụng thuật toán tham lam với bước sắp xếp các vật phẩm theo hiệu suất có thời gian là $O(n log n)$. Sau khi sắp xếp, mỗi vật phẩm sẽ được xem xét qua tối đa $n$ lần, do đó độ phức tạp tính toán tổng thể là $O(n log n)$.

Ngoài ra, trong bài toán ba lô liên tục, @balas1980algorithm đã chứng minh rằng bài toán này có thể được giải trong thời gian đa thức, mở ra hướng tiếp cận tối ưu và hiệu quả hơn cho việc xử lý các bài toán tối ưu liên quan đến bài toán xếp ba lô trong các tình huống thực tế.












