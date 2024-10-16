-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 09, 2024 lúc 03:33 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duantn1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `bannerID` int(11) NOT NULL,
  `bannerName` varchar(100) NOT NULL,
  `bannerImg` text NOT NULL,
  `bannerType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `blogID` int(11) NOT NULL,
  `shortdesc` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `thumbnail` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `postDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `prodcatID` int(11) NOT NULL,
  `catName` varchar(50) NOT NULL,
  `catLogo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `prodID` int(11) NOT NULL,
  `prodcatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `colorID` int(50) NOT NULL,
  `color` text COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `discountID` int(11) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `commentID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `prodRate` float NOT NULL,
  `userID` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`commentID`, `prodID`, `prodRate`, `userID`, `comment`) VALUES
(1, 4, 5, 2, 'ngon');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `colorID` int(11) DEFAULT NULL,
  `storageID` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `infoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_info`
--

CREATE TABLE `order_info` (
  `infoID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `orderCode` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `payment` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `orderStatus` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL DEFAULT 'Đợi xác nhận',
  `totalPay` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentCode` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `prodID` int(255) NOT NULL,
  `prodcatID` int(11) NOT NULL,
  `prodName` varchar(255) NOT NULL,
  `prodType` varchar(20) NOT NULL,
  `prodView` int(11) DEFAULT 0,
  `prodImg` text NOT NULL,
  `prodPrice` int(11) NOT NULL,
  `prodSale` int(11) NOT NULL DEFAULT 0,
  `prodDesc` text DEFAULT NULL,
  `QTY` int(11) NOT NULL DEFAULT 100,
  `prodRate` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`prodID`, `prodcatID`, `prodName`, `prodType`, `prodView`, `prodImg`, `prodPrice`, `prodSale`, `prodDesc`, `QTY`, `prodRate`) VALUES
(4, 5, 'Lẩu bò thập cẩm', 'Lau', 0, 'https://down-bs-vn.img.susercontent.com/vn-11134513-7r98o-lsv6npekbft03c@resize_ss640x400!@crop_w640_h400_cT', 350000, 10, '', 100, 0),
(5, 5, 'Tôm sốt thái', 'haisan', 0, 'https://file.hstatic.net/200000775599/file/tom-sot-thai_8b6214a5faa6442e8ad67e5cb63d0c0c_grande.png', 400000, 5, '', 100, 0),
(6, 5, 'Gà chiên nước mắm', 'Ga', 0, '	https://www.cet.edu.vn/wp-content/uploads/2021/03/canh-ga-chien-nuoc-mam.jpg', 41990000, 0, '', 100, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_entry`
--

CREATE TABLE `product_entry` (
  `entryID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `prodImg` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `colorID` int(11) DEFAULT NULL,
  `storageID` int(11) DEFAULT NULL,
  `ramID` int(11) DEFAULT NULL,
  `QTY` int(11) NOT NULL DEFAULT 100,
  `prodPrice` int(11) NOT NULL,
  `discountID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ram`
--

CREATE TABLE `ram` (
  `ramID` int(11) NOT NULL,
  `ram` varchar(11) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `storage`
--

CREATE TABLE `storage` (
  `storageID` int(11) NOT NULL,
  `storage_value` varchar(11) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `verified` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userID`, `username`, `password`, `email`, `admin`, `verified`) VALUES
(1, 'hoai', '$2b$10$dJJ203vvouq3GSPQ/IDWnOLzdGFdaGSil5gh7vW74OVyphFugVwzC', 'mynamehoaidz@gmail.com', 0, 0),
(2, 'dat', '$2b$10$K5bOUCxsx4DuPsC1.ZUf1O3s7FZrnMNC9HT2XT88wLsQkKhPI1tvW', 'dat@gmail.com', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_address`
--

CREATE TABLE `user_address` (
  `addressID` int(255) NOT NULL,
  `userID` int(255) NOT NULL,
  `firstname` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `lastname` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `flat` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `street` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistID` int(11) NOT NULL,
  `prodID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `storageID` int(11) DEFAULT NULL,
  `colorID` int(11) DEFAULT NULL,
  `ramID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlist`
--

INSERT INTO `wishlist` (`wishlistID`, `prodID`, `userID`, `storageID`, `colorID`, `ramID`) VALUES
(1, 4, 1, NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`bannerID`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blogID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`prodcatID`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`prodID`,`prodcatID`),
  ADD KEY `catID` (`prodcatID`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`colorID`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discountID`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `prodID` (`prodID`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `quantity` (`quantity`),
  ADD KEY `prodID` (`prodID`),
  ADD KEY `infoID` (`infoID`);

--
-- Chỉ mục cho bảng `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`infoID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `addressID` (`addressID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodID`);

--
-- Chỉ mục cho bảng `product_entry`
--
ALTER TABLE `product_entry`
  ADD PRIMARY KEY (`entryID`),
  ADD KEY `prodID` (`prodID`),
  ADD KEY `colorID` (`colorID`),
  ADD KEY `storageID` (`storageID`),
  ADD KEY `discountID` (`discountID`),
  ADD KEY `ramID` (`ramID`);

--
-- Chỉ mục cho bảng `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`ramID`);

--
-- Chỉ mục cho bảng `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`storageID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Chỉ mục cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `userID` (`userID`);

--
-- Chỉ mục cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `bannerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `colorID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_info`
--
ALTER TABLE `order_info`
  MODIFY `infoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `prodID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product_entry`
--
ALTER TABLE `product_entry`
  MODIFY `entryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ram`
--
ALTER TABLE `ram`
  MODIFY `ramID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `storage`
--
ALTER TABLE `storage`
  MODIFY `storageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user_address`
--
ALTER TABLE `user_address`
  MODIFY `addressID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`prodcatID`) REFERENCES `category` (`prodcatID`),
  ADD CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`infoID`) REFERENCES `order_info` (`infoID`);

--
-- Các ràng buộc cho bảng `order_info`
--
ALTER TABLE `order_info`
  ADD CONSTRAINT `order_info_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

--
-- Các ràng buộc cho bảng `product_entry`
--
ALTER TABLE `product_entry`
  ADD CONSTRAINT `product_entry_ibfk_2` FOREIGN KEY (`colorID`) REFERENCES `color` (`colorID`),
  ADD CONSTRAINT `product_entry_ibfk_3` FOREIGN KEY (`storageID`) REFERENCES `storage` (`storageID`),
  ADD CONSTRAINT `product_entry_ibfk_4` FOREIGN KEY (`prodID`) REFERENCES `product` (`prodID`);

--
-- Các ràng buộc cho bảng `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
