-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 24, 2022 lúc 04:01 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thebotterhouse`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Whiskey'),
(2, 'Champion'),
(3, 'Soju'),
(4, 'Volka'),
(5, 'Barrel Picks'),
(6, 'Celebrity Spirits');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `detail` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `view` int(11) NOT NULL,
  `hot` tinyint(4) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `image`, `quantity`, `detail`, `date`, `view`, `hot`, `cat_id`) VALUES
(1, 'Bainbridge Battle Point Organic Wheat Whiskey 750ml', 290000, 'https://cdn.shopify.com/s/files/1/0313/6228/5699/products/Buy_Willet_4_Year_Rye_Online_720x_3695f88d-9c6e-4caa-8c65-aefff4be9403_medium.jpg?v=1597507256', 100, 'A single-grain whiskey, fermented on estate-grown soft white wheat utilizing a unique combination of yeasts usually employed to make Irish and Scottish whiskies, double distilled and aged for 2 years in new, No.3 charred, ten gallon American white oak barrels.', '2022-02-23 03:42:48', 900, 1, 1),
(2, 'Bainbridge Cask Organic Wheat Whiskey 750ml', 250000, 'https://cdn.shopify.com/s/files/1/0313/6228/5699/products/image_5dbcb53b-3d4a-4525-b82e-06c7f3058c09_720x.png?v=1631379423', 100, 'Selected barrels of fully-matured and ready-to-bottle Battle Point Whiskey are transferred to casks that formerly held 10 year old XO rum on the eastern Caribbean island of Barbados.', '2022-02-23 03:44:21', 700, 1, 1),
(3, 'Absolut Vodka 750ml', 23000, 'https://cdn.shopify.com/s/files/1/0313/6228/5699/products/image_dae3a740-bfdb-4b9f-832f-1612abf80ae8_720x.jpg?v=1629249257', 100, 'Absolut Vodka is a Swedish vodka made exclusively from natural ingredients, and unlike some other vodkas, it doesn’t contain any added sugar. In fact Absolut is as clean as vodka can be. Still, it has a certain taste: Rich, full-bodied and complex, yet smooth and mellow with a distinct character of grain, followed by a hint of dried fruit.', '2022-02-23 03:44:21', 800, 1, 4),
(4, 'Absolut Mandrin Vodka 750ml', 900000, 'https://cdn.shopify.com/s/files/1/0313/6228/5699/products/ABSOLUT_CITRON_VODKA_750ML__91638.1553618834.1280.1280.jpg?v=1620677483', 100, 'Enjoy bright, summer sun, clear skies, and bold citrus flavors with Absolut Mandrin. Crafted in Ahus, Sweden, using fresh fruit, no added sugars, and locally sourced winter wheat with pure deep well water, Absolut Mandrin has all-natural ingredients.', '2022-02-23 03:45:45', 670, 1, 4),
(5, 'Belvedere Heritage 176 Vodka 750ml', 430000, 'https://cdn.shopify.com/s/files/1/0313/6228/5699/products/ABSOLUT_VODKA_750ML__16867.1553621218.1280.1280.jpg?v=1620677483', 100, 'Belvedere Heritage 176 is quite simply a taste of vodka\'s past. Up until the 19th century. Polish vodka makers relied on the old technique of \'malting\', using fire-kilns to liberate enzymes from the rye\'s starch - a tradition which also naturally revealed rich ad distinctive flavors. Over time, as the vodka category expanded and technology evolved, these traditions sadly faded out, and vodka became more associated with neutrality.', '2022-02-23 03:45:45', 490, 0, 4),
(6, 'Armand De Brignac Ace of Spades Blanc De Blanc 750ml', 290000, '//cdn.shopify.com/s/files/1/0313/6228/5699/products/image_a452af70-f0a5-4b8e-a41c-ebbed12ffdbc_1500x.jpg?v=1625855086', 100, 'Armand de Brignac Blanc de Blancs is pressed from an exclusive selection of white Chardonnay from famed Grand Cru villages including Cramant, Avize, and Oger.', '2022-02-23 03:46:57', 99, 0, 2),
(7, 'Armand De Brignac Ace of Spades Brut Gold 750ml', 200000, '//cdn.shopify.com/s/files/1/0313/6228/5699/products/ArmandBrut_1500x.jpg?v=1620677509', 100, 'The first release from Armand de Brignac, the Brut Gold remains the most iconic cuvée in the range. Rich with the old world traditions of champagne blending, it is a trio of vintages from some of the most lauded terroirs in the region, resulting in a prestige cuvée that expresses vibrant fresh fruit character, and layers of complexity.', '2022-02-23 03:48:47', 871, 0, 2),
(8, 'Knob Creek Single Barrel Select Barrel Pick 750ml', 440000, '//cdn.shopify.com/s/files/1/0313/6228/5699/products/KC_Straight_SBS_Bourbon_1927_HERO_V2_SITE_SHADOW_1500x.png?v=1640104642', 100, 'This Knob Creek® Single Barrel Experience, which is Selected By Fred Noe IV For \'Whiskey Revolution\' bourbon is bottled with a customized engraved plate. Store materials allow customers to discover the story of their bourbon -- from its exact age, to where in the warehouse it was stored. It is bottled at 120 proof to', '2022-02-23 03:47:44', 720, 0, 5);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
