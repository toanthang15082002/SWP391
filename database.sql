-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: flm_web
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `roleID` int DEFAULT '1',
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gender` int DEFAULT '-1',
  `typeAccount` int DEFAULT '-1',
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_account_role` (`roleID`),
  CONSTRAINT `fk_account_role` FOREIGN KEY (`roleID`) REFERENCES `roles` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Huy',2,'huy211002','img/Avatar/HuyAvar.jpg','Huy','Đỗ Quốc','2002-10-21','dohuycg@gmail.com','0363043454','Hải Dương',1,-1),(4,'Linh',2,'huy211002','img/Avatar/linhAvar.jpg','Linh','Bùi Xuân','2002-09-07','Linh@gmail.com','1223455','Thái Bình',1,-1),(5,'thang',1,'thang123','img/Avatar/HuyAvar.jpg','Thắng','Nguyễn Toàn ','2002-10-21','Thang@gmail.com','019290138','Hạ Long',-1,-1),(8,'LinhReview',6,'huy211002','img/Avatar/linhbx.jpg','LinhReview','Bx','2002-09-07','Linhbx79@gmail.com','1223455','Thái Bình',1,-1),(10,'syllabusStaff',7,'huy211002','img/Avatar/linhbx.jpg','LinhStaff','Bx','2002-09-07','Linhbx719@gmail.com','1223455','Thái Bình',1,-1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessment`
--

DROP TABLE IF EXISTS `assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assessment` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `syllabusID` int NOT NULL,
  `categoti` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `type` bit(1) DEFAULT b'0',
  `part` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `completionCriteria` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `duration` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `clo` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `questionType` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `noQuestion` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `knowAndskill` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gradingGuide` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `fk_Assessment_syllabus` (`syllabusID`),
  CONSTRAINT `fk_Assessment_syllabus` FOREIGN KEY (`syllabusID`) REFERENCES `syllabus` (`syllabusID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessment`
--

LOCK TABLES `assessment` WRITE;
/*!40000 ALTER TABLE `assessment` DISABLE KEYS */;
INSERT INTO `assessment` VALUES (5,1,'On-going Assessment 1',_binary '',1,20,'>0','Option 1: 45\'/team;<br> Option 2 (For Constructivism Approach only): Follow lecturers proposal','LO1, LO2, LO3, LO4, LO5','Option 1: N/A; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','Option 1: Project Presentation; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','Requirement Analysing Designing Coding Testing Integrating','Main evaluating items:<br>- Submitted materials: SRS, SDS, Codes, Tasks/Issues Log<br>- LOC Evaluation: evaluate based on the complexity & quality of the screens/functions','To get the maximum LOC Evaluation, each student need to have 180 LOC as the rated LOC'),(6,1,'On-going Assessment 2',_binary '',1,20,'>0','Option 1: 45\'/team; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','LO1, LO2, LO3, LO4, LO5','Option 1: N/A; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','Option 1: Project Presentation; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','Requirement Analysing Designing Coding Testing Integrating','Main evaluating items:<br>- Submitted materials: SRS, SDS, Codes, Tasks/Issues Log<br>- LOC Evaluation: evaluate based on the complexity & quality of the screens/functions','To get the maximum LOC Evaluation, each student need to have 180 LOC as the rated LOC'),(7,1,'On-going Assessment 3',_binary '',1,20,'>0','Option 1: 45\'/team; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','LO1, LO2, LO3, LO4, LO5','Option 1: N/A; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','Option 1: Project Presentation; Option 2 (For Constructivism Approach only): Follow lecturer\'s proposal','Requirement Analysing Designing Coding Testing Integrating','Main evaluating items:<br>- Submitted materials: SRS, SDS, Codes, Tasks/Issues Log<br>- LOC Evaluation: evaluate based on the complexity & quality of the screens/functions','To get the maximum LOC Evaluation, each student need to have 180 LOC as the rated LOC'),(8,1,'Final Project Presentation:',_binary '\0',1,40,'>0','45\'/each','LO1, LO2, LO3, LO4, LO5','','Project Presentation','Requirement Analysing Designing Coding Testing Integrating','Main evaluating items:<br>- Submitted materials: SRS, SDS, Codes, Tasks/Issues Log<br>- LOC Evaluation: evaluate based on the complexity & quality of the screens/functions','To get the maximum LOC Evaluation, each student need to have 720 LOC as the rated LOC');
/*!40000 ALTER TABLE `assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `curid` int NOT NULL,
  `cName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `fk_Combo_curriculum` (`curid`),
  CONSTRAINT `fk_Combo_curriculum` FOREIGN KEY (`curid`) REFERENCES `curriculum` (`curid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo`
--

LOCK TABLES `combo` WRITE;
/*!40000 ALTER TABLE `combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combo_subject`
--

DROP TABLE IF EXISTS `combo_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_subject` (
  `cid` int NOT NULL,
  `subjectCode` varchar(150) NOT NULL,
  `semester` varchar(50) NOT NULL,
  PRIMARY KEY (`cid`,`subjectCode`),
  KEY `fk_Combo_Subject_subject` (`subjectCode`),
  CONSTRAINT `fk_Combo_Subject_combo` FOREIGN KEY (`cid`) REFERENCES `combo` (`cid`),
  CONSTRAINT `fk_Combo_Subject_subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combo_subject`
--

LOCK TABLES `combo_subject` WRITE;
/*!40000 ALTER TABLE `combo_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `combo_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentID` int NOT NULL AUTO_INCREMENT,
  `syllabusID` int DEFAULT NULL,
  `curriculumID` int DEFAULT NULL,
  `accountID` int NOT NULL,
  `comment` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_Review_syllabus` (`syllabusID`),
  KEY `fk_Comment_curriculum` (`curriculumID`),
  KEY `fk_Comment_account` (`accountID`),
  CONSTRAINT `fk_Comment_account` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `fk_Comment_curriculum` FOREIGN KEY (`curriculumID`) REFERENCES `curriculum` (`curid`),
  CONSTRAINT `fk_Comment_syllabus` FOREIGN KEY (`syllabusID`) REFERENCES `syllabus` (`syllabusID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,NULL,8,'It is a long established fact that a reader will be distracted by the readable content of a page.','2023-02-28'),(2,2,NULL,8,'qweqeqwe','2023-02-28'),(3,1,NULL,4,'123456789qweqweqeq','2023-02-28'),(4,NULL,1,4,'thieu nhieu lam day','2023-02-23'),(5,NULL,1,4,'lam tiep di nha','2023-02-24'),(6,1,NULL,8,'test','2023-03-01'),(7,1,NULL,8,'test','2023-03-05'),(8,1,NULL,8,'testthu ins','2023-03-05'),(9,NULL,NULL,8,'asdadasdasd','2023-03-05'),(10,1,NULL,8,'123tesstasdad      ','2023-03-05'),(11,NULL,1,8,'123test     ','2023-03-05'),(12,1,NULL,8,'tesst','2023-03-05'),(13,NULL,1,8,'123 test cuoi','2023-03-05'),(14,1,NULL,8,'1231asdadsada','2023-03-05'),(15,1,NULL,8,'asdasdyiuqeqwead','2023-03-05'),(16,1,NULL,8,'','2023-03-10'),(17,1,NULL,8,'12345linhbx','2023-03-10'),(18,1,NULL,8,'demo review','2023-03-10'),(19,1,NULL,8,'demo review','2023-03-10'),(20,NULL,1,1,'okela','2023-03-13'),(21,1,NULL,8,'qweqweasd','2023-03-13');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `curid` int NOT NULL AUTO_INCREMENT,
  `curCode` varchar(150) NOT NULL,
  `curName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `decisionNo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isapprove` bit(1) NOT NULL,
  `isactive` bit(1) NOT NULL,
  `incharge` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`curid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (1,'BIT_SE_K16B','Bachelor Program of Information Technology, Software Engineering Major (Chương trình cử nhân ngành CNTT, chuyên ngành Kỹ thuật phần mềm)','1. Training Objectives<br>\r\n1.1 General objective:<br>\r\nTraining Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialty as well as pursue further education and research.<br>\r\nThe training program aims to:<br>\r\na) To equip students with fundamental knowledge of mathematics and the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialty ;<br>\r\nb) Train students the necessary virtues and skills in the professional working environment, know how to apply specialized knowledge of SE specialty into practical work<br>\r\nc) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life<br>\r\n1.2 Specific objectives:<br>\r\nGraduates of the IT training program/SE specialty must demonstrate the following:<br>\r\nPO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry & in-depth knowledge of the specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br>\r\nPO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; understand state policies in specialized fields.<br>\r\nPO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br>\r\nPO4. Can use English well in study and work and a second foreign language in normal communication.<br>\r\nPO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in the context of corporation and society.<br>\r\n\r\n1.3. Job positions after graduation:<br>\r\nGraduates of Software Engineering can choose for themselves the following jobs:<br>\r\n✔ Application development programmers<br>\r\n✔ Business analysts<br>\r\n✔ Software quality assurance engineers<br>\r\n✔ Software process engineers<br>\r\n✔ Software project administrators<br>\r\n\r\n2. Program Learning Outcomes<br>\r\n\r\n3. Volume of learning of the course: 145 credits, excluding Preparation English, Military Training, compulsory and elective training activities.<br>\r\n\r\n4. Enrollment object<br>\r\n✔ In accordance with regulations on formal university enrollment; college enrollment of the Ministry of Education and Training.<br>\r\n✔ In accordance with regulations on enrollment of FPT university.<br>\r\n\r\n5. Training process, graduating conditions<br>\r\n✔ In accordance with regulations on formal university and college training of the Ministry of Education and Training.<br>\r\n✔ In accordance with regulations on training of FPT University.<br>\r\n\r\n6. Evaluation method<br>\r\n✔ In accordance with regulations on examination and assessment in the training regulations of FPT University.<br>\r\n\r\n1. Mục tiêu đào tạo<br>\r\n1.1 Mục tiêu chung:<br>\r\nĐào tạo kỹ sư ngành Công nghệ thông tin (CNTT)/chuyên ngành Kỹ thuật phần mềm (KTPM) có nhân cách và năng lực đáp ứng nhu cầu thực tế của xã hội, nắm vững kiến thức chuyên môn và thực hành, có khả năng tổ chức, thực hiện và phát huy sáng tạo trong các công việc liên quan đến các chuyên ngành được đào tạo.<br>\r\nChương trình đào tạo nhằm:<br>\r\na) Trang bị cho sinh viên kiến thức cơ bản của ngành CNTT cùng các phương pháp luận, công nghệ nền tảng và chuyên sâu của chuyên ngành;<br>\r\nb) Rèn luyện cho sinh viên những đức tính, kỹ năng cần thiết qua môi trường làm việc chuyên nghiệp, biết vận dụng các kiến thức ngành CNTT và các kiến thức chuyên ngành vào công việc thực tế;<br>\r\nc) Cung cấp cho sinh viên một nền tảng vững chắc về ngoại ngữ, khoa học, văn hóa, xã hội, phát huy tính chủ động, sáng tạo trong học tập, công việc và cuộc sống.<br>\r\n1.2 Mục tiêu cụ thể:<br>\r\nSinh viên tốt nghiệp chương trình đào tạo phải thể hiện được những điều sau đây:<br>\r\nPO1. Có kiến thức cơ bản về khoa học xã hội, chính trị pháp luật, an ninh quốc phòng, kiến thức nền tảng của ngành CNTT & kiến thức chuyên sâu của chuyên ngành được đào tạo: kỹ thuật, phương pháp, công nghệ, các lĩnh vực ứng dụng chuyên sâu; xu hướng phát triển trên thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của các ngành nghề thuộc chuyên ngành được đào tạo.<br>\r\nPO2. Có thể làm việc được như một thành viên chính thức trong nhóm chuyên môn thuộc chuyên ngành được đào tạo: tham gia thiết kế, lựa chọn kỹ thuật và công nghệ phù hợp với xu hướng phát triển, giải quyết các vấn đề kỹ thuật; nắm được xu hướng công nghệ và yêu cầu người dùng; có thể làm kế hoạch phát triển hoàn thiện giải pháp; quản lý thực hiện và quản lý thay đổi trong phần công việc của mình; hiểu được các chính sách nhà nước về lĩnh vực chuyên ngành.<br>\r\nPO3. Thành thạo được các kỹ năng nghề nghiệp và các kỹ năng mềm của công dân thế kỷ 21 (kỹ năng tư duy, kỹ năng làm việc, kỹ năng sử dụng các công cụ làm việc, kỹ năng sống trong xã hội toàn cầu);<br>\r\nPO4. Sử dụng được tốt tiếng Anh trong học tập và công việc và một ngoại ngữ thứ hai trong giao tiếp thông thường.<br>\r\nPO5. Trung thực, kỷ luật cao trong học tập và công việc, biết làm việc nhóm một cách hiệu quả; biết ứng xử văn hóa trong công việc và xã hội; năng động, sáng tạo và có ý chí học tập không ngừng. Thể hiện thái độ và hành vi chuyên nghiệp với năng lực hình thành ý tưởng, thiết kế, thực hiện và vận hành hệ thống trong bối cảnh doanh nghiệp và xã hội.<br>\r\n\r\n1.3. Vị trí việc làm sau khi tốt nghiệp:<br>\r\nSinh viên tốt nghiệp chuyên ngành Kỹ thuật phần mềm có thể lựa chọn cho mình những công việc như:<br>\r\n✔ Lập trình viên phát triển ứng dụng<br>\r\n✔ Chuyên viên phân tích nghiệp vụ<br>\r\n✔ Kỹ sư đảm bảo chất lượng phần mềm<br>\r\n✔ Kỹ sư quy trình sản xuất phần mềm<br>\r\n✔ Quản trị viên dự án phần mềm<br>\r\n\r\n2. Chuẩn đầu ra<br>\r\n\r\n3. Khối lượng kiến thức toàn khóa<br>\r\n\r\n4. Đối tượng tuyển sinh<br>\r\n✔ Theo quy chế tuyển sinh đại học, cao đẳng hệ chính quy của Bộ Giáo dục và Đào tạo.<br>\r\n✔ Theo quy chế tuyển sinh của trường Đại học FPT.<br>\r\n\r\n5. Quy trình đào tạo, điều kiện tốt nghiệp<br>\r\n✔ Thực hiện theo quy chế đào tạo đại học, cao đẳng hệ chính quy của Bộ Giáo dục và Đào tạo.<br>\r\n✔ Theo quy chế đào tạo của trường Đại học FPT.<br>\r\n\r\n6. Cách thức đánh giá<br>\r\n✔ Theo quy định về kiểm tra và đánh giá học phần trong quy chế đào tạo của trường Đại học FPT.','1095/QĐ-ĐHFPT dated 11/28/2022',_binary '',_binary '','thang'),(2,'test','test','','test',_binary '\0',_binary '','thang'),(3,'K16','SE-software','kdsjvk asdfkj d josjf   fds ','tetst',_binary '\0',_binary '',''),(4,'K18','EL','tiếng anh','',_binary '\0',_binary '',''),(5,'K17','Bachelor Program of Information Technology, Software Engineering Major (Chương trình cử nhân ngành CNTT, chuyên ngành Kỹ thuật phần mềm)','1. Training Objectives<br>\r\n1.1 General objective:<br>\r\nTraining Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialty as well as pursue further education and research.<br>\r\nThe training program aims to:<br>\r\na) To equip students with fundamental knowledge of mathematics and the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialty ;<br>\r\nb) Train students the necessary virtues and skills in the professional working environment, know how to apply specialized knowledge of SE specialty into practical work<br>\r\nc) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life<br>\r\n1.2 Specific objectives:<br>\r\nGraduates of the IT training program/SE specialty must demonstrate the following:<br>\r\nPO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry & in-depth knowledge of the specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br>\r\nPO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; understand state policies in specialized fields.<br>\r\nPO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br>\r\nPO4. Can use English well in study and work and a second foreign language in normal communication.<br>\r\nPO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in the context of corporation and society.<br>\r\n\r\n1.3. Job positions after graduation:<br>\r\nGraduates of Software Engineering can choose for themselves the following jobs:<br>\r\n✔ Application development programmers<br>\r\n✔ Business analysts<br>\r\n✔ Software quality assurance engineers<br>\r\n✔ Software process engineers<br>\r\n✔ Software project administrators<br>\r\n\r\n2. Program Learning Outcomes<br>\r\n\r\n3. Volume of learning of the course: 145 credits, excluding Preparation English, Military Training, compulsory and elective training activities.<br>\r\n\r\n4. Enrollment object<br>\r\n✔ In accordance with regulations on formal university enrollment; college enrollment of the Ministry of Education and Training.<br>\r\n✔ In accordance with regulations on enrollment of FPT university.<br>\r\n\r\n5. Training process, graduating conditions<br>\r\n✔ In accordance with regulations on formal university and college training of the Ministry of Education and Training.<br>\r\n✔ In accordance with regulations on training of FPT University.<br>\r\n\r\n6. Evaluation method<br>\r\n✔ In accordance with regulations on examination and assessment in the training regulations of FPT University.<br>\r\n\r\n1. Mục tiêu đào tạo<br>\r\n1.1 Mục tiêu chung:<br>\r\nĐào tạo kỹ sư ngành Công nghệ thông tin (CNTT)/chuyên ngành Kỹ thuật phần mềm (KTPM) có nhân cách và năng lực đáp ứng nhu cầu thực tế của xã hội, nắm vững kiến thức chuyên môn và thực hành, có khả năng tổ chức, thực hiện và phát huy sáng tạo trong các công việc liên quan đến các chuyên ngành được đào tạo.<br>\r\nChương trình đào tạo nhằm:<br>\r\na) Trang bị cho sinh viên kiến thức cơ bản của ngành CNTT cùng các phương pháp luận, công nghệ nền tảng và chuyên sâu của chuyên ngành;<br>\r\nb) Rèn luyện cho sinh viên những đức tính, kỹ năng cần thiết qua môi trường làm việc chuyên nghiệp, biết vận dụng các kiến thức ngành CNTT và các kiến thức chuyên ngành vào công việc thực tế;<br>\r\nc) Cung cấp cho sinh viên một nền tảng vững chắc về ngoại ngữ, khoa học, văn hóa, xã hội, phát huy tính chủ động, sáng tạo trong học tập, công việc và cuộc sống.<br>\r\n1.2 Mục tiêu cụ thể:<br>\r\nSinh viên tốt nghiệp chương trình đào tạo phải thể hiện được những điều sau đây:<br>\r\nPO1. Có kiến thức cơ bản về khoa học xã hội, chính trị pháp luật, an ninh quốc phòng, kiến thức nền tảng của ngành CNTT & kiến thức chuyên sâu của chuyên ngành được đào tạo: kỹ thuật, phương pháp, công nghệ, các lĩnh vực ứng dụng chuyên sâu; xu hướng phát triển trên thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của các ngành nghề thuộc chuyên ngành được đào tạo.<br>\r\nPO2. Có thể làm việc được như một thành viên chính thức trong nhóm chuyên môn thuộc chuyên ngành được đào tạo: tham gia thiết kế, lựa chọn kỹ thuật và công nghệ phù hợp với xu hướng phát triển, giải quyết các vấn đề kỹ thuật; nắm được xu hướng công nghệ và yêu cầu người dùng; có thể làm kế hoạch phát triển hoàn thiện giải pháp; quản lý thực hiện và quản lý thay đổi trong phần công việc của mình; hiểu được các chính sách nhà nước về lĩnh vực chuyên ngành.<br>\r\nPO3. Thành thạo được các kỹ năng nghề nghiệp và các kỹ năng mềm của công dân thế kỷ 21 (kỹ năng tư duy, kỹ năng làm việc, kỹ năng sử dụng các công cụ làm việc, kỹ năng sống trong xã hội toàn cầu);<br>\r\nPO4. Sử dụng được tốt tiếng Anh trong học tập và công việc và một ngoại ngữ thứ hai trong giao tiếp thông thường.<br>\r\nPO5. Trung thực, kỷ luật cao trong học tập và công việc, biết làm việc nhóm một cách hiệu quả; biết ứng xử văn hóa trong công việc và xã hội; năng động, sáng tạo và có ý chí học tập không ngừng. Thể hiện thái độ và hành vi chuyên nghiệp với năng lực hình thành ý tưởng, thiết kế, thực hiện và vận hành hệ thống trong bối cảnh doanh nghiệp và xã hội.<br>\r\n\r\n1.3. Vị trí việc làm sau khi tốt nghiệp:<br>\r\nSinh viên tốt nghiệp chuyên ngành Kỹ thuật phần mềm có thể lựa chọn cho mình những công việc như:<br>\r\n✔ Lập trình viên phát triển ứng dụng<br>\r\n✔ Chuyên viên phân tích nghiệp vụ<br>\r\n✔ Kỹ sư đảm bảo chất lượng phần mềm<br>\r\n✔ Kỹ sư quy trình sản xuất phần mềm<br>\r\n✔ Quản trị viên dự án phần mềm<br>\r\n\r\n2. Chuẩn đầu ra<br>\r\n\r\n3. Khối lượng kiến thức toàn khóa<br>\r\n\r\n4. Đối tượng tuyển sinh<br>\r\n✔ Theo quy chế tuyển sinh đại học, cao đẳng hệ chính quy của Bộ Giáo dục và Đào tạo.<br>\r\n✔ Theo quy chế tuyển sinh của trường Đại học FPT.<br>\r\n\r\n5. Quy trình đào tạo, điều kiện tốt nghiệp<br>\r\n✔ Thực hiện theo quy chế đào tạo đại học, cao đẳng hệ chính quy của Bộ Giáo dục và Đào tạo.<br>\r\n✔ Theo quy chế đào tạo của trường Đại học FPT.<br>\r\n\r\n6. Cách thức đánh giá<br>\r\n✔ Theo quy định về kiểm tra và đánh giá học phần trong quy chế đào tạo của trường Đại học FPT.','973/QĐ-ĐHFPT dated 10/26/2022',_binary '',_binary '','thang'),(6,'BIT_SE_K16C','BA','','',_binary '\0',_binary '',''),(8,'BIT_SE_K15B','Bachelor Program of Information Technology, Software Engineering Major (Chương trình cử nhân ngành CNTT, chuyên ngành Kỹ thuật phần mềm)','1. Training Objectives<br>\r\n1.1 General objective:<br>\r\nTraining Information Technology (IT)/Software Engineering (SE) specialty engineers with personality and capacity to meet the needs of society, mastering professional knowledge and practice, being able to organize, implement and promote the creativity in jobs related to the trained specialty as well as pursue further education and research.<br>\r\nThe training program aims to:<br>\r\na) To equip students with fundamental knowledge of mathematics and the IT industry together with fundamental and specialized methodologies, technologies related to the trained specialty ;<br>\r\nb) Train students the necessary virtues and skills in the professional working environment, know how to apply specialized knowledge of SE specialty into practical work<br>\r\nc) Provide students with a strong foundation in foreign languages, science, culture and society, promoting their autonomy and creativity in study, work and life<br>\r\n1.2 Specific objectives:<br>\r\nGraduates of the IT training program/SE specialty must demonstrate the following:<br>\r\nPO1. Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry & in-depth knowledge of the specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.<br>\r\nPO2. Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; understand state policies in specialized fields.<br>\r\nPO3. Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society);<br>\r\nPO4. Can use English well in study and work and a second foreign language in normal communication.<br>\r\nPO5. Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in the context of corporation and society.<br>\r\n\r\n1.3. Job positions after graduation:<br>\r\nGraduates of Software Engineering can choose for themselves the following jobs:<br>\r\n✔ Application development programmers<br>\r\n✔ Business analysts<br>\r\n✔ Software quality assurance engineers<br>\r\n✔ Software process engineers<br>\r\n✔ Software project administrators<br>\r\n\r\n2. Program Learning Outcomes<br>\r\n\r\n3. Volume of learning of the course: 145 credits, excluding Preparation English, Military Training, compulsory and elective training activities.<br>\r\n\r\n4. Enrollment object<br>\r\n✔ In accordance with regulations on formal university enrollment; college enrollment of the Ministry of Education and Training.<br>\r\n✔ In accordance with regulations on enrollment of FPT university.<br>\r\n\r\n5. Training process, graduating conditions<br>\r\n✔ In accordance with regulations on formal university and college training of the Ministry of Education and Training.<br>\r\n✔ In accordance with regulations on training of FPT University.<br>\r\n\r\n6. Evaluation method<br>\r\n✔ In accordance with regulations on examination and assessment in the training regulations of FPT University.<br>\r\n\r\n1. Mục tiêu đào tạo<br>\r\n1.1 Mục tiêu chung:<br>\r\nĐào tạo kỹ sư ngành Công nghệ thông tin (CNTT)/chuyên ngành Kỹ thuật phần mềm (KTPM) có nhân cách và năng lực đáp ứng nhu cầu thực tế của xã hội, nắm vững kiến thức chuyên môn và thực hành, có khả năng tổ chức, thực hiện và phát huy sáng tạo trong các công việc liên quan đến các chuyên ngành được đào tạo.<br>\r\nChương trình đào tạo nhằm:<br>\r\na) Trang bị cho sinh viên kiến thức cơ bản của ngành CNTT cùng các phương pháp luận, công nghệ nền tảng và chuyên sâu của chuyên ngành;<br>\r\nb) Rèn luyện cho sinh viên những đức tính, kỹ năng cần thiết qua môi trường làm việc chuyên nghiệp, biết vận dụng các kiến thức ngành CNTT và các kiến thức chuyên ngành vào công việc thực tế;<br>\r\nc) Cung cấp cho sinh viên một nền tảng vững chắc về ngoại ngữ, khoa học, văn hóa, xã hội, phát huy tính chủ động, sáng tạo trong học tập, công việc và cuộc sống.<br>\r\n1.2 Mục tiêu cụ thể:<br>\r\nSinh viên tốt nghiệp chương trình đào tạo phải thể hiện được những điều sau đây:<br>\r\nPO1. Có kiến thức cơ bản về khoa học xã hội, chính trị pháp luật, an ninh quốc phòng, kiến thức nền tảng của ngành CNTT & kiến thức chuyên sâu của chuyên ngành được đào tạo: kỹ thuật, phương pháp, công nghệ, các lĩnh vực ứng dụng chuyên sâu; xu hướng phát triển trên thế giới; đồng thời hiểu biết tổng thể thị trường, bối cảnh, chức năng, nhiệm vụ của các ngành nghề thuộc chuyên ngành được đào tạo.<br>\r\nPO2. Có thể làm việc được như một thành viên chính thức trong nhóm chuyên môn thuộc chuyên ngành được đào tạo: tham gia thiết kế, lựa chọn kỹ thuật và công nghệ phù hợp với xu hướng phát triển, giải quyết các vấn đề kỹ thuật; nắm được xu hướng công nghệ và yêu cầu người dùng; có thể làm kế hoạch phát triển hoàn thiện giải pháp; quản lý thực hiện và quản lý thay đổi trong phần công việc của mình; hiểu được các chính sách nhà nước về lĩnh vực chuyên ngành.<br>\r\nPO3. Thành thạo được các kỹ năng nghề nghiệp và các kỹ năng mềm của công dân thế kỷ 21 (kỹ năng tư duy, kỹ năng làm việc, kỹ năng sử dụng các công cụ làm việc, kỹ năng sống trong xã hội toàn cầu);<br>\r\nPO4. Sử dụng được tốt tiếng Anh trong học tập và công việc và một ngoại ngữ thứ hai trong giao tiếp thông thường.<br>\r\nPO5. Trung thực, kỷ luật cao trong học tập và công việc, biết làm việc nhóm một cách hiệu quả; biết ứng xử văn hóa trong công việc và xã hội; năng động, sáng tạo và có ý chí học tập không ngừng. Thể hiện thái độ và hành vi chuyên nghiệp với năng lực hình thành ý tưởng, thiết kế, thực hiện và vận hành hệ thống trong bối cảnh doanh nghiệp và xã hội.<br>\r\n\r\n1.3. Vị trí việc làm sau khi tốt nghiệp:<br>\r\nSinh viên tốt nghiệp chuyên ngành Kỹ thuật phần mềm có thể lựa chọn cho mình những công việc như:<br>\r\n✔ Lập trình viên phát triển ứng dụng<br>\r\n✔ Chuyên viên phân tích nghiệp vụ<br>\r\n✔ Kỹ sư đảm bảo chất lượng phần mềm<br>\r\n✔ Kỹ sư quy trình sản xuất phần mềm<br>\r\n✔ Quản trị viên dự án phần mềm<br>\r\n\r\n2. Chuẩn đầu ra<br>\r\n\r\n3. Khối lượng kiến thức toàn khóa<br>\r\n\r\n4. Đối tượng tuyển sinh<br>\r\n✔ Theo quy chế tuyển sinh đại học, cao đẳng hệ chính quy của Bộ Giáo dục và Đào tạo.<br>\r\n✔ Theo quy chế tuyển sinh của trường Đại học FPT.<br>\r\n\r\n5. Quy trình đào tạo, điều kiện tốt nghiệp<br>\r\n✔ Thực hiện theo quy chế đào tạo đại học, cao đẳng hệ chính quy của Bộ Giáo dục và Đào tạo.<br>\r\n✔ Theo quy chế đào tạo của trường Đại học FPT.<br>\r\n\r\n6. Cách thức đánh giá<br>\r\n✔ Theo quy định về kiểm tra và đánh giá học phần trong quy chế đào tạo của trường Đại học FPT.','973/QĐ-ĐHFPT dated 10/26/2022',_binary '',_binary '','thang');
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum_subject`
--

DROP TABLE IF EXISTS `curriculum_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum_subject` (
  `curid` int NOT NULL,
  `subjectCode` varchar(150) NOT NULL,
  PRIMARY KEY (`curid`,`subjectCode`),
  KEY `fk_Curriculum_Subject_subject` (`subjectCode`),
  CONSTRAINT `fk_Curriculum_Subject_curriculum` FOREIGN KEY (`curid`) REFERENCES `curriculum` (`curid`),
  CONSTRAINT `fk_Curriculum_Subject_subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum_subject`
--

LOCK TABLES `curriculum_subject` WRITE;
/*!40000 ALTER TABLE `curriculum_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decision`
--

DROP TABLE IF EXISTS `decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision` (
  `decisionID` int NOT NULL AUTO_INCREMENT,
  `decisionNo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `decisionName` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `approveDate` date DEFAULT NULL,
  `note` text,
  `createDate` date DEFAULT NULL,
  `fileName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`decisionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision`
--

LOCK TABLES `decision` WRITE;
/*!40000 ALTER TABLE `decision` DISABLE KEYS */;
INSERT INTO `decision` VALUES (2,'1189/QĐ-ĐHFPT','Ban hành đề cương chi tiết học kì Spring 2023','2022-12-22',NULL,'2022-12-22',NULL),(3,'158/QĐ-ĐHFPT','QĐ điều chỉnh CTĐT áp dụng từ SU23','2023-02-20',NULL,'2023-02-20',NULL);
/*!40000 ALTER TABLE `decision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elective`
--

DROP TABLE IF EXISTS `elective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elective` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `curid` int NOT NULL,
  `eName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `fk_Elective_curriculum` (`curid`),
  CONSTRAINT `fk_Elective_curriculum` FOREIGN KEY (`curid`) REFERENCES `curriculum` (`curid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elective`
--

LOCK TABLES `elective` WRITE;
/*!40000 ALTER TABLE `elective` DISABLE KEYS */;
/*!40000 ALTER TABLE `elective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elective_subject`
--

DROP TABLE IF EXISTS `elective_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elective_subject` (
  `eid` int NOT NULL,
  `subjectCode` varchar(150) NOT NULL,
  `semester` varchar(50) NOT NULL,
  PRIMARY KEY (`eid`,`subjectCode`),
  KEY `fk_Elective_Subject_subject` (`subjectCode`),
  CONSTRAINT `fk_Elective_Subject_elective` FOREIGN KEY (`eid`) REFERENCES `elective` (`eid`),
  CONSTRAINT `fk_Elective_Subject_subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elective_subject`
--

LOCK TABLES `elective_subject` WRITE;
/*!40000 ALTER TABLE `elective_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `elective_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lo`
--

DROP TABLE IF EXISTS `lo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lo` (
  `loid` int NOT NULL AUTO_INCREMENT,
  `syllabusID` int NOT NULL,
  `cloname` varchar(45) DEFAULT NULL,
  `clodetail` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lodetail` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`loid`),
  KEY `fk_lo_syllabus` (`syllabusID`),
  CONSTRAINT `fk_lo_syllabus` FOREIGN KEY (`syllabusID`) REFERENCES `syllabus` (`syllabusID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lo`
--

LOCK TABLES `lo` WRITE;
/*!40000 ALTER TABLE `lo` DISABLE KEYS */;
INSERT INTO `lo` VALUES (1,1,'1','CLO1','Can study & analyze to understand the project requirements, actively make questions if necessary'),(2,1,'2','CLO2','Understand and applying MVC design pattern, knowledges of OOP in designing code modules as well as designing database based on designed UI'),(3,1,'3','CLO3','Proficiency in Web programming skills, based on the Java/DotNet programming language'),(4,1,'4','CLO4','Exhibit professional working attitudes'),(5,1,'5','CLO5','Practice oral presentation and inter-personal communications.');
/*!40000 ALTER TABLE `lo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `syllabusID` int NOT NULL,
  `description` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `author` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `publisher` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `publishedDate` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `edition` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isbn` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isMainMaterial` bit(1) DEFAULT NULL,
  `isHardCopy` bit(1) DEFAULT NULL,
  `isOnline` bit(1) DEFAULT NULL,
  `note` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `fk_material_syllabus` (`syllabusID`),
  CONSTRAINT `fk_material_syllabus` FOREIGN KEY (`syllabusID`) REFERENCES `syllabus` (`syllabusID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,1,'Guides & Templates (for Students & Teachers)','','','','','',_binary '',_binary '\0',_binary '\0','Bản mềm do FU biên soạn'),(2,1,'Learn HTML and CSS with W3Schools(https://www.w3schools.com/)','','','','','',_binary '\0',_binary '\0',_binary '',''),(3,1,'Murachs Java Servlets and JSP','Joel Murach, Michael Urban','Mike Murach & Associates','2014','3rd Edition','978-1890774783',_binary '\0',_binary '',_binary '\0',''),(4,1,'SQL for MySQL Developers A Comprehensive Tutorial and Reference','Rick F. van der Lans','Addison-Wesley Professional','2017','1st edition','978-0131497351',_binary '\0',_binary '',_binary '\0','');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plo`
--

DROP TABLE IF EXISTS `plo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plo` (
  `ploid` int NOT NULL AUTO_INCREMENT,
  `ploName` varchar(100) NOT NULL,
  `ploDescription` varchar(1000) DEFAULT NULL,
  `curid` int NOT NULL,
  PRIMARY KEY (`ploid`),
  KEY `curid` (`curid`),
  CONSTRAINT `plo_ibfk_1` FOREIGN KEY (`curid`) REFERENCES `curriculum` (`curid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plo`
--

LOCK TABLES `plo` WRITE;
/*!40000 ALTER TABLE `plo` DISABLE KEYS */;
INSERT INTO `plo` VALUES (1,'PLO1','Demonstrate basic knowledge of social sciences, politics and law, national security and defense, contributing to the formation of worldview and scientific methodology.',8),(2,'PLO1','Demonstrate basic knowledge of social \r sciences, politics and law, national security and defense, contributing to the formation of worldview and scientific methodology',1),(3,'PLO2','Demonstrate an entrepreneurial, creative, critical, and problem-solving mindset.',8),(4,'PLO2','Demonstrate an entrepreneurial, creative, critical, and problem-solving mindset',1),(5,'PLO3','Communicating and working in groups effectively in academic and practical environments.',1),(6,'PLO4','Use English proficiently in communication and learning (equivalent to level 4 according to the 6-level Foreign Language Proficiency Framework for Vietnam, IELTS 6.0 or TOEFL (paper) 575-600 or TOEFL (iBT) 90 -100); and be able to communicate simply in Japanese.',1),(7,'PLO5','Demonstrate professional behaviors, morality, social responsibilities and a sense of dedication to community.',1),(8,'PLO6','Be mentally and physically strong, be capable of expressing national identity and integrating confidently into the world.',1),(9,'PLO7','Develop self-study and lifelong learning spirit and capabilities to adapt to the constant change of technology and society',1),(10,'PLO8','Be able to explain and apply essential mathematical knowledge related to information technology: Calculus, discrete math, linear algebra',1),(11,'PLO9','Be able to explain at a basic level the concepts related to computer architecture, operating systems, computer networks, databases…',1),(12,'PLO10','Be able to apply knowledge of programming, software development (including data structures and algorithms, programming techniques, object-oriented programming…) to develop applications',1),(13,'PLO11','Be able to explain different viewpoints on professional ethics, the role of careers in the IT field and related skills to choose the right major in the later stage',1),(15,'PLO12','Be able to apply knowledge of business, society, knowledge of management (especially project management) in professional work',1),(16,'PLO13','Be able to explain the roles and responsibilities of a software engineering specialist',1),(17,'PLO14','Be able to explain the software development and production process; apply relevant theories, models, and techniques to various issues such as problem identification and analysis, design, development, testing, and implementation of software',1),(18,'PLO15','Be able to build software systems: web applications, mobile applications, open source applications that meet requirements',1),(19,'PLO16','Be able to evaluate techniques and technologies related to software engineering, highlighting strengths and weaknesses of techniques and technologies',1),(20,'PLO17','Be able to update and utilize advanced tools and techniques in the field of software engineering in particular and IT in general',1),(21,'PLO18','Have in-depth knowledge and skills in the persuited major or extensive knowledge and skills in the major close to the persuited major',1);
/*!40000 ALTER TABLE `plo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po`
--

DROP TABLE IF EXISTS `po`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `po` (
  `poid` int NOT NULL AUTO_INCREMENT,
  `poName` varchar(100) NOT NULL,
  `poDescription` varchar(1000) DEFAULT NULL,
  `curid` int NOT NULL,
  PRIMARY KEY (`poid`),
  KEY `curid` (`curid`),
  CONSTRAINT `po_ibfk_1` FOREIGN KEY (`curid`) REFERENCES `curriculum` (`curid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po`
--

LOCK TABLES `po` WRITE;
/*!40000 ALTER TABLE `po` DISABLE KEYS */;
INSERT INTO `po` VALUES (2,'PO1','Having basic knowledge of social sciences, politics and law, security and defense, foundational knowledge of the IT industry & in-depth knowledge of the specialized training: techniques, methods, technologies, in-depth application areas; development trends in the world; at the same time understand the overall market, context, functions and tasks of the professions in the specialized training.',1),(7,'test1','test1',2),(8,'test2','test2',2),(9,'PO2','	Be able to work as a full member of a professional team in the field of training: participate in designing, selecting techniques and technologies in line with development trends, solving technical problems; understand technology trends and user requirements; can do the complete solution development plan; performance management and change management in his or her part of the job; understand state policies in specialized fields.',1),(10,'PO3','Mastering professional skills and soft skills of 21st century citizens (thinking skills, work skills, skills in using work tools, life skills in a global society.)',1),(11,'PO4','Can use English well in study and work and a second foreign language in normal communication.',1),(12,'PO5','	Honesty, high discipline in study and work, know how to work effectively in groups; know how to behave culturally at work and in society; dynamic, creative and willing to learn constantly. Demonstrate professional attitude and behavior with the ability to conceive of ideas, design, implement and operate systems in the context of corporation and society.',1);
/*!40000 ALTER TABLE `po` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `sid` int NOT NULL,
  `nameQuestion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `detail` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`qid`),
  KEY `fk_Question_syllabus` (`sid`),
  CONSTRAINT `fk_Question_syllabus` FOREIGN KEY (`sid`) REFERENCES `session` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'CQ1.1','Who will interact with your system? List actors with detailed functions of each actor.'),(2,2,'CQ1.2','What are differences between your intended output product and other similar products in the market?'),(3,3,'CQ1.3','How to assign & tracking tasks among your team?'),(4,4,'CQ2.1 ','How do you collect, clarify, and define the requirements for the function/screens that you are in charged?'),(5,5,'CQ2.2 ','What screens/functions would you have in the project output product? What are the purpose of each function/screen and the relationships with others? '),(6,6,'CQ2.3 ','Your plan for the iteration 1? - What are the functions/screens that you would choose? Why? - Is there any unclear things that need to clarify or concerning you?'),(7,7,'CQ3.1 ','What are the tasks or outputs that you have completed last week? What are still in progress or pending? Are there any issues or difficulties so far?'),(8,8,'CQ3.2 ','What are the tables you should have to store your application data in the database?'),(9,9,'CQ3.3 ','What are the Git commands that you would use to manage source codes in your project? How do you use each of those?'),(10,10,'CQ4.1','What UI themes/templates do you suggest to use in UI/Front-End design for your project screens? What are the common/share components that your team would write once and include multiple times into your application screens?'),(11,11,'CQ4.2','Which database tables would you access from each of your assigned screens/functions? What are the transaction (query, insert, update, delete) from each screen to the related database table?'),(12,12,'CQ4.3 ','How would you organize your source codes into packages/folders? - What are the packages/folders you would have? - What is the role/description of each package/folder? - What are the file naming convension in each package/folder?'),(13,16,'CQ6.1','Which data/components would you have/handle on each of you’re assigned screens/functions? What are the transactions/events that each of your assigned screens/functions handle?'),(14,17,'CQ6.2','What are the business logics/rules that you would have to implement or include in each of your assigned screens/functions'),(15,18,'CQ6.3','Your plan for the iteration 2? - What are the functions/screens that you would choose? Why? - Is there any unclear things that need to clarify or concerning you?'),(16,19,'CQ7.1','Which functions/screens have you completed and ready for demonstrating in the last iteration? What are pending issues with each of those?'),(17,20,'CQ7.2','To implement your assigned screens/functions what are the code modules (classes/files, methods) you would need? - What are the code modules you would have? - What are the purposes of each module?'),(18,21,'CQ7.3','Which screens/functions do you have to integrate to from each of you assigned functions/screens? What do you check on each of those functions/screens interface? What are common issues you have discovered after testing/integrating?'),(19,25,'CQ9.1','What are the tasks or outputs that you have completed last week? What are still in progress or pending? Are there any issues or difficulties so far?'),(20,26,'CQ9.2','What are the business logics/rules that you would have to implement or include in each of your assigned screens/functions'),(21,27,'CQ9.3','Your plan for the iteration 3? - What are the functions/screens that you would choose? Why? - Is there any unclear things that need to clarify or concerning you?'),(22,31,'CQ11.1','Which functions/screens have you completed and ready for demonstrating in the last iteration? What are pending issues with each of those?'),(23,32,'CQ11.2','To implement your assigned screens/functions what are the code modules (classes/files, methods) you would need? - What are the code modules you would have? - What are the purposes of each module?'),(24,33,'CQ11.3','Which screens/functions do you have to integrate to from each of you assigned functions/screens? What do you check on each of those functions/screens interface? What are common issues you have discovered after testing/integrating?'),(25,37,'CQ13.1','What are the tasks or outputs that you have completed last week? What are still in progress or pending? Are there any issues or difficulties so far?'),(26,38,'CQ13.2','What are the business logics/rules that you would have to implement or include in each of your assigned screens/functions'),(27,39,'CQ13.3','Your plan for the iteration 3? - What are the functions/screens that you would choose? Why? - Is there any unclear things that need to clarify or concerning you?'),(28,43,'CQ15.1','Which functions/screens have you completed and ready for demonstrating in the last iteration? What are pending issues with each of those?'),(29,44,'CQ15.2','To implement your assigned screens/functions what are the code modules (classes/files, methods) you would need? - What are the code modules you would have? - What are the purposes of each module?'),(30,45,'CQ15.3','Which screens/functions do you have to integrate to from each of you assigned functions/screens? What do you check on each of those functions/screens interface? What are common issues you have discovered after testing/integrating?'),(31,52,'CQ18.1','What are the updates or optimizations you would have in the final iteration?'),(32,53,'CQ18.2','How do you evaluate your work results in this Iteration? What things you need to improve in your team (communication skills, documentation, project coding, etc.)?'),(33,54,'CQ18.3','What things that your team have learnt from the project?');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomment`
--

DROP TABLE IF EXISTS `recomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomment` (
  `recommentID` int NOT NULL AUTO_INCREMENT,
  `commentID` int NOT NULL,
  `accountID` int NOT NULL,
  `recomment` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`recommentID`),
  KEY `fk_recomment_comment` (`commentID`),
  KEY `fk_ReComment_account` (`accountID`),
  CONSTRAINT `fk_ReComment_account` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `fk_recomment_comment` FOREIGN KEY (`commentID`) REFERENCES `comment` (`commentID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomment`
--

LOCK TABLES `recomment` WRITE;
/*!40000 ALTER TABLE `recomment` DISABLE KEYS */;
INSERT INTO `recomment` VALUES (1,1,1,'It is a long established fact that a reader will be distracted by the readable content of a page.','2023-02-28'),(2,2,8,'asdadsasd','2023-02-28'),(3,1,8,'qweqweqweqeqasdasd','2023-02-28'),(5,4,1,'ti lam tiep','2023-02-24'),(6,5,1,'khong thich lam nua','2023-02-25'),(7,12,8,'ko sao ty sua','2023-03-05'),(8,11,8,'biet roi ty test','2023-03-05'),(9,11,8,'test 1','2023-03-05'),(10,11,8,'ok done\r\n','2023-03-05'),(11,14,8,'lam lai','2023-03-05'),(12,15,1,'nhan review                                                                ','2023-03-05'),(13,16,8,'123adqwe','2023-03-05'),(16,19,1,'ok la','2023-03-13'),(17,21,8,'adasd','2023-03-13'),(18,21,1,'adad','2023-03-13');
/*!40000 ALTER TABLE `recomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `reviewID` int NOT NULL AUTO_INCREMENT,
  `syllabusID` int NOT NULL,
  `review` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`reviewID`),
  KEY `fk_Review_syllabus` (`syllabusID`),
  CONSTRAINT `fk_Review_syllabus` FOREIGN KEY (`syllabusID`) REFERENCES `syllabus` (`syllabusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `roleID` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user'),(2,'syllabus designer'),(3,'designer staff'),(4,'curriculum designer'),(5,'admin'),(6,'syllabus reviewer'),(7,'syllabus staff'),(8,'curriculum reviewer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `syllabusID` int NOT NULL,
  `topic` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `learningTeachingType` bit(1) DEFAULT NULL,
  `lo` varchar(150) DEFAULT NULL,
  `itu` varchar(150) DEFAULT NULL,
  `studentmaterial` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sDownload` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `studentTask` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `urls` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sNo` int DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_session_syllabus` (`syllabusID`),
  CONSTRAINT `fk_session_syllabus` FOREIGN KEY (`syllabusID`) REFERENCES `syllabus` (`syllabusID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,1,'INITIATION PHASE <br>- Subject introduction',_binary '\0','LO1,2,3','I','This Syllabus, Student This Syllabus, Student Materials','sWP391','study materials, Q&A','',1),(2,1,'- Subject introduction',_binary '\0','LO1,2,3','I','This Syllabus, Student This Syllabus, Student Materials',' sWP391','study materials, Q&A','',2),(3,1,'- Project environment preparation',_binary '\0','LO1,2,4','T, U','This Syllabus, Student This Syllabus, Student Materials','','setup/Configure working environemnt','',3),(4,1,'- Project environment preparation',_binary '\0','LO1,2,4','T, U','This Syllabus, Student This Syllabus, Student Materials','','setup/Configure working environemnt','',4),(5,1,'- Requirement Introduction & Iteration 1 Planning',_binary '\0','LO1,2,4','I, U','Project Tracking','','study requirement, Q&A, plan','',5),(6,1,'- Requirement Introduction & Iteration 1 Planning',_binary '\0','LO1,2,4','I, U','Project Tracking','','study requirement, Q&A, plan','',6),(7,1,'CONSTRUCTION PHASE_Development Iteration 1 (Iter1) - Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',7),(8,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',8),(9,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',9),(10,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',10),(11,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',11),(12,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',12),(13,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',13),(14,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',14),(15,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',15),(16,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',16),(17,1,'- Iteration1 Review & Iteration2 Planning',_binary '\0','LO3,4,5','T, U',' U	Project Tracking, Issue Report','','Track project information Complete the iterations software package','',17),(18,1,'- Iteration1 Review & Iteration2 Planning',_binary '\0','LO3,4,5','T, U',' U	Project Tracking, Issue Report','','Track project information Complete the iterations software package','',18),(19,1,'CONSTRUCTION PHASE_Development Iteration 2 (Iter2) - Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',19),(20,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',20),(21,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',21),(22,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',22),(23,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',23),(24,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',24),(25,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',25),(26,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',26),(27,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',27),(28,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',28),(29,1,'- Iteration2 Review & Iteration3 Planning',_binary '\0','LO3,4,5	','T, U','Project Tracking, Issue Report','','Track project information Complete the iteration s software package','',29),(30,1,'- Iteration2 Review & Iteration3 Planning',_binary '\0','LO3,4,5	','T, U','Project Tracking, Issue Report','','Track project information Complete the iteration s software package','',30),(31,1,'CONSTRUCTION PHASE_Development Iteration 3 (Iter3) - Requirement clarification & software design',_binary '\0','LO1,2,4,5	','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',31),(32,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5	','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',32),(33,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5	','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',33),(34,1,'- Requirement clarification & software design',_binary '\0','LO1,2,4,5	','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',34),(35,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','	Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',35),(36,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','	Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',36),(37,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','	Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',37),(38,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','	Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',38),(39,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','	Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',39),(40,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','	Reference Materials, Coding Standards','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',40),(41,1,'- Iteration3 Review & Final Iteration Planning',_binary '\0','LO3,4,5','T, U','Project Tracking, Issue Report','','Track project information Complete the iterations software package','',41),(42,1,'- Iteration3 Review & Final Iteration Planning',_binary '\0','LO3,4,5','T, U','Project Tracking, Issue Report','','Track project information Complete the iterations software package','',42),(43,1,'CLOSING PHASE_Final Iteration (Iter4) - Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',43),(44,1,' Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',44),(45,1,' Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',45),(46,1,' Requirement clarification & software design',_binary '\0','LO1,2,4,5','T, U','Template_SRS Document Template_SDS Document Reference Materials','','Present/demo iteration s work results Clarify/Confirm Requirements Prepare SRS Document Design Code Modules','',46),(47,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',47),(48,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',48),(49,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',49),(50,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',50),(51,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',51),(52,1,'- Practice: design, code, self-test, integrate',_binary '\0','LO2-5','U','Reference Materials, Coding Standards','','Present/demo iterations work results Clarify/Confirm Requirements Prepare SDS Document Code, Self-Test, Integrate','',52),(53,1,' Final Project Preparation',_binary '\0','LO3,4,5','T, U','Final Release Document, Project Tracking, Issue Report','','Present/demo iterations work results','',53),(54,1,'CLOSING PHASE_Final Presentation - Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iterations work results','',54),(55,1,' Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iteration s work results','',55),(56,1,' Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iteration s work results','',56),(57,1,' Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iteration s work results','',57),(58,1,' Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iteration s work results','',58),(59,1,' Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iteration s work results','',59),(60,1,' Final Project Presentation 1/3',_binary '\0','LO3,4,5','T, U','students submitted materials','','Present/demo iteration s work results','',60);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectCode` varchar(150) NOT NULL,
  `subjectName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `semester` int DEFAULT NULL,
  `noCredit` int DEFAULT NULL,
  `preRequisite` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('MAD201','demo',NULL,NULL,NULL),('MAS101','demo',NULL,NULL,NULL),('PRJ301','Java Web Application Development_Phát triển ứng dụng Java web',5,3,' DBI202, PRO192, PRF192'),('SWE391','demo',NULL,NULL,NULL),('SWP391','Software development projec',5,3,'PRJ301, DBI202, PRO192, PRF192'),('SWT301','Software Testing_Kiểm thử phần mềm',5,3,'SWE102, SWE201, SWE201c, PRO192, PRF192');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syllabus`
--

DROP TABLE IF EXISTS `syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syllabus` (
  `syllabusID` int NOT NULL AUTO_INCREMENT,
  `subjectCode` varchar(150) NOT NULL,
  `syllabusName` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `noCredit` int DEFAULT NULL,
  `degreeLevel` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `timeAllocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `prerequisite` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `studentTask` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `tool` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `scoringScale` int DEFAULT NULL,
  `decisionNo` int DEFAULT NULL,
  `isApproved` bit(1) DEFAULT b'0',
  `note` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `minAcgMarkToPass` int DEFAULT NULL,
  `isActive` bit(1) DEFAULT b'0',
  `approvedDate` date DEFAULT NULL,
  `accountID` int NOT NULL,
  PRIMARY KEY (`syllabusID`),
  KEY `fk_syllabus_subject` (`subjectCode`),
  KEY `fk_syllabus_accountID` (`accountID`),
  KEY `fk_decisionNp` (`decisionNo`),
  CONSTRAINT `fk_accountID` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`),
  CONSTRAINT `fk_decisionNp` FOREIGN KEY (`decisionNo`) REFERENCES `decision` (`decisionID`),
  CONSTRAINT `fk_syllabus_subject` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syllabus`
--

LOCK TABLES `syllabus` WRITE;
/*!40000 ALTER TABLE `syllabus` DISABLE KEYS */;
INSERT INTO `syllabus` VALUES (1,'SWP391','Software development project_Dự án phát triển phần mềm',3,'Bachelor','Study hour (150h) = 45h contact hours + 105h self-study','PRJ301 (Java Web Application Development)','This course focuses on designing, developing, and integrating the basic Web-based management system\n (as assigned/agreed by the teacher) using Java Web (JSP, Servlet, JDBC) or .NET (ASP.NET, ADO.NET) \n technologies . Students are required to build the system with other 3-5 team members as appointed by\n the teacher. After the course, students will be able to achieve Java web programing proficiency with \n the following skills by practicing with other members in the assigned team<br> - Proficiency in common\n web techniques and basic Java Web skills (JSP, Servlet, JDBC) or .NET Web skills (ASP.NET, ADO.NET) \n <br>- Proficiency in front end skills (HTML, CSS, JS) require for industry<br> - Proficiency in SQL \n skills required for industry<br> - Analyze & design the solution following the object oriented models<br>\n - Co-ordinate with the team to complete the works in the form of a project','- Register the programming\n language to be used (Java or .NET),<br> - Build the team & select/define the project topic with arrangement/\n guide from the teacher<br> - Select the team leader and using the FPT account (@fpt.edu.vn account) to setup/\n configure the project managemernt environment (sources, tasks, issues, milestones) on the GitLab & project documents\n management on the OneDrive.<br> - Get the detailed assignment from the teacher, plan the project tasks, and execute the project accordingly<br> \n - Students must attend at least 80% of contact slots in order to be accepted to the final presentation.<br> - Student is responsible to do all \n exercises given by the teacher in class or at home and submit on time<br> - Constantly follow announcements on intranet/LMS at http://lms.fpt.edu.vn\n for up-to-date course information regarding assignment submission and feedback on assignments and project work.<br> - Using the GitLab to collaborate\n in every phase of the project by all the team members','GitLab (https://gitlab.com/), One Drive<br> For Java project<br> • Java JDK version 1.6 or higher, \n NetBeans 13<br> • MySQL Server (v8.0.23 or higher), MySQL Workbench; For .NET project<br> • Microsoft Internet Information Services server (come with Microsoft Windows\n )<br> • Microsoft Visual Studio version 2015 or higher (for .NET project)',10,2,_binary '','1) On-going Assessment<br> - On-going Assessment 1: 20%<br> \n - On-going Assessment 2: 20%<br> - On-going Assessment 3: 20%<br> 2) Final Project Presentation: 40%<br> <br> To be selected to the Final Presentation, each student \n needs:<br> * On-going grade assessment >=5/10<br> * No cheating during the project progress',5,_binary '','2022-12-22',4),(2,'PRJ301','syllabusName',3,'Bachelor','Study hour (150h) = 45h contact hours + 105h self-study','PRJ301 (Java Web Application Development)','This course focuses on designing, developing, and integrating \n the basic Web-based management system (as assigned/agreed by the teacher) using Java Web (JSP, Servlet, JDBC) or .NET (ASP.NET, ADO.NET) technologies . Students are required \n to build the system with other 3-5 team members as appointed by the teacher. After the course, students will be able to achieve Java web programing \n proficiency with the following skills by practicing with other members in the assigned team<br> - Proficiency in common web techniques and basic Java Web\n skills (JSP, Servlet, JDBC) or .NET Web skills (ASP.NET, ADO.NET) <br>- Proficiency in front end skills (HTML, CSS, JS) require for industry<br> -\n Proficiency in SQL skills required for industry<br> - Analyze & design the solution following the object oriented models<br> - Co-ordinate with the\n team to complete the works in the form of a project','- Register the programming language to be used (Java or .NET),<br> - Build the team & select/define \n the project topic with arrangement/guide from the teacher<br> - Select the team leader and using the FPT account (@fpt.edu.vn account) to setup/configure\n the project managemernt environment (sources, tasks, issues, milestones) on the GitLab & project documents management on the OneDrive.<br> - Get the detailed\n assignment from the teacher, plan the project tasks, and execute the project accordingly<br> - Students must attend at least 80% of contact slots in order to \n be accepted to the final presentation.<br> - Student is responsible to do all exercises given by the teacher in class or at home and submit on time<br> - \n Constantly follow announcements on intranet/LMS at http://lms.fpt.edu.vn for up-to-date course information regarding assignment submission and feedback\n on assignments and project work.<br> - Using the GitLab to collaborate in every phase of the project by all the team members','GitLab (https://gitlab.com/),\n One Drive<br> For Java project<br> • Java JDK version 1.6 or higher, NetBeans 13<br> • MySQL Server (v8.0.23 or higher), MySQL Workbench; For .NET project<br> \n • Microsoft Internet Information Services server (come with Microsoft Windows)<br> • Microsoft Visual Studio version 2015 or higher (for .NET project)',10,2,_binary '','1) On-going Assessment<br> - On-going Assessment 1: 20%<br> - On-going Assessment 2: 20%<br> - On-going Assessment 3: 20%<br> 2) Final Project Presentation: 40%<br> <br> To be selected to the Final Presentation, each student needs:<br> * On-going grade assessment >=5/10<br> * No cheating during the project progress',0,_binary '','2023-12-08',4),(3,'PRJ301','syllabusName',0,'','Study hour (150h) = 45h contact hours + 105h self-study','PRJ301 (Java Web Application Development)','This course focuses on designing, developing, and integrating the basic Web-based management system (as assigned/agreed by the teacher) using Java Web (JSP, Servlet, JDBC) or .NET (ASP.NET, ADO.NET) technologies . Students are required to build the system with other 3-5 team members as appointed by the teacher. After the course, students will be able to achieve Java web programing proficiency with the following skills by practicing with other members in the assigned team<br> - Proficiency in common web techniques and basic Java Web skills (JSP, Servlet, JDBC) or .NET Web skills (ASP.NET, ADO.NET) <br>- Proficiency in front end skills (HTML, CSS, JS) require for industry<br> - Proficiency in SQL skills required for industry<br> - Analyze & design the solution following the object oriented models<br> - Co-ordinate with the team to complete the works in the form of a project','- Register the programming language to be used (Java or .NET),<br> - Build the team & select/define the project topic with arrangement/guide from the teacher<br> - Select the team leader and using the FPT account (@fpt.edu.vn account) to setup/configure the project managemernt environment (sources, tasks, issues, milestones) on the GitLab & project documents management on the OneDrive.<br> - Get the detailed assignment from the teacher, plan the project tasks, and execute the project accordingly<br> - Students must attend at least 80% of contact slots in order to be accepted to the final presentation.<br> - Student is responsible to do all exercises given by the teacher in class or at home and submit on time<br> - Constantly follow announcements on intranet/LMS at http://lms.fpt.edu.vn for up-to-date course information regarding assignment submission and feedback on assignments and project work.<br> - Using the GitLab to collaborate in every phase of the project by all the team members','GitLab (https://gitlab.com/), One Drive<br> For Java project<br> • Java JDK version 1.6 or higher, NetBeans 13<br> • MySQL Server (v8.0.23 or higher), MySQL Workbench; For .NET project<br> • Microsoft Internet Information Services server (come with Microsoft Windows)<br> • Microsoft Visual Studio version 2015 or higher (for .NET project)',10,2,_binary '','1) On-going Assessment<br> - On-going Assessment 1: 20%<br> - On-going Assessment 2: 20%<br> - On-going Assessment 3: 20%<br> 2) Final Project Presentation: 40%<br> <br> To be selected to the Final Presentation, each student needs:<br> * On-going grade assessment >=5/10<br> * No cheating during the project progress',0,_binary '','2024-12-08',4),(4,'SWP391','Software development project_Dự án phát triển phần mềm',0,'Bachelor','Study hour (150h) = 45h contact hours + 105h self-study','PRJ301 (Java Web Application Development)','This course focuses on designing, developing, and integrating the basic Web-based management system (as assigned/agreed by the teacher) using Java Web (JSP, Servlet, JDBC) or .NET (ASP.NET, ADO.NET) technologies . Students are required to build the system with other 3-5 team members as appointed by the teacher. After the course, students will be able to achieve Java web programing proficiency with the following skills by practicing with other members in the assigned team<br> - Proficiency in common web techniques and basic Java Web skills (JSP, Servlet, JDBC) or .NET Web skills (ASP.NET, ADO.NET) <br>- Proficiency in front end skills (HTML, CSS, JS) require for industry<br> - Proficiency in SQL skills required for industry<br> - Analyze & design the solution following the object oriented models<br> - Co-ordinate with the team to complete the works in the form of a project','- Register the programming language to be used (Java or .NET),<br> - Build the team & select/define the project topic with arrangement/guide from the teacher<br> - Select the team leader and using the FPT account (@fpt.edu.vn account) to setup/configure the project managemernt environment (sources, tasks, issues, milestones) on the GitLab & project documents management on the OneDrive.<br> - Get the detailed assignment from the teacher, plan the project tasks, and execute the project accordingly<br> - Students must attend at least 80% of contact slots in order to be accepted to the final presentation.<br> - Student is responsible to do all exercises given by the teacher in class or at home and submit on time<br> - Constantly follow announcements on intranet/LMS at http://lms.fpt.edu.vn for up-to-date course information regarding assignment submission and feedback on assignments and project work.<br> - Using the GitLab to collaborate in every phase of the project by all the team members','GitLab (https://gitlab.com/), One Drive<br> For Java project<br> • Java JDK version 1.6 or higher, NetBeans 13<br> • MySQL Server (v8.0.23 or higher), MySQL Workbench; For .NET project<br> • Microsoft Internet Information Services server (come with Microsoft Windows)<br> • Microsoft Visual Studio version 2015 or higher (for .NET project)',10,3,_binary '','1) On-going Assessment<br> - On-going Assessment 1: 20%<br> - On-going Assessment 2: 20%<br> - On-going Assessment 3: 20%<br> 2) Final Project Presentation: 40%<br> <br> To be selected to the Final Presentation, each student needs:<br> * On-going grade assessment >=5/10<br> * No cheating during the project progress',5,_binary '','2022-12-22',4),(5,'SWE391','demo',3,'Bachelor','Study hour (150h) = 45h contact hours + 105h self-study',NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(6,'SWE391','demo',3,'Bachelor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(7,'SWE391','demo',3,'Bachelor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(8,'MAD201','demo',NULL,'Bachelor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(9,'MAD201','demo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(10,'MAD201','MAD201',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(11,'MAD201','MAD201',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '','2022-12-22',1),(12,'MAD201','MAD201',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '',NULL,NULL,_binary '\0','2022-12-22',1),(13,'MAS101','MAS101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',NULL,NULL,_binary '\0','2022-12-22',1),(14,'MAS101','MAS101',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary '\0',NULL,NULL,_binary '\0',NULL,1),(16,'MAD201','123',0,'asdad','asdads','preRequisite','description','studentTasks','tool',10,2,_binary '','note',10,_binary '','2022-12-12',4),(17,'SWP391','sasdad',123,'adsad','312','4231','hgfdc','bvfcd','bfvc',12,3,_binary '\0','hgfd',12,_binary '','2023-12-12',4);
/*!40000 ALTER TABLE `syllabus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-20  9:15:37
