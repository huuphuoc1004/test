-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 21, 2021 lúc 04:32 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cartproduct`
--

CREATE TABLE `cartproduct` (
  `cpid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cartproduct`
--

INSERT INTO `cartproduct` (`cpid`, `id`, `pid`, `quantity`) VALUES
(3, 3, 12, 1),
(6, 3, 8, 1),
(8, 3, 5, 1),
(14, 7, 5, 1),
(19, 3, 3, 5),
(29, 3, 6, 1),
(33, 3, 13, 2),
(40, 7, 1, 3),
(43, 12, 1, 3),
(44, 12, 20, 1),
(45, 14, 4, 1),
(46, 1, 7, 1),
(47, 7, 20, 1),
(48, 12, 13, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cid`, `cname`) VALUES
(1, 'Áo quần'),
(2, 'Giày'),
(3, 'Phụ kiện');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `cmt_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `pid` int(11) NOT NULL,
  `id` int(100) NOT NULL,
  `rating` double NOT NULL,
  `activeStar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`cmt_id`, `comment`, `pid`, `id`, `rating`, `activeStar`) VALUES
(1, 'Sản phẩm rất đáng đồng tiền.', 3, 3, 4.5, 0),
(2, 'Sản phẩm rất nhiều người mua. aaa', 6, 3, 5, 0),
(4, 'Áo đẹp. Vải chất lượng.', 3, 7, 4.5, 0),
(5, 'Áo không đẹp cho lắm.', 3, 9, 2, 0),
(42, 'Áo Real thật tuyệt vời.', 3, 7, 3, 0),
(50, 'Áo Real đẹp nhất thế giới', 3, 7, 5, 0),
(52, 'cút', 3, 9, 4, 0),
(56, 'Sản phẩm rất đẹp.', 3, 3, 3, 0),
(57, 'cút đi', 3, 3, 4, 0),
(58, 'áo đẹp quá.', 2, 9, 3, 0),
(59, 'cút đi', 2, 9, 4, 0),
(63, 'san [jasdsa', 4, 3, 3, 1),
(64, 'asdasd', 1, 3, 4.5, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `cid` int(11) NOT NULL,
  `description` varchar(10000) NOT NULL,
  `price` double NOT NULL,
  `discount` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `cart` int(11) NOT NULL,
  `star` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`pid`, `pname`, `cid`, `description`, `price`, `discount`, `picture`, `cart`, `star`) VALUES
(1, 'Áo Barcelona sân nhà 1', 1, 'Mẫu áo đấu năm nay được thay đổi hoàn toàn về thiết kế, áo đấu trở lại thiết kế truyền thống hơn. Sử dụng hai gam màu Xanh – Đỏ truyền thống cùng thiết kế các đường kẻ sọc bên cạnh chiếc cổ áo tròn mang đậm tính thể thao, năng động.', 100000, 9, 'HjGseReBRLSAlN6sDmIvR4bUGHvfplN2p3HXTra3.jpeg', 0, 4.5),
(2, 'Áo Barcelona sân khách 1', 1, 'Mẫu áo bóng đá CLB Barca 2020 - 2021 sân khách sẽ có màu đen chủ yếu, được kết hợp với màu vàng đồng ánh kim để làm logo và trang trí. Nhà tài trợ áo đấu barca 2020 sẽ không sử dụng logo Barca truyền thống đầy màu sắc mà chỉ sử dụng màu đen và vàng đồng. Mẫu áo Barcelona đen 2020 -21 mới tự hào với vẻ ngoài gọn gàng, phối cùng với các vân chìm được dập chuẩn nét, mạnh mẽ. viền trên cổ áo và viền tay màu vàng đồng phù hợp với màu logo CLB, logo nhà tài trợ. Quần short đen điểm nhấn bằng một viền bên hông màu đồng cùng màu logo. hoàn thiện bộ đồng phục bóng đá Barcelona 2020 sân khách mới.', 120000, 10, 'qYosWgoXA53ghHSa8w7K3XteKRwsgQenTl5UtKXa.jpeg', 0, 3),
(3, 'Áo Real Madrid sân nhà', 1, 'Mẫu áo bóng đá câu lạc bộ Real Madrid 2019 Sân Nhà  được thiết kế đơn giản, màu sắc hài hòa với tông màu chủ đạo là tông màu trắng – đen truyền thống. Cổ áo được thiết kế theo kiểu cổ tim với màu trắng bo vòng xung quanh trước viền cổ áo. Những đường kẻ đen ở hai bên vai áo kết hợp với hai cánh tay áo màu trắng có viền trắng ở ống tay áo càng làm tăng thêm sự hài hòa trong màu sắc của mẫu áo. Nổi bật trên nền trắng tinh khôi của áo đấu là dòng chữ màu đen mang tên nhà tài trợ áo đấu Fly Emirates. Đi kèm là logo quen thuộc của câu lạc bộ ở bên phải ngực áo đấu.', 200000, 5, 'xwn1bdx89UBsCM6RbhjVrf2zEYD0Vo7bRCghLvRb.jpeg', 0, 3.8),
(4, 'Áo Real Madrid sân khách 1', 1, 'Áo Real Madrid tím than là một trong những dòng sản phẩm áo bóng đá ra mắt năm 2019 đã thu hút được rất nhiều bạn trẻ tin dùng như một người bạn không thể thiếu trong hầu hết các cuộc chơi cũng như cuộc thi đấu. Đến với Áo Real Madrid tím than bạn sẽ cảm nhận được độ thông thoáng, thoải mái nhất. Để hiểu rõ hơn về chi tiết về dòng sản phẩm mời các bạn hãy đến với FBSHOP.VN nhá.', 110000, 5, '4UCl81nE4MEbopJTCHdWG8WGwdnPnOXDbO0dU8Kr.jpeg', 0, 3),
(5, 'Giày đá bóng Kamito', 2, 'Đây là dòng giày sân cỏ nhân tạo “quốc dân”, được rất nhiều người tin dùng bởi mức giá hợp “ví” cùng chất lượng đáng kinh ngạc trong tầm giá.Velocidad 3 được kế thừa toàn bộ những ưu điểm của đánf anh đi trước và cũng không ngừng cải tiến, nâng cấp để đôi giày được hoàn thiện hơn.', 200000, 3, '8b3d7b484f59b607ef48.jpg', 0, 0),
(6, 'Giày đá bóng zocker', 2, 'Chất liệu làm từ da PU chất lượng cao tạo cảm giác mềm mại. Bề mặt được xử lý vân 3D giúp tăng độ ma sát, khả năng xử lý bóng khống chế và kiểm soát bóng tốt hơn. Trọng luongj khá nhẹ, hỗ trợ xử lý các pha bứt tốc. mũi giầy có thiết kế thon và được gia cố bởi những đường may kép rất chắc chắn, đảm bảo mang đến những pha chích mũi bóng cực chất.', 250000, 5, '6c0194cc8b2b76.jpg', 1, 5),
(7, 'Giày đá bóng Mitre', 2, 'Giày bóng đá Mitre chuyên cho sân cỏ nhân tạo, được thiết kế và sản xuất bởi Động Lực, một thương hiệu nổi tiếng chuyên đồ thể thao của Việt Nam. Mũi giày được khâu chắc chắn. Upper được làm từ chất liệu da Microfiber cao cấp mang lại cảm giác mềm, êm chân, giúp cho bạn khi sút bóng không có cảm giác nặng nề mà cực kì êm ái. Bề mặt được phủ 1 lớp nano chống nước, chống bẩn giúp vệ sinh giày dễ dàng hơn.', 500000, 5, 'z1962570591464_68dcc1efabb69db238be164a5a702255.jpg', 1, 0),
(8, 'Giày đá bóng Jogarbola', 2, 'Dòng sản phẩm mới nhất của thương hiệu này là Jogarbola 190424B được thiết kế theo form thon gọn và thuôn dài nên có cảm giác rất ôm chân, nhưng không hề bị tức dù bạn có đeo tất chống trơn dày.\r\n\r\nPhần upper được làm từ chất liệu microfiber tiếp bóng rất tốt, đỡ bóng dính mang đến cho bạn những trải nghiệm cảm giác rất thật khi chạm bóng trực tiếp. Form giày phù hợp với những bạn thích dứt điểm hay dê rắt bóng, bên cạnh đó phần gót cho cảm giác rất chắc chắn và ôm rất chặt.', 450000, 7, 'z1968666427939_0819bc84fea2a3c6a8905fbb6bcdd476.jpg', 0, 0),
(9, 'Giày đá bóng AKKA', 2, ' Mẫu giày đá bóng được sản xuất với tiêu chí đảm bảo chất lượng từ thân giày, đế giày, cho đến cả lót giày. Thân giày được làm từ da Microfiber (một trong những loại da nhân tạo cao cấp nhất thị trường), đế làm từ Cao su chống bào mòn và lót giày làm từ EVA cao cấp.\r\n\r\nGiày đá bóng Akka được thiết kế với mẫu mã đa dạng từ cổ chun ôm chân cho đến những đôi giày có lưỡi gà rời dễ xỏ. Và để đáp ứng nhu cầu đa dạng theo lối chơi của từng cầu thủ, AKKA đã cho ra đời 3 dòng giày phù hợp với từng vị trí và phong cách chơi của cầu thủ:', 600000, 10, '30d617de85037c5d2.jpg', 0, 0),
(10, 'Bóng Đá EBET Số 5', 3, 'Nếu bạn đang muốn tiết kiệm mà tìm một quả bóng đá êm, đây là sản phẩm bạn nên biết. Đây là một trong những trái banh được yêu thích hiện nay bởi các bạn học sinh, sinh viên bởi giá thành rẻ, chỉ hơn 100 nghìn đồng. Bạn còn được tặng thêm kim bơm bóng khi mua hàng online nữa đấy.', 120000, 2, 'a7dad6096fbb4f17ed9977ab9be686c1.jpg', 0, 0),
(11, 'Bóng Đá UCV 3.05 Số 5', 3, 'Quả bóng Động Lực này được làm từ chất liệu da PU-PVC có độ bền cao. Giá thành phải chăng nên sản phẩm cũng là sự lựa chọn của nhiều bạn trẻ, cũng như được sử dụng trong nhiều giải thi đấu phong trào ở trường hay các câu lạc bộ. ', 220000, 5, '8cac764775dec3f37e6b2b50327b6bd9.jpg', 0, 0),
(12, 'Vợt Yonex Astrox Smash', 3, 'Yonex Astrox Smash có những tính năng mới, đây là dòng vợt dành cho lối đánh mạnh mẽ, tạt cầu một cách nhanh chóng và quyết liệt. Vợt có khối lượng nhẹ (~ 6U) nên người chơi dễ dàng vung vợt, ít bị rung lắc hay xoắn vợt.', 300000, 5, '1ljF8UjGr98gLQ9jW11iGc1YLkIs31cfNvbA1dEo.webp', 0, 0),
(13, 'Vợt cầu lông Apacs Accurate 99', 3, 'Vợt Apacs Accurate 99 là sản phẩm của nhà sản xuất cầu lông Apacs. Apacs Accurate 99 được thiết kế mạnh mẽ, cho phép bạn xoay chuyển linh hoạt giữa tấn công và phòng thủ.', 500000, 5, 'kbhtMfni8b0nt9hoAltpMgSPxIzDsP2bVVkWqscq.webp', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `token_created` varchar(100) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `active` int(11) NOT NULL,
  `wrong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `token_created`, `updated_at`, `fullname`, `active`, `wrong`) VALUES
(1, 'admin', '$2y$10$7vHWJz1yjte3WVqJaIRjA.T6u/xrZw2.BXvXScek92oH6W62V11ba', '', NULL, 'Admin', 0, 1),
(2, 'mod', '$2y$10$vrVBT2k.cvLEggRfoKKst.ShVTax/Yedt2KUQd2w/xsbttKYDY2EO', '', NULL, 'Mod', 0, 0),
(3, 'nguyenvanhuuphuoclapulga@gmail.com', '$2y$10$zM7H.xzPl2GH4TICLIpcY.mea99Ye5HgIS65D6QIBbHUiNklunfUG', 'ycCQyM', '2021-07-20 09:46:44', 'User01', 0, 0),
(4, 'vinaenter', '$2y$10$AkJJGkUFcCZ0ENfSNfeYbuzibLOuo/lquZJnhOAYG8Us1ZTYx9P4y', '', NULL, 'VinaEnter', 0, 0),
(7, 'hpwebsite01@gmail.com', '$2y$10$SH18WsntHx.kjEpetngwBe.99/o1XXwJV1/BENSR0H0AMQgsMOuPS', 'nfFn5r', '2021-07-20 09:46:59', 'User02', 0, 0),
(9, 'user03', '$2y$10$Oj1IZ2sadfSUwYrrEHRn8ucVlVzw1Ety7GqXV2sc692mNErznvPcG', '', NULL, 'User03', 0, 0),
(12, 'thao@gmail.com', '$2y$10$O1muvaJJaK74XYURZAdOZ.B56W7fTendTuAcvdm/qK60j89V.SJjm', 'tps64N', '2021-07-21 01:50:47', 'Trần Thị Thảo', 0, 0),
(14, 'user10', '$2y$10$es2r8pqJlWBVjoMPDKTY/uaTrNmoR8XpW08Ct5AtAvfnSw6G/RB9u', '', NULL, 'user10', 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cartproduct`
--
ALTER TABLE `cartproduct`
  ADD PRIMARY KEY (`cpid`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cmt_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cartproduct`
--
ALTER TABLE `cartproduct`
  MODIFY `cpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
