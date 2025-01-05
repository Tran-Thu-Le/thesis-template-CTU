
#include "../tools/multi-section-ref.typ"
#import "../tools/macros.typ": eqref, myref, figref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof,
#import "@preview/cetz:0.1.2": canvas, plot
#import "@preview/cetz:0.1.2"
#import "@preview/equate:0.2.1": equate
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: "Eq.")


= KIẾN THỨC LIÊN QUAN
// = KIẾN THỨC CHUẨN BỊ
// = Kiến thức chuẩn bị

// == LÝ THUYẾT ĐỒ THỊ
== Lý thuyết đồ thị

// === Đồ thị

// @alizadehBudgetconstrainedInverseMedian2020a

// == #text(orange)[1. LÝ THUYẾT ĐỒ THỊ]
// === #text(orange)[1.1 ĐỒ THỊ]

// #remark-Le[to-do list:
// - add table list (LE, NO)
// - spacing 1.5 (DONE)
// - Issue with figure numbering (LE)
// - Chinh size chu = 13pt (DONE)
// - can le 3cm (DONE)
// - coloring ref of figures (DONE)
// - Chỉnh ref cua USR (DONE)

// - Issue with equation numbering (LE)
// - How to ref a theorem (LE, DONE)
// - template for theorem (LE)
// - add references (NGAN)

// - Indent first paragraph 
// - 


// - some solution (một nghiệm nào đó --chứ k phải một vài nghiệm)
// - solution (nghiệm chứ k phải lời giải)
// - solution 
// - Vấn đề --> Bài toán
// - Với tất cả --> với mọi
// ]

=== Khái niệm và các dạng đồ thị 

Trong thực tế, việc biểu diễn các đối tượng và mối quan hệ giữa chúng đóng vai trò quan trọng trong nhiều lĩnh vực khác nhau. Chẳng hạn, trong mạng xã hội, để nghiên cứu mối quan hệ giữa các cá nhân, chúng ta cần một công cụ có thể mô hình hóa các kết nối này một cách trực quan và hiệu quả. Tương tự, trong mạng lưới giao thông, việc mô phỏng mối liên hệ giữa các điểm đến và các tuyến đường giúp tối ưu hóa hành trình di chuyển, từ đó tiết kiệm thời gian và chi phí. Khi đó, _đồ thị_ trở thành một công cụ hữu ích để giải quyết nhu cầu này. Vậy, đồ thị là gì?

Trong toán học, đồ thị $G$ được định nghĩa như sau:  

Một đồ thị (graph) $G$ là một bộ ba $(V(G),E(G),psi_G)$ bao gồm một tập khác rỗng $V(G)$ các đỉnh (vertices) của $G$, một tập $E(G)$ các cạnh (edges) của $G$, và một hàm liên thuộc (incidence function) $psi_G$ đặt tương ứng mỗi cạnh với một cặp đỉnh. Nếu $e$ là một cạnh và $u,v$ là hai đỉnh sao cho $psi_(G) (e) = u v$ thì ta nói $e$ nối $u$ và $v$; các đỉnh $u$ và $v$ được gọi là các điểm đầu mút của $e$.

Để dễ dàng hình dung, ta xét ví dụ sau:
Cho đồ thị $G=(V(G),E(G),psi_G)$ với $V(G)={v_1,v_2,v_3,v_4,v_5}, E(G)={e_1,e_2,e_3,e_4,e_5,e_6}$ và $psi_G$ được xác định bởi $psi_G (e_1)=v_1v_2, psi_G (e_2)=v_2v_3, psi_G (e_3)= v_2v_4, psi_G (e_4)=v_1v_5, psi_G (e_5)=v_3v_5, psi_G (e_6)=v_1v_4$. Hình bên dưới là một biểu diễn hình học của đồ thị $G$.

  
#let do-thi-vo-huong = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.4

  circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
  content("v1.bottom", $v_1$, anchor: "left", padding: 0.2)

  circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
  content("v2.right", $v_2$, anchor: "right", padding: 0.2)

  circle((2, 1), radius: 0.05,fill:black, name: "v3") 
  content("v3.right", $v_3$, anchor: "bottom", padding: 0.2)

  circle((-1, 0), radius: 0.05,fill:black, name: "v4") 
  content("v4.bottom", $v_4$, anchor: "left", padding: 0.2)

  circle((-3, 1), radius: 0.05, fill: black, name: "v5") 
  content("v5.bottom", $v_5$, anchor: "right", padding: 0.2)

  //circle((0*h, 1), radius: 0.05, fill: black, name: "v7") 
  //content("v7.bottom", $v_7 (0.06)$, anchor: "left", padding: 0.2)

  //circle((2*h, 2), radius: 0.05, fill: black, name: "v4") 
  //content("v4.bottom", $v_4 (0.15)$, anchor: "left", padding: 0.2)

  //circle((1*h, 1), radius: 0.05, fill: black, name: "v8") 
  //content("v8.bottom", $v_8 (0.2)$, anchor: "left", padding: 0.2)
  //circle((3*h, 1), radius: 0.05, fill:black, name: "v9") 
  //content("v9.bottom", $v_9 (0.1)$, anchor: "left", padding: 0.2)
  
  line("v1", "v2", name: "v1v2")
  line("v2", "v3", name: "v2v3")
  line("v2", "v4", name: "v2v4")
  line("v5", "v1", name: "v5v1")
  line("v3", "v5", name: "v3v5")
  line("v4", "v1", name: "v4v1")
  content("v1v2", $e_1$, anchor: "bottom", padding: 0.2)
  content("v2v3", $e_2$, anchor: "bottom", padding: 0.2)
  content("v2v4", $e_3$, anchor: "top", padding: 0.2)
  content("v5v1", $e_4$, anchor: "bottom", padding: 0.2)
  content("v3v5", $e_5$, anchor: "top", padding: 0.2)
  content("v4v1", $e_6$, anchor: "left", padding: 0.2) 
})
#figure(
  do-thi-vo-huong,
  caption: [Hình biểu diễn của đồ thị],
) <fig-do-thi-vo-huong>
// #align(center)[#text(orange)[*Hình 1.1*] Minh họa biểu diễn hình học của một đồ thị]

Lấy ví dụ trong thực tế:

- Trong mạng xã hội, đồ thị có thể được sử dụng để mô tả mối quan hệ bạn bè giữa các cá nhân. Mỗi đỉnh của đồ thị đại diện cho một cá nhân, và nếu hai người là bạn bè, mối quan hệ đó được biểu diễn bằng một cạnh nối hai đỉnh tương ứng.

- Trong lĩnh vực giao thông, các thành phố có thể được biểu diễn bởi các đỉnh, trong khi các cạnh là các tuyến đường nối giữa chúng.


// //#align(center)[

// #import "@preview/bob-draw:0.1.0": *
// #show raw.where(lang: "bob"): it => render(it)

// #render(
//     ```
//       1       2         3
//        *------*--------*    
//     4 /    5 /        /   
//      *------*        * 6
//       \             /              
//        \           /             
//         *---------* 8
//         7
    
//     ```,
//     width: 40%,
// )]
//#align(center)[#text(orange)[*Hình 1.1*] Minh họa biểu diễn hình học của một đồ thị]

Tiếp theo, ta sẽ xét các dạng đồ thị thường gặp.

1. _Đồ thị vô hướng (undirected graph)_ là một loại đồ thị trong đó các cạnh không có hướng ($psi_G (e) = u v  =v u$). Điều này có nghĩa là nếu có một cạnh nối hai đỉnh $u$ và $v$ thì cạnh này có thể được đi từ $u$ đến $v$ và ngược lại có thể đi từ $v$ đến $u$ . Nói cách khác, mối quan hệ giữa các đỉnh là hai chiều và không có sự phân biệt về hướng. #figref[@fig-do-thi-vo-huong] minh họa một đồ thị vô hướng.

2. _Đồ thị có hướng (directed graph)_ là một loại đồ thị trong đó mỗi cạnh có hướng ($psi_G (e_1) = u v != psi_G (e_2) =v u$). Điều này có nghĩa là mỗi cạnh được biểu diễn bởi một cặp đỉnh có thứ tự, chỉ định hướng đi từ đỉnh đầu đến đỉnh cuối. Trong đồ thị có hướng, nếu có cạnh từ đỉnh $u$ đến đỉnh $v$ thì không nhất thiết phải có cạnh từ đỉnh $v$ đến đỉnh $u$. #figref[@fig-do-thi-co-huong] minh họa một đồ thị có hướng bằng các mũi tên.



  
#let do-thi-co-huong = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.4

  circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
  content("v1.bottom", $v_1$, anchor: "left", padding: 0.2)

  circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
  content("v2.right", $v_2$, anchor: "right", padding: 0.2)

  circle((2, 1), radius: 0.05,fill:black, name: "v3") 
  content("v3.right", $v_3$, anchor: "bottom", padding: 0.2)

  circle((-1, 0), radius: 0.05,fill:black, name: "v4") 
  content("v4.bottom", $v_4$, anchor: "left", padding: 0.2)

  circle((-3, 1), radius: 0.05, fill: black, name: "v5") 
  line("v1", "v2", name: "v1v2", mark:(end: ">", fill: orange))
  line("v2", "v3", name: "v2v3", mark:(end: ">", fill: orange))
  line("v2", "v4", name: "v2v4", mark:(end: ">", fill: orange))
  line("v5", "v1", name: "v5v1", mark:(end: ">", fill: orange))
  line("v3", "v5", name: "v3v5", mark: (end: ">", fill: orange))
  line("v4", "v1", name: "v4v1", mark:(end: ">", fill: orange))
  // line("v4", "v8")
  // line("v4", "v9")  

  content("v1v2", $e_1$, anchor: "bottom", padding: 0.2)
  content("v2v3", $e_2$, anchor: "bottom", padding: 0.2)
  content("v2v4", $e_3$, anchor: "top", padding: 0.2)
  content("v5v1", $e_4$, anchor: "bottom", padding: 0.2)
  content("v3v5", $e_5$, anchor: "top", padding: 0.2)
  content("v4v1", $e_6$, anchor: "left", padding: 0.2) 
})
#figure(
  do-thi-co-huong,
  caption: [Đồ thị có hướng],
) <fig-do-thi-co-huong>
// #align(center)[#text(orange)[*Hình 1.2*]  Đồ thị có hướng]

3. _Đồ thị có trọng số (weighted graph)_ là loại đồ thị trong đó các đỉnh và các cạnh được gán các giá trị trọng số. Trọng số của đỉnh thường biểu thị các yếu tố như dân số, tài nguyên hoặc mức độ quan trọng của điểm đó, trong khi trọng số của cạnh thường đại diện cho khoảng cách, chi phí hoặc thời gian di chuyển giữa các điểm. Ví dụ, trong một đồ thị biểu diễn các điểm dân cư, mỗi đỉnh có thể được gán một trọng số biểu thị số lượng dân cư tại khu vực đó, còn mỗi cạnh có trọng số thể hiện khoảng cách giữa hai điểm dân cư.

#let do-thi-co-trong-so = canvas(length: 10%, {
  import cetz.draw: *

  let y = 2 
  let x = 4
  let y-space = 1
  let h=1.4

  circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
  content("v1.bottom", $v_1 (5)$, anchor: "left", padding: 0.2)

  circle((-3, 1.5), radius: 0.05, fill: black, name: "v2") 
  content("v2.right", $v_2 (2)$, anchor: "right", padding: 0.2)

  circle((3, 1.5), radius: 0.05, fill: black, name: "v3") 
  content("v3.right", $v_3 (3)$, anchor: "right", padding: 0.2)
    circle((2, 5), radius: 0.05, fill: black, name: "v4") 
  content("v4.right", $v_4 (1)$, anchor: "right", padding: 0.2)

    circle((-2, 5), radius: 0.05, fill: black, name: "v5") 
  content("v5.right", $v_5 (7)$, anchor: "right", padding: 0.2)

    circle((0, 5), radius: 0.05, fill: black, name: "v6") 
  content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

  line("v1", "v2", name: "v1v2")
  content("v1v2.top", $3$, anchor: "top", padding: 0.5)

  line("v1", "v3", name: "v1v3")
  content("v1v3.top", $3$, anchor: "top", padding: 0.5)

  line("v1", "v5", name: "v1v5")
  content("v1v5.top", $2$, anchor: "top", padding: 0.7)

  line("v1", "v4", name: "v1v4")
  content("v1v4.top", $2$, anchor: "top", padding: 0.5)

  line("v1", "v6", name: "v1v6")
  content("v1v6.right", $1$, anchor: "right", padding: 0.1)
  
})
// #align(center)[#text(orange)[*Hình 1.3*]  Đồ thị có trọng số]
#figure(
  do-thi-co-trong-so,
  caption: [Đồ thị có trọng số đỉnh và độ dài cạnh],
) <fig-do-thi-co-trong-so-xxx>

4. _Đồ thị không có trọng số (unweighted graph)_ là đồ thị mà các cạnh và các đỉnh không có trọng số. Đồ thị trong #figref[@fig-do-thi-vo-huong] và #figref[@fig-do-thi-co-huong] là những đồ thị không có trọng số.

5. _Đồ thị liên thông (connected graph)_ là đồ thị mà từ một đỉnh bất kỳ, ta có thể đi đến tất cả các đỉnh khác thông qua các cạnh.

#let do-thi-lien-thong = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.top", $v_1$, anchor: "top", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 3), radius: 0.05, fill: black, name: "v3") 
    content("v3.left", $v_3$, anchor: "left", padding: 0.2)
    circle((-3, 0), radius: 0.05, fill: black, name: "v4") 
    content("v4.right", $v_4$, anchor: "right", padding: 0.2)

    circle((3, 0), radius: 0.05, fill: black, name: "v5") 
    content("v5.left", $v_5$, anchor: "left", padding: 0.2)

    //  circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    // content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    //content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    // content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    line("v2", "v4", name: "v1v4")
    // content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    line("v1", "v4", name: "v1v4")
    // content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    line("v1", "v5", name: "v1v5")
    // content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    line("v3", "v5", name: "v3v5")
    line("v4", "v5", name: "v4v5")
    }
  )
// #align(center)[#text(orange)[*Hình 1.4*]  Đồ thị liên thông]
#figure(
  do-thi-lien-thong,
  caption: [Đồ thị liên thông],
) <fig-do-thi-lien-thong>


5. _Đồ thị không liên thông (disconnected graph)_ là đồ thị sao cho tồn tại ít nhất một đỉnh, mà từ đỉnh đó ta không thể đi đến một số đỉnh khác. #figref[@fig-do-thi-khong-lien-thong] là một ví dụ của đồ thị không liên thông vì tồn tại đỉnh $v_4$ mà từ đỉnh này ta không thể đi đến các đỉnh còn lại của đồ thị.

#let do-thi-khong-lien-thong = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.top", $v_1$, anchor: "top", padding: 0.2)

    // circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    // content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 3), radius: 0.05, fill: black, name: "v3") 
    content("v3.left", $v_3$, anchor: "left", padding: 0.2)
    circle((-3, 0), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 0), radius: 0.05, fill: black, name: "v4") 
    content("v4.left", $v_4$, anchor: "left", padding: 0.2)

    //  circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    // content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

    //line("v1", "v2", name: "v1v2")
    //content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    //line("v1", "v3", name: "v1v3")
    // content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    // line("v2", "v4", name: "v1v4")
    // content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    line("v1", "v2", name: "v1v2")
    // content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    // content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    //line("v3", "v5", name: "v3v5")
    line("v2", "v3", name: "v2v3")
})
// #align(center)[#text(orange)[*Hình 1.4*]  Đồ thị không liên thông]
#figure(
  do-thi-khong-lien-thong,
  caption: [Đồ thị không liên thông],
) <fig-do-thi-khong-lien-thong>

// ==== #text(orange)[1.1.2 Một số khái niệm liên quan]
// === Một số khái niệm liên quan

Một số khái niệm khác liên quan đến đồ thị được trình bày bên dưới.



- Nếu $u$ là một điểm đầu mút của cạnh $e$ thì ta nói $u$ và $e$ _liên thuộc (incident)_ với nhau.
#let do-thi-lien-thuoc = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.left", $u$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    content("v1v2.top", $e$, anchor: "top", padding: 0.1)
    
})
// #align(center)[#text(orange)[*Hình 1.5*] Đỉnh $u$ và cạnh $e$ liên thuộc nhau]
#figure(
  do-thi-lien-thuoc,
  caption: [Đỉnh và cạnh liên thuộc nhau],
) <fig-do-thi-lien-thuoc>


- Hai đỉnh liên thuộc với cùng một cạnh được gọi là hai đỉnh _liền kề (adjacent)_. Trong #figref[@fig-do-thi-lien-thuoc], $u$ và $v$ cùng liên thuộc cạnh $e$ nên $u$ và $v$ là hai đỉnh liền kề. 

- Hai cạnh liên thuộc với cùng một đỉnh được gọi là hai cạnh _liền kề_. Trong #figref[@fig-do-thi-lien-ke], rõ ràng ta có thể thấy $e_1$ và $e_2$ cùng liên thuộc đỉnh $u$ nên $e_1, e_2$ là hai cạnh liền kề. 

#let do-thi-lien-ke = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.left", $u$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "v3") 
    content("v3.right", $z$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    content("v1v2.top", $e_1$, anchor: "top", padding: 0.1)
    line("v1", "v3", name: "v1v3")
    content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)
    
})
// #align(center)[#text(orange)[*Hình 1.6*] $e_1$ và $e_2$ liền kề nhau]
#figure(
  do-thi-lien-ke,
  caption: [Hai cạnh liền kề nhau],
) <fig-do-thi-lien-ke>


- Một cạnh có hai điểm đầu mút trùng nhau được gọi là một _vòng (loop)_.

- Hai hay nhiều cạnh mà có hai đầu mút giống nhau được gọi là _các cạnh song song (parallel edges)_ hay còn được gọi là _các cạnh bội (multiple edges)_.

// (e) Hai hay nhiều cạnh mà có hai đầu mút giống nhau được gọi là _các cạnh song song(parallel edges)_ hay còn được gọi là _các cạnh bội(multiple edges)_.

#let do-thi-canh-boi = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "u")
    content("u.left", $u$, anchor: "left", padding: 0.2)

    circle((-3, 3), radius: 0.05, fill: black, name: "v") 
    content("v.right", $v$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "z") 
    content("z.right", $z$, anchor: "right", padding: 0.2)

    line("u", "v", name: "v1v2")
    content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.1)

    bezier("u","v", (-1.5,2), name: "be1")
    content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    line("u", "z", name: "v1v3")
    content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)

    line("v", "z", name: "v2v3")
    content("v2v3.left", $e_3$, anchor: "left", padding: 1)

    bezier("z","v", (-4,-3), name: "be2")
    content("be2.right", $e_5$, anchor: "right", padding: 2.7)   
})
// #align(center)[#text(orange)[*Hình 1.8*] Minh họa các cạnh bội]
#figure(
  do-thi-canh-boi,
  caption: [Đồ thị với các cạnh bội],
) <fig-do-thi-canh-boi>


- _Đồ thị hữu hạn (finite graph)_ là đồ thị có cả tập hợp cạnh và tập hợp đỉnh đều hữu hạn. Các hình được đề cập bên trên đều là đồ thị hữu hạn.

- _Đơn đồ thị (simple graph)_ là một đồ thị không có vòng và không có cạnh song song. #figref[@fig-do-thi-co-trong-so-xxx] là một ví dụ của đơn đồ thị.

- _Đồ thị tầm thường (trivial graph)_ là đồ thị chỉ có một đỉnh và không có cạnh.

- _Đồ thị rỗng (empty graph)_ là đồ thị không có đỉnh và không có cạnh.



// ==== #text(orange)[1.1.3 Bậc và đường đi]

=== Đồ thị con 

_Đồ thị con (subgraph)_ là đồ thị được xây dựng từ một phần của đồ thị lớn hơn. Cụ thể, $H$ là một đồ thị con của $G$ nếu $ V(H) subset.eq V(G), E(H) subset.eq E(G)$ và $psi_H$ là giới hạn của $psi_G$ trên $E(H)$.
Ký hiệu: $H subset.eq G$.

Có nhiều loại đồ thị con như: 

- _Đồ thị con thực sự (proper subgraph)_: $H subset.eq G$ nhưng $H eq.not G$. Khi đó, ta ký hiệu $H subset G$.

- _Đồ thị con bao trùm (spanning subgraph)_: $V(H)= V(G)$.

- _Đồ thị con cảm sinh (induced subgraph)_ là một loại đồ thị con đặc biệt được xây dựng từ một tập hợp con của các đỉnh trong đồ thị gốc, cùng với tất cả các cạnh mà các đỉnh này nối với nhau trong đồ thị gốc. Đồ thị con của $G$ cảm sinh bởi $V'$ được ký hiệu $G[V']$. Để hiểu rõ hơn về định nghĩa đồ thị con cảm sinh, ta xét ví dụ sau: Cho đồ thị $G$ như hình bên dưới, $V'= {v_1, v_2, v_3}$, khi đó đồ thị con của $G$ cảm sinh bởi $V'$ được xác định như sau:

#align(left)[#canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.bottom", $v_1$, anchor: "top", padding: 0.2)
    content("v1.bottom", $(G)$, anchor: "top", padding: 2)



    circle((-3, 1.5), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 1.5), radius: 0.05, fill: black, name: "v3") 
    content("v3.right", $v_3$, anchor: "right", padding: 0.2)
     circle((2, 5), radius: 0.05, fill: black, name: "v4") 
    content("v4.right", $v_4$, anchor: "right", padding: 0.3)

     circle((-2, 5), radius: 0.05, fill: black, name: "v5") 
    content("v5.right", $v_5 $, anchor: "right", padding: 0.2)

     circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    content("v6.right", $v_6 $, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    // content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    // content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v5", name: "v1v5")
    // content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    line("v1", "v4", name: "v1v4")
    // content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    line("v1", "v6", name: "v1v6")
    // content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    
    }
  )]

#let do-thi-cam-sinh = canvas(length: 7%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1") 
    content("v1.bottom", $v_1$, anchor: "top", padding: 0.2)
    content("v1.bottom", $(G[V'])$, anchor: "top", padding: 2)

    circle((-3, 1.5), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((3, 1.5), radius: 0.05, fill: black, name: "v3") 
    content("v3.right", $v_3$, anchor: "right", padding: 0.2)
    //  circle((2, 5), radius: 0.05, fill: black, name: "v4") 
    // content("v4.right", $v_4 (1)$, anchor: "right", padding: 0.2)

    //  circle((-2, 5), radius: 0.05, fill: black, name: "v5") 
    // content("v5.right", $v_5 (7)$, anchor: "right", padding: 0.2)

    //  circle((0, 5), radius: 0.05, fill: black, name: "v6") 
    // content("v6.right", $v_6 (2)$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    // content("v1v2.top", $3$, anchor: "top", padding: 0.5)

    line("v1", "v3", name: "v1v3")
    // content("v1v3.top", $3$, anchor: "top", padding: 0.5)

    // line("v1", "v5", name: "v1v5")
    // content("v1v5.top", $2$, anchor: "top", padding: 0.7)

    // line("v1", "v4", name: "v1v4")
    // content("v1v4.top", $2$, anchor: "top", padding: 0.5)

    // line("v1", "v6", name: "v1v6")
    // content("v1v6.right", $1$, anchor: "right", padding: 0.1)
    
})

// #align(center)[#text(orange)[*Hình 1.10*] Minh họa đồ thị cảm sinh]
// #align(center)[#text(orange)[*Hình 1.10*] Đồ thị $G[V']$ cảm sinh từ đồ thị $G$]
#figure(
  do-thi-cam-sinh,
  caption: [Đồ thị cảm sinh],
) <fig-do-thi-cam-sinh>


=== Bậc của đỉnh

_Bậc (degree)_ của đỉnh $v$ trong $G$ là số cạnh của $G$ liên thuộc với $v$. Ký hiệu: $d(v)$. Lưu ý rằng, mỗi vòng được tính là hai cạnh. 

Bậc của một đỉnh trong đồ thị mang nhiều ý nghĩa quan trọng trong thực tế. Ví dụ, trong mạng xã hội, bậc của một đỉnh biểu thị số lượng bạn bè mà một cá nhân có. Các đỉnh có bậc cao thường đại diện cho những cá nhân có tầm ảnh hưởng lớn, bởi họ duy trì nhiều kết nối và tương tác với các thành viên khác. Điều này giúp đánh giá mức độ quan trọng hoặc vai trò trung tâm của một cá nhân trong cộng đồng.

#let do-thi-tong-bac = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,3), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1$, anchor: "bottom", padding: 0.3)

    circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "v3") 
    content("v3.bottom", $v_3$, anchor: "top", padding: 0.1)

    circle((-3, 0), radius: 0.05, fill: black, name: "v4") 
    content("v4.right", $v_4$, anchor: "right", padding: 0.2)

     circle((3, 1.5), radius: 0.05, fill: black, name: "v5") 
    content("v5.right", $v_5$, anchor: "left", padding: 0.2)

     circle((6, 1.5), radius: 0.05, fill: black, name: "v6") 
    content("v6.right", $v_6$, anchor: "right", padding: 0.2)

    line("v1", "v2", name: "v1v2")
    content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.1)

    bezier("v1","v2", (-1.5,2), name: "be1")
    content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    line("v1", "v3", name: "v1v3")
    content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)

    line("v2", "v3", name: "v2v3")
    content("v2v3.left", $e_3$, anchor: "left", padding: 1)

     line("v2", "v4", name: "v2v4")
    content("v2v4.left", $e_5$, anchor: "left", padding: 0.1)

     line("v4", "v3", name: "v4v3")
    content("v4v3.bottom", $e_6$, anchor: "bottom", padding: 0.1)

     line("v1", "v5", name: "v1v5")
    content("v1v5.bottom", $e_7$, anchor: "bottom", padding: 0.5)

     line("v3", "v5", name: "v3v5")
    content("v3v5.bottom", $e_8$, anchor: "bottom", padding: 0.4)

  
    
})

// #align(center)[#text(orange)[*Hình 1.11*] Minh họa bậc của đỉnh]
#figure(
  do-thi-tong-bac,
  caption: [Đồ thị với các bậc khác nhau],
) <fig-do-thi-tong-bac-xxx>

Trong #figref[@fig-do-thi-tong-bac-xxx], ta có thể tính được bậc của các đỉnh như sau: 

$ d(v_1)=4, d(v_2)=4, d(v_3)=4, d(v_4)=2, d(v_5)=2$ và $d(v_6)=0 $.

// #figure(
//   caption: [Một hình XXX]
// )[
//   #canvas(length: 10%, {
//     import cetz.draw: *

//     let y = 2 
//     let x = 4
//     let y-space = 1
//     let h=1.4

//     circle((0*h,3), radius: 0.05,fill:black, name: "v1")
//     content("v1.left", $v_1$, anchor: "bottom", padding: 0.3)

//     circle((-3, 3), radius: 0.05, fill: black, name: "v2") 
//     content("v2.right", $v_2$, anchor: "right", padding: 0.2)

//     circle((0, 0), radius: 0.05, fill: black, name: "v3") 
//     content("v3.bottom", $v_3$, anchor: "top", padding: 0.1)

//     circle((-3, 0), radius: 0.05, fill: black, name: "v4") 
//     content("v4.right", $v_4$, anchor: "right", padding: 0.2)

//      circle((3, 1.5), radius: 0.05, fill: black, name: "v5") 
//     content("v5.right", $v_5$, anchor: "left", padding: 0.2)

//      circle((6, 1.5), radius: 0.05, fill: black, name: "v6") 
//     content("v6.right", $v_6$, anchor: "right", padding: 0.2)

//     line("v1", "v2", name: "v1v2")
//     content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.1)

//     bezier("v1","v2", (-1.5,2), name: "be1")
//     content("be1.top", $e_4$, anchor: "top", padding: 0.2)

//     line("v1", "v3", name: "v1v3")
//     content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)

//     line("v2", "v3", name: "v2v3")
//     content("v2v3.left", $e_3$, anchor: "left", padding: 1)

//      line("v2", "v4", name: "v2v4")
//     content("v2v4.left", $e_5$, anchor: "left", padding: 0.1)

//      line("v4", "v3", name: "v4v3")
//     content("v4v3.bottom", $e_6$, anchor: "bottom", padding: 0.1)

//      line("v1", "v5", name: "v1v5")
//     content("v1v5.bottom", $e_7$, anchor: "bottom", padding: 0.5)

//      line("v3", "v5", name: "v3v5")
//     content("v3v5.bottom", $e_8$, anchor: "bottom", padding: 0.4)

  
    
//     }
// )
// ]

Định lý sau đây thể hiện mối liên hệ giữa tổng bậc và số cạnh của đồ thị.

// #text(orange)[*Định lý 1.1*] _Tổng bậc của tất cả các đỉnh trong một đồ thị bằng hai lần số cạnh của đồ thị đó_

#theorem[
  Tổng bậc của tất cả các đỉnh trong một đồ thị bằng hai lần số cạnh của đồ thị đó.
] <theorem-tong-bac>

// #show ref: it => {
//   let eq = math.equation
//   let el = it.element
//   // if el != none and el.func() == eq {
//   if el != none and 1==1 {
//     el.func()
//   } else {
//     // Other references as usual.
//     it
//   }
// }

// #thmref(<theorem-tong-bac>)

// Ta co @theorem-tong-bac

// #theorem("Euclid")[
//   Tổng bậc của tất cả các đỉnh trong một đồ thị bằng hai lần số cạnh của đồ thị đó
// ]

=== Đường đi và chu trình

_Đường đi (walk)_ trong $G$ là một dãy khác rỗng hữu hạn gồm các đỉnh và các cạnh xen kẽ nhau. Nếu các cạnh của đường đi đôi một khác nhau thì đường đi đó được gọi là _đường đi đơn (trail)_. Trong khi đó, nếu các đỉnh của đường đi đôi một khác nhau thì được gọi là _đường đi sơ cấp (path)_.

_Chu trình (closed walk)_ là một đường đi có đỉnh đầu và đỉnh cuối trùng nhau. _Chu trình đơn (closed trail)_ là một chu trình có các cạnh đôi một khác nhau. _Chu trình sơ cấp (cycle)_ là một chu trình đơn có các đỉnh đôi một khác nhau ngoại trừ đỉnh đầu và đỉnh cuối.

Đối với đồ thị có trọng số, _độ dài đường đi (length)_ bằng tổng trọng số cạnh của đường đi đó.

// Tính liên thông trên đồ thị là một khái niệm liên quan đến khả năng kết nối giữa các đỉnh trong một đồ thị. Một đồ thị được gọi là _liên thông_ nếu tồn tại một đường đi giữa mọi cặp đỉnh. Cụ thể

// (a) _Đồ thị vô hướng liên thông_: Là đồ thị trong đó mỗi cặp đỉnh bất kỳ, ta có thể tìm được một đường đi giữa chúng. Điều này có nghĩa là không có đỉnh nào bị tách rời khỏi phần còn lại của đồ thị.

// (b) _Đồ thị có hướng liên thông mạnh_: Là đồ thị có hướng, trong đó tồn tại đường đi từ bất kỳ đỉnh nào đến bất kỳ đỉnh khác. Điều này yêu cầu cả hai chiều đường đi phải tồn tại giữa hai đỉnh.

// (c) _Đồ thị có hướng liên thông yếu_: Nếu ta bỏ qua hướng của các cạnh (xem như cạnh vô hướng) và đồ thị trở thành liên thông. 

// Tính liên thông là một yếu tố quan trọng để phân tích cấu trúc của đồ thị và áp dụng trong nhiều bài toán như mạng lưới giao thông, thiết kế mạng máy tính, hoặc giải quyết các bài toán về tối ưu hóa. 

// ==== #text(orange)[1.1.4 Đồ thị cây]

Trong phần tiếp theo, chúng ta sẽ đi sâu vào nghiên cứu đồ thị cây - một loại đồ thị đơn giản và có nhiều ứng dụng trong thực tế.

=== Đồ thị cây

_Đồ thị cây $T$ (tree graph)_ là đồ thị liên thông và không chứa chu trình sơ cấp.

#let do-thi-cay = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

    circle((0*h,2), radius: 0.05,fill:black, name: "v1")
    content("v1.left", $v_1$, anchor: "bottom", padding: 0.3)

    circle((-2, 2), radius: 0.05, fill: black, name: "v2") 
    content("v2.right", $v_2$, anchor: "right", padding: 0.2)

    circle((0, 0), radius: 0.05, fill: black, name: "v3") 
    content("v3.bottom", $v_3$, anchor: "top", padding: 0.1)

    circle((-2, 0), radius: 0.05, fill: black, name: "v4") 
    content("v4.right", $v_4$, anchor: "right", padding: 0.2)

     circle((2, 1), radius: 0.05, fill: black, name: "v5") 
    content("v5.right", $v_5$, anchor: "top", padding: 0.1)

     circle((4, 1), radius: 0.05, fill: black, name: "v6") 
    content("v6.right", $v_6$, anchor: "top", padding: 0.1)

    circle((6, 2), radius: 0.05, fill: black, name: "v7") 
    content("v7.right", $v_7$, anchor: "left", padding: 0.2)
    
    circle((6, 0), radius: 0.05, fill: black, name: "v8") 
    content("v8.right", $v_8$, anchor: "right", padding: 0.2)
    line("v1", "v2", name: "v1v2")
    // content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.1)

    // bezier("v1","v2", (-1.5,2), name: "be1")
    // content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    // line("v1", "v3", name: "v1v3")
    // content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)

    // line("v2", "v3", name: "v2v3")
    // content("v2v3.left", $e_3$, anchor: "left", padding: 1)

    //  line("v2", "v4", name: "v2v4")
    // content("v2v4.left", $e_5$, anchor: "left", padding: 0.1)

     line("v4", "v3", name: "v4v3")
    // content("v4v3.bottom", $e_6$, anchor: "right", padding: 0.2)

     line("v1", "v5", name: "v1v5")
    // content("v1v5.bottom", $e_7$, anchor: "bottom", padding: 0.5)

     line("v3", "v5", name: "v3v5")
    // content("v3v5.bottom", $e_8$, anchor: "bottom", padding: 0.4)

     line("v6", "v5", name: "v6v5")
    // content("v6v5.bottom", $e_8$, anchor: "bottom", padding: 0.4)

     line("v6", "v7", name: "v6v7")

      line("v6", "v8", name: "v6v8")
})
// #align(center)[#text(orange)[*Hình 1.12*] Minh họa đồ thị cây]
#figure(
  do-thi-cay,
  caption: [Đồ thị cây],
) <fig-do-thi-cay>

Đồ thị cây có những đặc điểm nổi bật sau:

- Nếu $T$ là đồ thị cây có $n$ đỉnh thì luôn có đúng $n-1$ cạnh.

- Trong một cây, hai đỉnh bất kỳ được nối với nhau bằng một đường đi sơ cấp duy nhất. 

- Mỗi cây với mỗi đỉnh $n >= 2$ thì có ít nhất hai đỉnh bậc một. Những đỉnh bậc một này thường được gọi là _lá_, và chúng đóng vai trò quan trọng trong việc xác định cấu trúc và tính chất của cây.


// #text(orange)[*Định lý 1.2*] _Trong một cây, hai đỉnh bất kỳ được nối với nhau bằng một đường đi sơ cấp duy nhất._

// #text(orange)[*Chứng minh*]

// Ta sẽ chứng minh bằng phản chứng. Cho _G_ là một cây và giả sử rằng trong _G_ có hai đường đi sơ cấp khác nhau từ _u_ đến _v_ là $P_1$ và $P_2$. Vì $P_1 != P_2$ nên tồn tại một cạnh $e=x y $ của $P_1$ không phải là cạnh của $P_2$. Rõ ràng đồ thị $(P_1 union P_2) - e$ liên thông, xem hình(....). Do đó, nó chứa một đường đi sơ cấp $P$ đi từ $x$ đến $y$. Khi đó $ P + e$ là một chu trình sơ cấp trong $G$, mâu thuẫn với giả thiết $G$ là một cây. $square.stroked.medium$

// Lá (leaf) là các đỉnh (node) trong cây có bậc (degree) bằng 1. Nói cách khác, một đỉnh là lá nếu nó chỉ kết nối với đúng một đỉnh khác trong cây. 
// (Ví dụ minh họa)

//ĐN kỹ lại a ( nên sài N^1 như trong bài báo)

Tiếp theo, ta sẽ xem xét một bổ đề quan trọng sau:

// #definition[
//  Đặt $a,x,y$ và $z$ là bốn điểm phân biệt nằm trên cây $T$ sao cho $z in P(x,y)$ thì $z in P(a,x)$ hoặc $z in P(a,y)$
// ]


#lemma[ Với hai điểm $x$ và $y$ gọi $P(x,y)$ là đường đi nối $x$ và $y$.
 Đặt $a,x,y$ và $z$ là bốn điểm phân biệt nằm trên cây $T$ sao cho $z in P(x,y)$ thì $z in P(a,x)$ hoặc $z in P(a,y)$
] <thm-paths-on-trees>

// #text(orange)[*Chứng minh*]
#proof[Theo giả thiết, ta có $z in P(x,y)$. Ta giả sử $ z in.not P(a,x)$ và $z in.not P(a,y)$ (như hình vẽ) (vẽ hình minh họa). Bởi vì đường đi kết nối $x$ và $y$ đi qua $a$ nhưng không chứa $z$, trong khi đó đường đi $P(x,y)$ chứa $z$. Vì vậy, tồn tại hai con đường nối $x$ và $y$ và điều này mâu thuẫn với tính chất của đồ thị cây.
]

#let do-thi-cay = canvas(length: 10%, {
    import cetz.draw: *

    let y = 2 
    let x = 4
    let y-space = 1
    let h=1.4

     circle((2, 1), radius: 0.05, fill: black, name: "x") 
    content("x.right", $x$, anchor: "top", padding: 0.1)

    circle((3, 5), radius: 0.05, fill: black, name: "a") 
    content("a.right", $a$, anchor: "top", padding: 0.1)

    circle((5, 1), radius: 0.05, fill: black, name: "z") 
    content("z.right", $z$, anchor: "top", padding: 0.1)

     circle((6, 1), radius: 0.05, fill: black, name: "y") 
    content("y.right", $y$, anchor: "top", padding: 0.1)

    line("x", "a", name: "xa")
    // // content("v1v2.bottom", $e_1$, anchor: "bottom", padding: 0.1)

    // // bezier("v1","v2", (-1.5,2), name: "be1")
    // // content("be1.top", $e_4$, anchor: "top", padding: 0.2)

    line("a", "y", name: "ay")
    // // content("v1v3.right", $e_2$, anchor: "right", padding: 0.1)

    line("x", "y", name: "xy")
    // // content("v2v3.left", $e_3$, anchor: "left", padding: 1)

    // //  line("v2", "v4", name: "v2v4")
    // // content("v2v4.left", $e_5$, anchor: "left", padding: 0.1)

    //  line("v4", "v3", name: "v4v3")
    // // content("v4v3.bottom", $e_6$, anchor: "right", padding: 0.2)

    //  line("v1", "v5", name: "v1v5")
    // // content("v1v5.bottom", $e_7$, anchor: "bottom", padding: 0.5)

    //  line("v3", "v5", name: "v3v5")
    // // content("v3v5.bottom", $e_8$, anchor: "bottom", padding: 0.4)

    //  line("v6", "v5", name: "v6v5")
    // // content("v6v5.bottom", $e_8$, anchor: "bottom", padding: 0.4)

    //  line("v6", "v7", name: "v6v7")

    //   line("v6", "v8", name: "v6v8")
})
// #align(center)[#text(orange)[*Hình 1.12*] Minh họa đồ thị cây]
#figure(
  do-thi-cay,
  caption: [Đồ thị vòng chứa bốn điểm],
) <phan-chung>
 //ĐN a

=== Tính lồi của hàm khoảng cách trên cây

Mặc dù đồ thị cây là một loại đồ thị đơn giản, nhưng nó sở hữu nhiều tính chất đẹp và thú vị. Một trong những tính chất nổi bật là tính lồi của hàm khoảng cách được phát biểu bởi @dearing1976convex. Tính chất này đóng vai trò đặc biệt quan trọng trong các bài toán vị trí trên đồ thị cây.

Trước tiên ta nhắc lại về hàm lồi trên đồ thị cây. Cho hàm số $f$ liên tục trên đồ thị cây $T$.

#definition[Hàm $f$ liên tục trên đồ thị $T$ được gọi là _lồi_ nếu với mọi đường đi $P(a, b)$, $a, b in T$, và với mọi $lambda in [0, 1]$, ta có 
$
  f(x_lambda) <= lambda f(a) + (1- lambda) f(b).
$
trong đó $x_lambda in P(a, b)$ sao cho $d(a, x_lambda) = lambda d(a, b)$.]

Xét điểm $a$ cố định thuộc $T$. Ta chứng minh hàm khoảng cách từ một điểm $x$ bất kỳ đến một điểm cố định $a$, $d(x,a)$, là  hàm lồi trên đồ thị cây.

// #text(orange)[*Định lý 1.2*] _Tổng bậc của tất cả các đỉnh trong một đồ thị bằng hai lần số cạnh của đồ thị đó_
// Hàm khoảng cách trên đồ thị cây là hàm lồi
//Coi kĩ lại chứng minh.
#theorem[
  Hàm khoảng cách $x arrow.bar d(x,a)$ là lồi với mọi $a in T$ khi và chỉ khi $T$ là đồ thị cây.
] <thm-distance-function-is-convex>

// @thm-distance-function-is-convex

#proof[Ta sẽ tiến hành chứng minh hai chiều.

Giả sử, $T$ là đồ thị cây. Chọn $y,z$ bất kỳ nằm trên cây $T$, $0<lambda<1$ và $x in P(z, x)$ thỏa $d(z, x) = lambda d(z, y)$. Để chứng minh $d(x,a)$ là hàm lồi, ta cần chứng minh $d(x,a) <= lambda d(y,a) + (1-lambda) d(z,a)$ hoặc ta có thể chứng minh bất đẳng thức sau:

$ d(x,a) d(y,z) <= d(x,z) d(y,a) + d(x,y) d(z,a) $ <eq:distance-1>

// #eqref(<eq:distance-1>)

// (Cách trích dẫn @eq:distance-a )

// *Bổ đề 1.2.2*

Vì $x in P(y,z)$ nên theo @thm-paths-on-trees, ta có $x in P(y,a)$ hoặc $x in P(z,a)$.

Mặt khác, ta có $d(y,z) = d(y,x)+d(x,z)$ do $x in P(y,z)$, nên

$
  d(x,a)d(y, z)=d(x,a)d(y,x)+d(x,a)d(x,z)
$ <eq:distance-2>

Giả sử, $x in P(z,a)$ ta có:

$ d(x,a)=d(z,a)-d(z,x) $ <eq:distance-3>

Hơn nữa, theo bất đẳng thức tam giác ta có, $ d(x,a)<= d(a,y)+d(y,x) $ <eq:distance-4>

Thay #eqref(<eq:distance-3>) và #eqref(<eq:distance-4>) vào #eqref(<eq:distance-2>) ta được #eqref(<eq:distance-1>).

Trường hợp $x in P(y,a)$ cũng được chứng minh tương tự.

Ta chứng mình chiều ngược lại bằng phản chứng. Giả sử $x arrow.bar d(x,a)$ là hàm lồi trên tập các điểm thuộc đồ thị $T$ và giả sử rằng $T$ không phải là cây. Nói cách khác, tồn tại một chu trình $C$ của $T$ có độ dài ngắn nhất, giả sử là $l>0$, trong tất cả các chu trình của $T$. Bởi vì $C$ là một chu trình ngắn nhất trong $T$, nên ta có thể chọn $x,y,z$ và $a$ trong $C$ sao cho $d(a,x)=d(y,z)=l/2$, $d(a,y)=d(x,y)=d(z,a)=d(x,z)=l/4$ và $d(x,z)=1/2 d(y,z)$. Khi đó $d(x,a)=l/2 > 1/2d(y,a) + 1/2d(z,a)=l/4 $, điều này mâu thuẫn với giả thiết $d(x,a)$ là hàm lồi. Vậy $T$ là đồ thị cây.]

// (Có thể thêm bổ đề 3)

// -Nghiệm cục bộ cũng là nghiệm toàn cục => trên cây giải hiệu quả....
// (Có thể chứng minh thêm nghiệm cục bộ là nghiệm toàn cục)





