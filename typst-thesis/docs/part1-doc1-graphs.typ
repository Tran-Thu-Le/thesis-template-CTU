

#import "../tools/tools.typ": figref, theorem, definition, proposition, lemma, proof, example

// #show: set-file.with()


= Kiến thức liên quan

== Lý thuyết đồ thị


=== Khái niệm và các dạng đồ thị 

Trong thực tế, việc biểu diễn các đối tượng và mối quan hệ giữa chúng đóng vai trò quan trọng trong nhiều lĩnh vực khác nhau. Chẳng hạn, trong mạng xã hội, để nghiên cứu mối quan hệ giữa các cá nhân, chúng ta cần một công cụ có thể mô hình hóa các kết nối này một cách trực quan và hiệu quả. Tương tự, trong mạng lưới giao thông, việc mô phỏng mối liên hệ giữa các điểm đến và các tuyến đường giúp tối ưu hóa hành trình di chuyển, từ đó tiết kiệm thời gian và chi phí. Khi đó, _đồ thị_ trở thành một công cụ hữu ích để giải quyết nhu cầu này. Vậy, đồ thị là gì?

Trong toán học, đồ thị $G$ được định nghĩa như sau:  

Một đồ thị (graph) $G$ là một bộ ba $(V(G),E(G),psi_G)$ bao gồm một tập khác rỗng $V(G)$ các đỉnh (vertices) của $G$, một tập $E(G)$ các cạnh (edges) của $G$, và một hàm liên thuộc (incidence function) $psi_G$ đặt tương ứng mỗi cạnh với một cặp đỉnh. Nếu $e$ là một cạnh và $u,v$ là hai đỉnh sao cho $psi_(G) (e) = u v$ thì ta nói $e$ nối $u$ và $v$; các đỉnh $u$ và $v$ được gọi là các điểm đầu mút của $e$.

Để dễ dàng hình dung, ta xét ví dụ sau:
Cho đồ thị $G=(V(G),E(G),psi_G)$ với $V(G)={v_1,v_2,v_3,v_4,v_5}, E(G)={e_1,e_2,e_3,e_4,e_5,e_6}$ và $psi_G$ được xác định bởi $psi_G (e_1)=v_1v_2, psi_G (e_2)=v_2v_3, psi_G (e_3)= v_2v_4, psi_G (e_4)=v_1v_5, psi_G (e_5)=v_3v_5, psi_G (e_6)=v_1v_4$. Hình bên dưới là một biểu diễn hình học của đồ thị $G$.

