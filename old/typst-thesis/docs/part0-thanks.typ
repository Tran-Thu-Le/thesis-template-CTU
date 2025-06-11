// -----------------------------
//    1. Lời Cám Ơn
// -----------------------------
#pagebreak()
#heading(numbering: none, level: 1)[Lời cảm ơn]
\

Để hoàn thành luận văn này, tôi đã nhận được rất nhiều sự giúp đỡ.

Trước tiên, tôi xin gửi lời tri ân chân thành đến Thầy XXX. Thầy đã tận tình chỉ dẫn, định hướng và chia sẻ những kiến thức quý giá, giúp tôi vượt qua những khó khăn trong suốt quá trình thực hiện đề tài. 


Bên cạnh đó, tôi không thể không nhắc đến sự động viên và ủng hộ từ gia đình, bạn bè, và những người thân yêu. Họ đã luôn ở bên cạnh, chia sẻ niềm vui, cổ vũ tinh thần và tiếp thêm sức mạnh cho tôi trong hành trình học tập và nghiên cứu.
Xin gửi lời cảm ơn trân trọng đến tất cả!

#let end-point = [_Cần Thơ, ngày ... tháng ... năm 2024_ \ \ \

*Nguyễn Thị B*]

#table(
  columns: 2,
  stroke: none,
  [#h(1fr)],
  [#align(center)[#end-point]]
)


// -----------------------------
//    2. Lời Cam Đoan
// -----------------------------

#pagebreak()
#heading(numbering: none, level: 1)[Lời cam đoan]

#v(5em)

#align(center, text(size: 20pt)[*Lời cam đoan*])

// LỜI CAM ĐOAN
Tôi tên Nguyễn Thị B, tôi xin cam đoan luận văn này là công trình nghiên cứu khoa học thực sự của bản thân tôi dưới sự hướng dẫn của PGS.TS Nguyễn Văn A.

Tất cả thông tin tham khảo trong luận văn được thu thập từ các nguồn đáng tin cậy, đã qua kiểm chứng và công bố rộng rãi, đồng thời được tôi trích dẫn nguồn gốc rõ ràng trong phần Tài liệu tham khảo. Các kết quả nghiên cứu trình bày trong luận văn là do chính tôi thực hiện một cách nghiêm túc, trung thực và không trùng lặp với bất kỳ đề tài nào đã được công bố trước đây.

Tôi cam kết bằng danh dự và uy tín cá nhân về tính xác thực của lời tuyên bố này.

#table(
  // width: 100%,
  columns: (1fr, 1fr), 
  // stroke: black,
  stroke: none,
  align(center)[\ *Cán bộ hướng dẫn*\ \ \ *PGS.TS. Nguyễn Văn A*],
  align(center)[_Cần Thơ, ngày ... tháng ... năm 2024_
*Sinh viên thực hiện*\ \ \ *Nguyễn Thị B*]
)

// -----------------------------
//    3. Lý do chọn đề tài
// -----------------------------
#pagebreak()
#heading(numbering: none, level: 1)[Lý do chọn đề tài]

// *1. Lý do chọn đề tài* 
#heading(numbering: none, level: 2, outlined: false)[a. Lý do chọn đề tài]

\ 

Bài toán vị trí (Location problems) là một lớp bài toán quan trọng trong Vận trù học (Operation Research) và được nghiên cứu một cách rộng rãi, độc giả có thể tham khảo thêm từ các tài liệu như @marianov2024location hoặc @laporte2019introduction. Đáng chú ý trong số đó là bài toán vị trí trung vị (1-median) bởi tính ứng dụng thực tiễn cao của nó. Trong bài toán này, mục tiêu là xác định một điểm trên đồ thị sao cho tổng khoảng cách có trọng số từ mọi đỉnh đến điểm đó là nhỏ nhất. Vị trí 1-median có thể được dùng để xây dựng các cơ sở quan trọng như các kho hàng, bệnh viện, trường học hoặc các trung tâm dịch vụ công cộng, nhằm tối thiểu hóa thời gian di chuyển của người dân. Một ví dụ cụ thể trong lĩnh vực logistics là _bài toán kho đến trạm phân phối_ (warehouse-to-lockers), được nghiên cứu bởi @espejo2023p. Trong mô hình này, nhà kho cần được đặt tại vị trí 1-median trên mạng lưới đồ thị để giảm thiểu tổng chi phí vận chuyển đến các trạm phân phối. Mỗi trạm phân phối có sức chứa xác định để đáp ứng nhu cầu khách hàng, và chi phí vận chuyển từ nhà kho đến từng trạm được tính dựa trên khoảng cách và quy mô nhu cầu.

Tuy nhiên, trong thực tế, hàng hóa và chi phí vận chuyển không phải lúc nào cũng cố định. Chúng thường biến động dưới ảnh hưởng của nhiều yếu tố khách quan. Chẳng hạn, lượng hàng hóa tại các trạm phân phối có thể thay đổi do điều kiện thời tiết, mùa vụ, hoặc tình hình tài chính của người dân trong khu vực. Sự dao động này tại các trạm phân phối không chỉ ảnh hưởng đến nhu cầu hàng hóa mà còn tác động trực tiếp đến vị trí tối ưu của kho chứa. Điều này cho thấy tính ổn định của vị trí 1-median có thể bị tác động bởi các yếu tố bên ngoài.

Để nghiên cứu tính ổn định của kho hàng nói riêng và vị trí 1-median nói chung, _bán kính ổn định_ là một công cụ đặc biệt hữu ích. Bán kính ổn định đo lường mức độ nhiễu tối đa của các tham số trong mô hình, trong khi vẫn đảm bảo rằng vị trí tối ưu ban đầu vẫn còn giữ tính tối ưu trong phạm vi nhiễu đó. ...

Do đó, trong luận văn này, tôi sẽ tập trung nghiên cứu sâu về ...

// *2. Mục đích nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[b. Mục đích nghiên cứu]

\ 

Mục đích nghiên cứu của luận văn này là định nghĩa được ...., nghiên cứu ... và đồng thời tìm ra giải thuật ....

// *3. Đối tượng nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[c. Đối tượng nghiên cứu]

\ 



- Nghiên cứu lý thuyết đồ thị.
- Nghiên cứu bài toán vị trí 1-median.
- Nghiên cứu một số bài toán ngược: bài toán inverse 1-median, reverse 1-median, upgrading 1-median.

// *4. Phạm vi nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[d. Phạm vi nghiên cứu]

\

- Bài toán vị trí.
- Đồ thị cây.
- Các lớp bài toán ngược.
- Bán kính ổn định.

// *5. Phương pháp nghiên cứu*
#heading(numbering: none, level: 2, outlined: false)[e. Phương pháp nghiên cứu]

\

- Tổng hợp tài liệu: Lý thuyết đồ thị, bài toán vị trí, các bài toán ngược trên đồ thị và một số bài toán liên quan.
- Nghiên cứu lý thuyết: Ước lượng cận dưới bán kính ổn định của điểm 1-median trên cây.
- Nghiên cứu thuật toán: Thuật toán tổ hợp, phân tích độ phức tạp tính toán.

// *6. Nội dung chính của luận văn*
#heading(numbering: none, level: 2, outlined: false)[f. Nội dung chính của luận văn]

\

- Chương 1: Kiến thức chuẩn bị.

- Chương 2: ....

// *7. Kết quả đạt được* 
#heading(numbering: none, level: 2, outlined: false)[g. Kết quả đạt được]

\

Luận văn đã thành công trong việc ....

Kết quả của luận văn được trình bày trong bài báo khoa học đã gửi và đang được phản biện bởi tạp chí ....

// -----------------------------
//    4. Ký hiệu, Danh mục Hình, Bảng
// -----------------------------
#pagebreak()
#heading(numbering: none, level: 1)[Danh mục các ký hiệu / từ viết tắt ]
#v(1em)

// #set table.hline(stroke: 1pt)

#table(
  stroke: none,
  columns: (auto, 6fr),
  [$G quad quad$],  [$quad quad $Đồ thị tổng quát],
  [],[],
  [$V$],  [$quad quad $ Tập hợp tất cả các đỉnh trên đồ thị],
  [],[],

  [$E$],  [$quad quad$ Tập hợp tất cả các cạnh trên đồ thị],
  [],[],

  [$T$],  [$quad quad$ Đồ thị cây],
  [],[],

  [$N(x_0)$],[$quad quad$ Tập hợp tất cả các đỉnh liền kề $x_0$],
  [],[],

  [$T_u$],  [$quad quad$ Cây lấy gốc tại $u$],
  // [],[],
  // [$bb(1)_T$],[$quad quad$ Tập hợp tất cả các đỉnh thuộc cây $T$],
  [],[],
  [$bb(1)_T_u$], [$quad quad$ Vecto có phần tử thứ $i$ bằng $1$ nếu $v_i$ thuộc cây $T_u$],
  [],[],
  [$angle.l a, b angle.r$], [$quad quad$ Tích vô hướng giữa hai vecto $a$ và $b$],
  [],[],
  [$R(w)$],  [$quad quad$ Bán kính ổn định ứng với trọng số $w$],
  [],[],
  [$underline(R)(w)$], [$quad quad$ Cận dưới bán kính ổn định ứng với trọng số $w$],
  [],[],
  [USR], [$quad quad$ Bài toán nâng cấp bán kính ổn định (Upgrading Stability Radius)],
  [],[],
  [PUSR],  [$quad quad$ Bài toán tham số hóa của USR (Parametric USR)],
)

#pagebreak()
#heading(numbering: none, level: 1)[Danh mục các hình ]
#v(2em)
#{
  show outline.entry.where(
    level: 1
  ): it => {
    text(weight: "light", it)
  }
  outline(
    title: none,
    target: figure.where(kind: image),
  )
}

#pagebreak()
#heading(numbering: none, level: 1)[Danh mục các bảng ]
#v(2em)
#{
  show outline.entry.where(
    level: 1
  ): it => {
    text(weight: "light", it)
  }
  outline(
    title: none,
    target: figure.where(kind: "ctutable"),
  )
}

