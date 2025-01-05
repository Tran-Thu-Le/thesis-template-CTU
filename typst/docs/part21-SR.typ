#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: none)
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, myref, figref, defeq, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example, hypothesis 


= BÁN KÍNH ỔN ĐỊNH CỦA ĐIỂM 1-MEDIAN
// == Tổng quan bán kính ổn định 

// #delete-Le[_Bán kính ổn định_ của một đối tượng trong lý thuyết đồ thị là một khái niệm phản ánh mức độ mà một đồ thị (hoặc một thành phần của nó) có thể duy trì các thuộc tính quan trọng khi bị tác động bởi những thay đổi nhỏ, chẳng hạn như việc loại bỏ các đỉnh hoặc cạnh. Nó đo lường khả năng "chịu đựng" của đồ thị trước các yếu tố gây rối loạn hoặc phá hủy, đồng thời xác định phạm vi ảnh hưởng của sự thay đổi đối với cấu trúc của đồ thị.

// Trong các ngữ cảnh khác nhau, khái niệm này có thể có các ý nghĩa cụ thể, chẳng hạn:

// Trong bài toán định vị trung tâm (facility location): Khi nghiên cứu bài toán 1-median hoặc các bài toán liên quan trong lý thuyết đồ thị, bán kính ổn định có thể được hiểu là mức độ thay đổi của vị trí trung tâm (ví dụ, vị trí của một "median" hoặc "center") khi có sự điều chỉnh về trọng số của các đỉnh hoặc cạnh trong đồ thị. Một bán kính ổn định lớn cho thấy trung tâm của đồ thị ít bị ảnh hưởng khi có sự điều chỉnh hoặc thay đổi nhỏ trong hệ thống.

// Trong mạng phân tán hoặc hệ thống máy tính: Bán kính ổn định của một mạng lưới có thể đề cập đến khả năng chịu lỗi, tức là số lượng nút hoặc liên kết bị mất trước khi hệ thống không còn duy trì được các chức năng quan trọng (ví dụ, việc đảm bảo tất cả các thành phần có thể giao tiếp với nhau).

// Trong phạm vi luận văn này, chúng ta sẽ nghiên cứu về bán kính ổn định của điểm 1-median trên đồ thị cây.] 

_Bán kính ổn định_ là một khái niệm đo lường khả năng của hệ thống trong việc duy trì trạng thái "ổn định" khi chịu ảnh hưởng từ các yếu tố nhiễu động môi trường. Tùy thuộc vào ngữ cảnh, khái niệm này có thể mang các ý nghĩa khác nhau. Trong phạm vi của luận văn này, chúng ta tập trung nghiên cứu bán kính ổn định của điểm 1-median trên đồ thị cây.

Trong lĩnh vực logistics, các kho hàng thường được đặt tại các vị trí trung tâm, đặc trưng bởi hàm median (trung vị) trên một mạng lưới giao thông. Trong đó, mỗi nút giao thông được gán trọng số dựa trên nhu cầu tương ứng. Tuy nhiên, các trọng số này thường xuyên thay đổi theo mùa, làm ảnh hưởng đến tính tối ưu của vị trí kho hàng. Bán kính ổn định cung cấp một cách đo lường mức độ ổn định của vị trí kho hàng trước sự biến động nhu cầu.

Trong chương này, chúng ta sẽ nghiên cứu chi tiết về bán kính ổn định của điểm 1-median trên đồ thị cây. Chúng tôi nhận thấy rằng, mặc dù việc tính toán chính xác giá trị bán kính ổn định có thể phức tạp, vẫn có thể xác định một cận dưới đơn giản và chặt chẽ. Ngoài ra, chúng tôi còn xem xét bài toán nâng cấp cận dưới của bán kính ổn định bằng cách tham số hóa bài toán và đề xuất một thuật toán tổ hợp hiệu quả để giải quyết bài toán này.


== Một số ký hiệu liên quan 

Trước khi đi vào nội dung chính, chúng ta sẽ giới thiệu một số ký hiệu quan trọng được sử dụng xuyên suốt trong chương này. Các ký hiệu này sẽ giúp việc trình bày và phân tích trở nên rõ ràng và nhất quán hơn.

// #remark-Le[Thêm ký hiệu đồ thị cây, cây con gốc tại u là gì?]

1. Ta định nghĩa _tích Hadamard_ giữa hai vector $u= vec(u_1,u_2,u_3), v= vec(v_1, v_2, v_3)$ bằng cách nhân từng thành phần tương ứng của hai vectơ, ký hiệu như sau: 

$ u dot.circle v = vec(u_1,u_2,u_3) dot.circle vec(v_1, v_2, v_3) = vec(u_1 times v_1, u_2 times v_2, u_3 times v_3) $

// Ký hiệu $dot.circle$ được gọi là _tích Hadamard_ và phép toán này

//  #remark-Le[Phép nhân Hadamard k phải cộng. Em cho ví dụ lộn rồi.]

*Ví dụ* Cho $u = vec(1,2,3), v= vec(4,5,6)$. Khi đó
$ u dot.circle v = vec(1,2,3) dot.circle vec(4,5,6) = vec(1 times 4,2 times 5,3 times 6)= vec(4,10,18) $

2. Gọi $ bb(1)_T_u = vec(v_1,v_2, dots.v,v_n) $
Trong đó 
$ v_i = cases(1 "nếu" v_i in T_u, 0 "nếu" v_i in.not T_u ) $
Nghĩa là, vecto $bb(1)_T_u$ có $n$ thành phần, với thành phần thứ $i$ bằng 1 nếu đỉnh $v_i$ thuộc cây $T_u$ và bằng 0 nếu không thuộc.

3. Tổng trọng số của cây con lấy gốc tại $u$ ứng với bộ trọng số $w$ được xác định bởi tích vô hướng $ angle.l w, bb(1)_T_u angle.r $ là 

4. Giả sử một vecto $x = (x_1,x_2,...,x_n)$, chuẩn vô cùng của vecto $x$ được định nghĩa là:

$ norm(.)_infinity = max_(1<= i <= n) abs(x_i) $

*Ví dụ* Giả sử $x=(1,-3,2)$, khi đó:
$ norm(x)_infinity = max (abs(1), abs(-3),abs(2)) = 3 $

5. Giả sử một vecto $x = (x_1,x_2,...,x_n)$, chuẩn một của vecto $x$ được định nghĩa là:

$ norm(.)_1 = sum_(i=1)^n abs(x_i) $

Nói cách khác, chuẩn 1 tính tổng các giá trị tuyệt đối của các phần tử trong vecto.

*Ví dụ* Giả sử $x=(1,-3,2)$, khi đó:
$ norm(x)_1 =  abs(1) + abs(-3) + abs(2) = 1 + 3 + 2= 6. $

// #remark-Le[Giải thích thêm ký hiệu $[w - epsilon, w+ epsilon]$]

== Bán kính ổn định
=== Định nghĩa 
