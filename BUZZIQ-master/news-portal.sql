
-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2021 at 02:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news-portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(35) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(1, 'admin@admin.com', '$2y$10$b3GAX6.Pd6054RRQ8C9se.zfOhTljRkduBfAKWFrmtdKwj02aSTuq');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `article_title` varchar(250) NOT NULL,
  `article_image` varchar(200) NOT NULL,
  `article_description` text NOT NULL,
  `article_date` date NOT NULL,
  `article_trend` tinyint(4) NOT NULL,
  `article_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `category_id`, `author_id`, `article_title`, `article_image`, `article_description`, `article_date`, `article_trend`, `article_active`) VALUES
(1, 1, 3, 'BJP Secures Historic Victory in Delhi Assembly Elections', 
'BJP.png', 
'The Bharatiya Janata Party (BJP) has secured a resounding victory in the Delhi Assembly elections, marking a significant political shift in the capital. The results, announced late last night, saw BJP winning 45 out of 70 seats, dethroning the incumbent Aam Aadmi Party (AAP), which had dominated Delhi politics for over a decade. 
The election campaign was fiercely contested, with BJP emphasizing its governance at the national level, development initiatives, and a strong stance on law and order. The party’s manifesto focused on infrastructure improvements, women’s safety, and economic reforms to boost Delhi’s urban economy. Prime Minister Narendra Modi and Home Minister Amit Shah played a crucial role in campaigning, addressing massive rallies across various constituencies. 
One of the key reasons attributed to BJP’s victory is its ability to consolidate votes across various demographics. The party saw significant support from middle-class voters, traders, and first-time voters who favored BJP’s economic policies and nationalism-driven campaign. 
AAP, which had previously won two consecutive terms with a massive majority, struggled to retain its support base. Political analysts suggest that dissatisfaction over local governance issues, water and electricity supply problems, and alleged mismanagement of municipal funds contributed to AAP’s downfall. Additionally, controversies surrounding its leadership and internal rifts weakened its campaign in the final phases of the election. 
The Congress party, which once held power in Delhi for over 15 years, continued its decline, failing to secure even a single seat in the elections. Many Congress loyalists either shifted to BJP or chose to abstain, further denting the party’s electoral prospects. 
Following the results, Delhi BJP President Manoj Tiwari hailed the victory as a “triumph of nationalism and development.” In his victory speech, he emphasized the party’s commitment to transforming Delhi into a global city with modern infrastructure, better civic amenities, and a robust healthcare system. 
Prime Minister Narendra Modi took to Twitter to congratulate the people of Delhi, stating, "This historic win is a testament to the faith people have in BJP’s vision for a developed and prosperous India. We will work tirelessly to ensure Delhi achieves new heights." 
AAP leader and outgoing Chief Minister Arvind Kejriwal accepted defeat, congratulating BJP and stating that his party would work as a strong opposition to ensure accountability. He also hinted at a major restructuring within the party to regain lost ground in future elections. 
Security across Delhi was heightened post-results, with celebratory rallies held by BJP supporters. The Delhi Police ensured smooth law and order, preventing any untoward incidents. Political experts believe this victory could have significant implications for the upcoming general elections, boosting BJP’s momentum nationally. 
Looking ahead, BJP has promised to implement its manifesto commitments swiftly. Key projects include the redevelopment of unauthorized colonies, expansion of metro services, and stricter pollution control measures. The new government is expected to take oath next week, with discussions underway regarding the next Chief Minister, as BJP had not announced a CM face before the elections. 
As Delhi transitions to new leadership, all eyes will be on BJP’s governance approach and how effectively it fulfills its promises in the coming years.', 
NOW(), 1, 1),

(5, 2, 1, 'Budget 2025: New Income Tax Slabs Announced, Big Relief for Middle Class', 'TAX.png', 
'Budget 2025: PM Modi Says Tax Rebate Will Benefit Middle Class  

In a major announcement, Finance Minister Nirmala Sitharaman has unveiled new income tax slabs under the Union Budget 2025, bringing significant relief to salaried taxpayers. The finance minister declared that under the new tax regime, there will be zero income tax up to an annual income of ₹12 Lakh, a move aimed at boosting household savings and investments.  

 Revised Income Tax Slabs (New Regime)
- ₹0 to ₹4 lakh: Nil  
- ₹4 to ₹8 lakh: 5%  
- ₹8 to ₹12 lakh: 10%  
- ₹12 to ₹16 lakh: 15%  
- ₹16 to ₹20 lakh: 20%  
- ₹20 to ₹24 lakh: 25%  

 Key Announcements
1. Higher Tax Rebates: The revised slabs ensure more disposable income, especially for the middle class, boosting domestic consumption.  
2. Choice Between Tax Regimes: Salaried individuals can continue to choose between the old tax regime (which allows exemptions on housing and insurance) and the new tax regime (which offers lower rates but fewer deductions).  
3. Default Regime for Businesses: From FY 2023-24, the new tax regime was set as the default for taxpayers with income from business or profession.  

 Impact of the New Tax Slabs
This tax revision is expected to reduce the financial burden on middle-class families, promote savings, and drive consumer spending. Economic analysts suggest that the move will stimulate growth and help achieve the government’s vision of a stronger and self-reliant economy.  

Additionally, FM Sitharaman announced that the government will introduce a new Income Tax (I-T) bill in Parliament next week, signaling further tax reforms in the future.  

With these changes, Budget 2025 aims to make taxation more simplified and taxpayer-friendly, ensuring sustainable economic growth.', 
'2025-02-22', 1, 1),

(103, 8, 1, 'Budget 2025: Major Boost to Healthcare Sector, ₹1.5 Lakh Crore Allocated', 'health.png', 
'Union Budget 2025: Healthcare Sector Gets a Record ₹1.5 Lakh Crore Allocation  

In a significant push for public health infrastructure, Finance Minister Nirmala Sitharaman has announced a ₹1.5 lakh crore allocation for the healthcare sector in the Union Budget 2025. The move aims to strengthen medical services, promote digital healthcare, and improve accessibility to quality treatment across India.  

 Key Healthcare Announcements
1. New AIIMS and Medical Colleges  
   - The government has approved the establishment of five new AIIMS hospitals across different states to enhance tertiary care.  
   - 50 new medical colleges will be set up to address the shortage of healthcare professionals.  

2. Affordable Healthcare & Insurance Expansion  
   - The Ayushman Bharat scheme will now cover senior citizens above 60 years of age with free medical check-ups.  
   - The insurance coverage under PM-JAY (Pradhan Mantri Jan Arogya Yojana) has been increased to ₹7 lakh per family per year.  

3. Strengthening Rural Healthcare  
   - ₹30,000 crore allocated to upgrade Primary Health Centers (PHCs) in rural and semi-urban areas.  
   - New mobile health units will be deployed in remote areas to ensure last-mile medical access.  

4. Digital Health Mission  
   - Investment in AI-driven diagnostic tools and expansion of the National Digital Health Mission (NDHM) to connect patients with doctors via telemedicine.  
   - E-health records will be introduced to improve efficiency in medical treatments.  

5. Focus on Preventive Healthcare  
   - ₹10,000 crore dedicated to vaccination programs, including research for new COVID-19 and flu vaccines.  
   - Awareness campaigns on mental health, lifestyle diseases, and nutrition will be expanded under the Fit India Movement.  

 Impact on Healthcare Sector
The budget reflects a strong commitment to universal healthcare, ensuring improved medical facilities for all. Experts believe that increased funding in digital healthcare and rural medical services will make quality treatment accessible to millions.  

With these reforms, India is set to move closer to achieving universal health coverage, making medical care more affordable and efficient for every citizen.', 
'2025-02-22', 1, 1),

(6, 4, 2, 'Government Launches AI-Powered Learning Platform for Students', 'education.png', 
'India Introduces AI-Based Learning Platform to Revolutionize Education  

In a landmark move, the Indian government has launched a new AI-powered learning platform to provide personalized education to students across the country. This initiative aims to bridge the learning gap and enhance digital education accessibility, especially for students in rural areas.  

 Key Features of the AI Learning Platform
1. Personalized Learning Paths  
   - The platform will analyze students’ learning patterns and provide customized study materials.  
   - AI-powered tutors will offer real-time feedback to help students improve their weak areas.  

2. Multilingual Support  
   - Courses will be available in 10+ regional languages, ensuring students from all parts of India can access quality education.  

3. Integration with National Curriculum  
   - The content will be aligned with CBSE, ICSE, and state board syllabi, allowing students to prepare for their exams efficiently.  

4. Live Interactive Sessions  
   - Virtual classrooms with top educators and industry experts will be available for live doubt-solving.  

5. Skill-Based Learning  
   - Apart from academics, the platform will offer courses in coding, AI, robotics, financial literacy, and entrepreneurship to prepare students for future careers.  

 Impact on Indian Education  
Experts believe that this initiative will transform education by making learning more engaging, efficient, and accessible. With AI-driven education, India moves one step closer to bridging the digital divide and empowering millions of students.  

The AI-powered learning platform is set to launch next month, with free access for the first six months to encourage adoption. This marks a new era in digital education in India!', 
'2025-02-22', 1, 1),





(2, 2, 1, 'DeepSeek: Pioneering Open-Source AI Innovations', 'Deepseek.png', 'DeepSeek, a Chinese artificial intelligence company founded in July 2023, has rapidly emerged as a formidable player in the AI industry. Based in Hangzhou, Zhejiang, and owned by the Chinese hedge fund High-Flyer, DeepSeek has distinguished itself through its commitment to open-source AI development and cost-effective training methodologies. Under the leadership of CEO Liang Wenfeng, who also co-founded High-Flyer, the company has introduced a series of large language models (LLMs) that have garnered significant attention globally. In January 2025, DeepSeek unveiled its eponymous chatbot alongside the DeepSeek-R1 model. Released under the MIT License, DeepSeek-R1 offers responses comparable to leading LLMs such as OpenAI\'s GPT-4o. Notably, the training cost for DeepSeek-R1 was substantially lower than that of its counterparts, positioning it as a disruptive force in the AI landscape. The company claims that its V3 model was trained for approximately $6 million, a fraction of the estimated $100 million expenditure for OpenAI\'s GPT-4 in 2023. This cost efficiency is partly attributed to DeepSeek\'s innovative training techniques and the strategic utilization of available computational resources. In May 2024, DeepSeek expanded its portfolio with the release of the DeepSeek-V2 series, comprising two base models and two chatbots. These models were pretrained on a diverse dataset of 8.1 trillion tokens, with a slight emphasis on Chinese tokens over English ones. A significant advancement in this series was the extension of context length from 4,000 to 128,000 tokens, achieved through the implementation of the YaRN architecture. This enhancement enables the models to process and generate more extensive and coherent outputs, catering to complex tasks across various domains. DeepSeek\'s commitment to open-source principles is evident in its decision to make its AI model code publicly accessible. In February 2025, the company announced plans to release five code repositories, reinforcing its support for collaborative AI development. This move stands in contrast to the prevailing trend among AI firms in China and the U.S., which often favor closed-source models. Founder Liang Wenfeng emphasized the cultural significance of open source, stating that it garners respect and fosters innovation within the global AI community. The company\'s success has been described as "upending AI," challenging larger and more established rivals. DeepSeek\'s models are characterized as "open weight," offering a level of accessibility that encourages modification and improvement by the broader AI research community. This approach has facilitated rapid advancements and positioned DeepSeek as a leader in AI innovation. Despite its achievements, DeepSeek operates with a lean team of under 200 employees. The company actively recruits AI researchers from top Chinese universities and seeks talent beyond the traditional computer science field to diversify its models\' knowledge and capabilities. This strategy has enriched the company\'s expertise and contributed to the development of robust and versatile AI models. The low cost of training and operating these language models is also attributed to Chinese firms\' limited access to Nvidia chipsets, a consequence of trade restrictions imposed by the U.S. This constraint has prompted DeepSeek to explore alternative solutions, leading to the development of efficient training methodologies that do not rely on high-end hardware. In December 2024, DeepSeek released the DeepSeek-V3 model, specifically designed for tasks in mathematics, coding, and the Chinese language. This model aims to compete with leading products like GPT-4o, further solidifying DeepSeek\'s position in the AI sector. The company\'s trajectory indicates a steadfast commitment to advancing AI technology while promoting accessibility and collaboration through open-source initiatives.', '2025-02-22', 0, 1),


(3, 6, 1, 'India\'s Cricket Dominance: Financial Power and the Quest for Trophies', 'article-6-1619443722.webp', 'India has long been a powerhouse in the world of cricket, boasting unparalleled financial resources and a fervent fan base that spans the globe. The Indian Premier League (IPL), a testament to the country\'s cricketing influence, has revolutionized the sport with its lucrative contracts and high-octane entertainment. However, despite this off-field supremacy, questions linger about India\'s ability to consistently translate financial might into on-field success, particularly in major international tournaments. In recent years, India has showcased commendable performances across formats, yet the coveted trophies have often eluded them. The 2023 World Test Championship saw India reaching the finals, only to fall short against a resilient Australian side. Similarly, in the 2024 ICC T20 World Cup, despite being favorites, the team faced a heartbreaking semi-final exit against a spirited New Zealand team. These outcomes have sparked debates among cricket enthusiasts and analysts: Is financial dominance enough to secure global titles? The Board of Control for Cricket in India (BCCI), under the leadership of influential figures like Jay Shah, has been instrumental in shaping global cricket policies. Their strategic decisions, from scheduling lucrative bilateral series to influencing ICC events, underscore India\'s clout in the cricketing fraternity. The upcoming decade presents a plethora of opportunities for India to assert its dominance on the field. The nation is set to host the 2025 ICC Champions Trophy, bringing the prestigious tournament back to its soil after nearly a decade. This event not only offers a chance for redemption but also serves as a platform to showcase India\'s organizational prowess. Moreover, discussions are underway to include cricket in the 2028 Los Angeles Olympics, a move that could further globalize the sport and provide India with another avenue to clinch a historic gold. Financially, the IPL continues to soar, with franchises expanding their brand value and attracting global talents. Investments are pouring into grassroots development, aiming to unearth the next generation of cricketing superstars. The Women\'s Premier League (WPL) has also been launched, highlighting the BCCI\'s commitment to promoting women\'s cricket and broadening the sport\'s appeal. Yet, with great power comes great responsibility. The Indian team faces immense pressure to deliver on the big stage. Critics argue that while bilateral series victories are commendable, the true measure of success lies in securing ICC trophies. The team\'s management and coaching staff are continually strategizing to find the right balance between nurturing young talents and leveraging the experience of seasoned players. In conclusion, while India\'s financial empire in cricket is unparalleled, the ultimate validation lies in on-field achievements. The convergence of robust infrastructure, strategic leadership, and a pool of talented players positions India favorably. The cricketing world watches with bated breath: Can India\'s cricketing juggernaut transform its financial supremacy into a legacy of global titles?', '2025-02-22', 1, 1),


(4, 3, 3, 'What is DASH diet? How does it also help weight loss apart from controlling BP?', 'article-8-1616665698.jpg', 'All of us have, for the many years last, heard about a number of diets. There was the Atkins diet, the Mediterranean diet, the Ketogenic diet, the Vegan diet, the Raw food diet, the Doctor Dikshit Diet, the Intermittent Fasting diet and oh so many diets. \r\n\r\nThere are literally thousands of diet types and plans. Some people \'diet\' to lose weight, while others for gaining weight, lowering cholesterol, for detox, to live a long and healthful life, and many other reasons.\r\n\r\nA diet is a fixed plan of eating and drinking where the type and amount of food are planned out with a purpose.\r\n\r\nThe DASH diet is very popular at the moment. DASH stands for \"Dietary Approaches to Stop Hypertension\". According to the American National Heart, Lung, and Blood Institute - the NIH-supported DASH diet has topped the rankings for “heart-healthy” and “healthy eating”. And since it emphasizes eating whole foods that are naturally low in unhealthy fats and added sugars, as well as moderate portions, it may also lead to weight loss.\r\n\r\nAccording to the Harvard TH Chan School of Medicine, DASH was first introduced at a meeting of the American Heart Association in 1996 and later published in the New England Journal of Medicine in 1997. \r\nThe DASH Discovery through a study:\r\n\r\nThe DASH trial randomly assigned 456 people to different diets to test the effects of dietary patterns on lowering blood pressure. The authors surmised that eating a diet with many different foods with blood-pressure-lowering nutrients would show a greater effect on blood pressure than eating single nutrients, such as found in supplements or in a limited diet. \r\nThree diets were tested: \r\n\r\n    A control diet, or a standard American diet, \r\n    A fruits and vegetable diet, similar to the control diet but providing more fruits and vegetables and fewer snacks and sweets, and \r\n    A combination diet rich in fruits, vegetables, nuts, and low-fat dairy foods with reduced amounts of saturated fat, total fat, and cholesterol. \r\n\r\nThe last two diets were richer in nutrients associated with lower blood pressure, such as potassium, magnesium, calcium, fiber, and protein. All three diets provided about 3000 mg sodium, which is more than the recommended amount from the Dietary Guidelines for Americans but less than the average sodium intake for Americans.\r\n\r\nDespite no weight changes, the combination diet reduced hypertension more than the other two diets. Those with hypertension showed greater decreases in blood pressure than those without hypertension. The reduction of blood pressure in the DASH combination diet was comparable to that of people on medication for stage 1 hypertension.\r\n\r\nThe results of this landmark study contributed much of the scientific basis for the Dietary Guidelines for Americans 2010 and later editions. This diet is now widely acclaimed as a flexible and balanced eating plan that helps create a heart-healthy eating style for life.', '2025-02-25', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(35) NOT NULL,
  `author_password` varchar(100) NOT NULL,
  `author_email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `author_password`, `author_email`) VALUES
(1, 'Suyash U', '$2y$10$xDw4C1y58k8kafvdzKo6WO/XglvO9jeJV7evQTxfOSxJ8DybuXDFW', 'suyash@suyash.com'),
(2, 'U Anish', '$2y$10$gD8OeQmEZBbQFnO2CCpoBeot5X2/D76qV/ej5q1yyXkCmTilG6LHy', 'anish@anish.com'),
(3, 'Varshini Senthil', '$2y$10$yfqAfNTZiiGgStBU9089rOysv0n35bqk9t.M/tjC/H2ahfmPedoyS', 'vari@vari.com'),
(4, 'Nivethitha V S', '$2y$10$ETC53l2u7pyzCfbwsQMzcOzvVln2gEimQOIG7wVgM/vw.ouCb0FM.', 'nivi@nivi.com');

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`bookmark_id`, `user_id`, `article_id`) VALUES
(24, 1, 2),
(25, 4, 5),
(26, 2, 1),
(27, 1, 3);


-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_color` varchar(35) NOT NULL,
  `category_image` varchar(250) NOT NULL,
  `category_description` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_color`, `category_image`, `category_description`) VALUES
(1, 'Politics', 'tag-brown', 'Politics1616565135.jpg', 'Get a grip of the intriguing situation of Indian politics and where exactly our country is going under the leadership of our current leaders.'),
(2, 'Technology', 'tag-orange', 'Technology1616565177.jpg', 'The world is changing rapidly due to advancements in technology. Stay updated with the latest innovations shaping the future.'),
(3, 'Food', 'tag-purple', 'Food1616565209.jpg', 'Take a tour around the world’s culinary delights. Experience the flavors, aromas, and traditions of different cuisines.'),
(4, 'Education', 'tag-yellow', 'Education1616565234.jpg', 'Education is key to survival in this competitive world. Stay informed about the latest trends, policies, and advancements in learning.'),
(5, 'Business', 'tag-pink', 'Business1620564308.jpg', 'Markets rise and fall like a roller coaster. Stay informed on global trade, booming businesses, and small-scale entrepreneurs making a difference.'),
(6, 'Sports', 'tag-purple', 'Sports1616565300.jpg', 'From last-minute goals to game-winning sixes, sports keep us on the edge of our seats. Get the latest updates on tournaments, leagues, and teams.'),
(7, 'Entertainment', 'tag-orange', 'Entertainment1620564450.jpg', 'ROLL. CAMERA. ACTION. Catch the latest buzz in the entertainment industry, from celebrity updates to new movie releases.'),
(8, 'Health', 'tag-yellow', 'Health1616565475.jpg', 'Your health is your greatest asset. Stay informed on medical advancements, wellness trends, and crucial health updates.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(35) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'Anish U ', 'anish@anish.com', '$2y$10$gD8OeQmEZBbQFnO2CCpoBeot5X2/D76qV/ej5q1yyXkCmTilG6LHy'),
(2, 'Jaishri S K', 'jai@jai.com', '$2y$10$CIVnTItR2cIxuLm4/zGjuOIfsh/Dqs/zaKOJ2ST4dIk0YrJF/Cam6'),
(4, 'Suyash U', 'suyash@suyash.com', '$2y$10$xDw4C1y58k8kafvdzKo6WO/XglvO9jeJV7evQTxfOSxJ8DybuXDFW'),
(5, 'Varshini Senthil', 'vari@vari.com', '$2y$10$yfqAfNTZiiGgStBU9089rOysv0n35bqk9t.M/tjC/H2ahfmPedoyS'),
(6, 'Nivethitha V S', 'nivi@nivi.com', '$2y$10$ETC53l2u7pyzCfbwsQMzcOzvVln2gEimQOIG7wVgM/vw.ouCb0FM.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`bookmark_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
