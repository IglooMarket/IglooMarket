INSERT INTO users (email, pwd, phone_number, name) VALUES
('user1@example.com', 'password1', '010-1234-0001', '김철수'),
('user2@example.com', 'password2', '010-1234-0002', '이영희'),
('user3@example.com', 'password3', '010-1234-0003', '박민수'),
('user4@example.com', 'password4', '010-1234-0004', '최지훈'),
('user5@example.com', 'password5', '010-1234-0005', '정수빈'),
('user6@example.com', 'password6', '010-1234-0006', '한지민'),
('user7@example.com', 'password7', '010-1234-0007', '이상훈'),
('user8@example.com', 'password8', '010-1234-0008', '송하늘'),
('user9@example.com', 'password9', '010-1234-0009', '임지우'),
('user10@example.com', 'password10', '010-1234-0010', '오세훈'),
('user11@example.com', 'password11', '010-1234-0011', '김유진'),
('user12@example.com', 'password12', '010-1234-0012', '이채원'),
('user13@example.com', 'password13', '010-1234-0013', '박정우'),
('user14@example.com', 'password14', '010-1234-0014', '최은지'),
('user15@example.com', 'password15', '010-1234-0015', '정우진'),
('user16@example.com', 'password16', '010-1234-0016', '한서연'),
('user17@example.com', 'password17', '010-1234-0017', '이도현'),
('user18@example.com', 'password18', '010-1234-0018', '송재원'),
('user19@example.com', 'password19', '010-1234-0019', '임수정'),
('user20@example.com', 'password20', '010-1234-0020', '오민재'),
('user22@example.com', 'password22', '010-1234-0021', '김삿갓'),
('user23@gmail.com', 'password23', '01012340023', '오예스'),
('user24@gmail.com', 'PasSword24!', '01012340024', '오너우이');


INSERT INTO products (owner_id, product_name, price, status, datetime, description) VALUES
(1, '중고 자전거', 50000, '판매중', '2025-01-01', '상태 좋습니다.'),
(2, '노트북', 300000, '판매완료', '2025-01-02', '사양 괜찮습니다.'),
(3, '책상', 150000, '판매중', '2025-01-03', '튼튼한 책상입니다.'),
(4, '의자', 30000, '판매중', '2025-01-04', '편안한 의자입니다.'),
(5, '모니터', 200000, '판매완료', '2025-01-05', '화질 좋습니다.'),
(6, '카메라', 250000, '판매중', '2025-01-06', '새 제품입니다.'),
(7, '헤드폰', 50000, '판매완료', '2025-01-07', '소음 차단 기능 있습니다.'),
(8, '스마트폰', 700000, '판매중', '2025-01-08', '배터리 상태 양호합니다.'),
(9, '게임기', 400000, '판매중', '2025-01-09', '게임 몇 개 포함입니다.'),
(10, '가방', 80000, '판매완료', '2025-01-10', '상태 좋습니다.'),
(11, '스피커', 60000, '판매중', '2025-01-11', '음질 좋습니다.'),
(12, '태블릿', 250000, '판매완료', '2025-01-12', '상태 양호합니다.'),
(13, '드론', 300000, '판매중', '2025-01-13', '비행 잘 됩니다.'),
(14, '자전거 헬멧', 25000, '판매완료', '2025-01-14', '새것입니다.'),
(15, '캠핑의자', 20000, '판매중', '2025-01-15', '편리한 의자입니다.'),
(16, '블루투스 이어폰', 100000, '판매완료', '2025-01-16', '상태 양호합니다.'),
(17, '스포츠 용품', 50000, '판매중', '2025-01-17', '상태 좋습니다.'),
(18, '주방용품 세트', 60000, '판매완료', '2025-01-18', '사용감 거의 없습니다.'),
(19, '자전거 펌프', 15000, '판매중', '2025-01-19', '상태 좋습니다.'),
(20, '에어프라이어', 80000, '판매완료', '2025-01-20', '상태 양호합니다.');

INSERT INTO messages (room_id, receiver_id, sender_id, content) VALUES
(1, 1, 2, '안녕하세요! 자전거 구매하고 싶은데 가격 조정 가능할까요?'),
(1, 2, 1, '안녕하세요! 가격은 5만원입니다. 괜찮으신가요?'),
(2, 2, 1, '노트북 사양 괜찮은가요?'),
(2, 1, 2, '네, 상태 좋습니다. 가격은 30만원입니다.'),
(3, 3, 4, '책상 상태는 어떤가요?'),
(3, 4, 3, '상태 좋습니다. 15만원에 판매합니다.'),
(4, 4, 3, '의자 사용감은 어떤가요?'),
(4, 3, 4, '편안한 의자입니다. 가격은 3만원입니다.'),
(5, 5, 6, '모니터 사진 좀 보여줄 수 있나요?'),
(5, 6, 5, '네, 사진 보내드릴게요. 상태 아주 좋습니다.'),
(6, 6, 5, '게임기 사고 싶은데, 네고 가능한가요?'),
(6, 5, 6, '가격은 25만원입니다. 상태 좋습니다.'),
(7, 7, 8, '스마트폰 배터리 상태는 어떤가요?'),
(7, 8, 7, '배터리 상태 양호합니다. 가격은 70만원입니다.'),
(8, 8, 7, '게임기 사용 기간은 얼마나 되나요?'),
(8, 7, 8, '1년 정도 사용했습니다. 가격은 40만원입니다.'),
(9, 9, 10, '가방 사이즈는 어떤가요?'),
(9, 10, 9, '사이즈는 적당합니다. 가격은 8만원입니다.'),
(10, 10, 9, '스피커 소리 좋나요?'),
(10, 9, 10, '네, 음질이 매우 좋습니다. 가격은 6만원입니다.');


INSERT INTO chatrooms (room_id, receiver_id, sender_id, product_id) VALUES
(1, 1, 2, 1),  -- 김철수가 이영희에게 중고 자전거에 대해 대화하는 채팅방
(2, 2, 1, 2),  -- 이영희가 김철수에게 노트북에 대해 대화하는 채팅방
(3, 3, 4, 3),  -- 박민수가 최지훈에게 책상에 대해 대화하는 채팅방
(4, 4, 3, 4),  -- 최지훈이 박민수에게 의자에 대해 대화하는 채팅방
(5, 5, 6, 5),  -- 정수빈이 한지민에게 모니터에 대해 대화하는 채팅방
(6, 6, 5, 6),  -- 한지민이 정수빈에게 카메라에 대해 대화하는 채팅방
(7, 7, 8, 7),  -- 이상훈이 송하늘에게 스마트폰에 대해 대화하는 채팅방
(8, 8, 7, 8),  -- 송하늘이 이상훈에게 게임기에 대해 대화하는 채팅방
(9, 9, 10, 9), -- 임지우가 오세훈에게 가방에 대해 대화하는 채팅방
(10, 10, 9, 10); -- 오세훈이 임지우에게 스피커에 대해 대화하는 채팅방




