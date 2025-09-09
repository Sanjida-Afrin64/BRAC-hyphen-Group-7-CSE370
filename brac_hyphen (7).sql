-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2025 at 09:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brac_hyphen`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_course`
--

CREATE TABLE `add_course` (
  `Student_ID` int(11) NOT NULL,
  `CourseID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_course`
--

INSERT INTO `add_course` (`Student_ID`, `CourseID`) VALUES
(23301525, 'CSE423'),
(23301531, 'CSE422'),
(23301531, 'CSE423'),
(23301531, 'CSE471'),
(23301533, 'CSE220');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `fac_id` int(11) NOT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`fac_id`, `role`) VALUES
(4, 'co_ordinator'),
(5, 'Dean'),
(6, 'Dean'),
(7, 'Dean');

-- --------------------------------------------------------

--
-- Table structure for table `applied_coops`
--

CREATE TABLE `applied_coops` (
  `co_ops_id` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `c_status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `applied_coops`
--

INSERT INTO `applied_coops` (`co_ops_id`, `Student_ID`, `file_name`, `c_status`) VALUES
(2, 23301525, '1756623883_9._HW__FW_Rectifier_CSE251 (3).pdf', 'approved'),
(2, 23301531, '23301525_Sanjida Afrin Mithila_Sec14 (4).pdf', 'rejected'),
(2, 23301533, 'Resume.pdf', 'approved'),
(3, 23301525, '1756628948_1756544960_9._HW__FW_Rectifier_CSE251.pdf', 'approved'),
(3, 23301531, 'Lecture-7-BJT (1) (1).pdf', 'Approved'),
(3, 23301533, 'Resume (1).pdf', 'Rejected'),
(5, 23301525, '1756018357_23301525_Sanjida Afrin Mithila_Sec14 (3).pdf', 'rejected'),
(5, 23301531, 'Lecture-7-BJT (1).pdf', 'Approved'),
(16, 23301525, '1755429372_Sanjida_Afrin.pdf', 'rejected'),
(17, 23301525, '1756623602_23301525_Sanjida Afrin Mithila_Sec14 (3).pdf', 'pending'),
(18, 23301525, '1756544960_9._HW__FW_Rectifier_CSE251.pdf', 'approved'),
(18, 23301531, 'Lecture-7-BJT (1) (1).pdf', 'Approved'),
(31, 23301531, 'Lecture-7-BJT (1) (1).pdf', 'Approved'),
(34, 23301525, '1756627590_1756544960_9._HW__FW_Rectifier_CSE251.pdf', 'approved'),
(34, 23301531, 'Lecture-7-BJT (1).pdf', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE `career` (
  `career_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `electives` text DEFAULT NULL,
  `online` text DEFAULT NULL,
  `certification` text DEFAULT NULL,
  `beginner_skills` text DEFAULT NULL,
  `intermediate_skills` text DEFAULT NULL,
  `advanced_skills` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `career`
--

INSERT INTO `career` (`career_id`, `name`, `electives`, `online`, `certification`, `beginner_skills`, `intermediate_skills`, `advanced_skills`) VALUES
(1, 'Software Developer', 'CSE 310, CSE 410, CSE 419, CSE 426, CSE 470', 'CS50 (Harvard), Coursera Software Engineering, Udemy Complete Software Developer Bootcamp, EdX Software Engineering Essentials, LinkedIn Learning Software Development, Pluralsight Software Engineering Path, Codecademy Computer Science, Udemy Java Programming Masterclass, Coursera Python for Everybody, MIT OpenCourseWare Intro to CS', 'Oracle Java SE Programmer, Microsoft Certified Software Engineer', 'Programming (C++/ Java/ Python/ C), OOP, Version Control (Git), Documentation', 'Data Structures, Algorithms, Testing (Unit/Integration/Regression), Agile/Scrum, CI/CD, API Design, Design Patterns', 'Software Architecture, System Design, Microservices, Cloud Basics, Performance Optimization'),
(2, 'Web Developer', 'CSE 310, CSE 391, CSE 470', 'FreeCodeCamp Full-Stack Developer, Coursera Full-Stack Web Development Specialization, Udemy PHP & Django Web Development, Udemy Node.js Complete Guide, Udemy React – The Complete Guide, Coursera HTML, CSS, and Javascript for Web Developers, Codecademy Full-Stack Developer, Pluralsight Frontend & Backend Web Dev, LinkedIn Learning Full-Stack Web Development, Udacity Full-Stack Web Developer Nanodegree', 'FreeCodeCamp Responsive Web Design, Google Mobile Web Specialist, Microsoft Certified: Azure Developer Associate', 'HTML, CSS, JavaScript, TypeScript, Responsive Design, Git/GitHub', 'React, Angular, Vue.js, UX/UI Principles, PHP, Django, Node.js, Express, Flask, SQL (MySQL, PostgreSQL), NoSQL (MongoDB, Firebase), AJAX/JSON, Package Managers (npm, yarn)', 'Server-side Rendering, Authentication & Authorization, Docker, CI/CD, Cloud Deployment (AWS, Heroku, Azure), Web Security (OWASP Top 10), Testing (Jest, Mocha)'),
(3, 'Mobile App Developer', 'CSE 310, CSE 391', 'Android Development (Udemy), iOS Development (Stanford), Coursera Mobile App Development, Udemy Flutter & Dart Bootcamp, LinkedIn Learning React Native, Pluralsight Mobile App Dev, Udemy Kotlin for Android, Codecademy Mobile Development, Coursera Swift/iOS, Udacity Android Developer Nanodegree', 'Google Associate Android Developer, Apple App Development Certification', 'Java, Kotlin, Swift, Flutter, React Native, Mobile UI/UX Design, Version Control', 'App Deployment, APIs, Offline Storage, Push Notifications, App Security, Firebase Integration, Testing (JUnit/XCTest), CI/CD', 'Performance Optimization, App Analytics, Cloud Backend Integration'),
(4, 'Game Developer', 'CSE 310, CSE 426', 'Unity Learn, Udemy Unreal Engine Development, Coursera Game Design, Pluralsight Game Dev Path, Udemy C# Unity Masterclass, LinkedIn Learning Game Development, Udemy 2D/3D Game Development, Coursera VR/AR Game Dev, Codecademy C# Basics, Udacity Game Developer Nanodegree', 'Unity Certified Developer, Unreal Engine Certification', 'C++, C#, Unity, Unreal Engine, Animation, Scripting', 'Game Physics, AI for Games, Graphics Programming, Shader Programming, Game Design Patterns, Level Design, Multiplayer Networking, Asset Pipeline, AI Pathfinding', 'VR/AR Integration, Optimization, Debugging, Version Control'),
(8, 'Embedded Systems Engineer', 'CSE 360, CSE 392, CSE 460', 'Udemy Embedded Systems, Coursera Embedded Software, EdX Embedded Systems, LinkedIn Learning Embedded Programming, Pluralsight Embedded Dev, Udemy Microcontroller Programming, Coursera IoT & Embedded Systems, Udacity Embedded Systems, MIT OpenCourseWare Embedded, FutureLearn Embedded Systems Fundamentals', 'ARM Accredited Engineer, Embedded Systems Certification', 'C, C++, Microcontrollers, RTOS, Hardware-Software Interface, Sensors, Actuators', 'Signal Processing, Low-Level Programming, Memory Management, Interrupt Handling, Communication Protocols (UART, SPI, I2C), Debugging, PCB Design', 'Linux Kernel Basics, Embedded Security, Testing, FPGA Basics'),
(9, 'IoT Engineer', 'CSE 360, CSE 461', 'Coursera IoT Specialization, Udemy IoT Developer, EdX IoT Essentials, LinkedIn Learning IoT, Pluralsight IoT Development, Udemy Raspberry Pi IoT, Coursera Industrial IoT, FutureLearn IoT Fundamentals, Udemy ESP32 IoT Projects, IoT Academy Courses', 'Cisco IoT Specialist, AWS IoT Core Certification', 'Microcontrollers, Sensors, Actuators, Python/C++ Programming, Linux, Embedded Linux', 'Networking Protocols (MQTT, CoAP), Wireless Communication (BLE, Wi-Fi, Zigbee), API Development, Data Storage, Device Management, Monitoring & Logging', 'Cloud Integration, Data Analytics, Security for IoT, Edge Computing, OTA Updates'),
(10, 'Database Administrator ', 'CSE 342, CSE 371, CSE 470', 'Oracle SQL Fundamentals, MongoDB University, Coursera Database Management Specialization, Udemy SQL Masterclass, Pluralsight SQL & DBA, LinkedIn Learning DBA Courses, Udemy PostgreSQL Complete, EdX Database Systems, Codecademy SQL, Coursera Cloud Database Admin', 'Oracle Certified Professional, Microsoft Azure Database Administrator', 'SQL, NoSQL (MongoDB, Cassandra, Redis), Database Design & Modeling, Backup & Recovery, Security & Access Control, Version Control', 'Advanced SQL (Joins, Indexing, Stored Procedures), Replication, High Availability, Query Optimization, Performance Tuning, ETL, Data Warehousing, Cloud Database Management (AWS RDS, Azure SQL), Monitoring & Reporting, Scripting (Python/Shell)', 'Disaster Recovery Planning'),
(11, 'Data Analyst', 'CSE 342, CSE 427', 'Coursera Data Analytics, Udemy Python for Data Analysis, LinkedIn Learning Data Analysis, EdX Data Analytics MicroMasters, Pluralsight Data Analysis Path, Codecademy Data Analysis, Udemy Tableau Bootcamp, Coursera Excel to MySQL, DataCamp Data Analyst, IBM Data Analyst Professional', 'IBM Data Analyst, Microsoft Data Analyst Associate', 'SQL, Excel, Python, R, Data Cleaning, Data Wrangling', 'Data Visualization (Matplotlib, Seaborn, Tableau, Power BI), SQL Joins & Aggregations, Hypothesis Testing, Time Series Analysis, Feature Engineering, Dashboard Design', 'Statistics, Probability, Reporting, Communication Skills, Business Analysis'),
(12, 'Data Scientist', 'CSE 310, CSE 424, CSE 427', 'Coursera Data Science Specialization, Kaggle Micro-Courses, Udemy Data Science Bootcamp, LinkedIn Learning Data Science, EdX Data Science Essentials, DataCamp Data Science, Pluralsight Data Science Path, Udemy Python for Data Science, Coursera ML Specialization, MIT OpenCourseWare Data Science', 'IBM Data Science, Microsoft Data Scientist Associate', 'Python, R, SQL, Data Visualization, Python Libraries (Pandas, Numpy, Scikit-learn)', 'Machine Learning (Supervised/Unsupervised), Statistics, Feature Engineering, Model Evaluation, Cross-Validation, Dimensionality Reduction, NLP, Computer Vision, Regression & Classification, Experiment Tracking', 'Deep Learning (TensorFlow, Keras, PyTorch), Big Data Tools (Hadoop, Spark), Cloud ML Services'),
(13, 'Machine Learning Engineer', 'CSE 310, CSE 425, CSE 427, CSE 428, CSE 431', 'Coursera ML (Andrew Ng), fast.ai ML Course, Udemy ML Bootcamp, LinkedIn Learning ML Path, Pluralsight ML, DataCamp Machine Learning, EdX ML Essentials, MIT OpenCourseWare ML, Udemy Deep Learning A-Z, Coursera AI For Everyone', 'AWS ML Specialty, TensorFlow Developer Certificate', 'Python, Scikit-learn, TensorFlow, Keras, PyTorch, Data Preprocessing, Feature Engineering', 'Hyperparameter Optimization, Cross-Validation, Regression, Classification, NLP, Computer Vision, Reinforcement Learning, Model Deployment (Flask, FastAPI), Experiment Tracking', 'Cloud ML Services (AWS SageMaker, GCP AI), Model Optimization, Algorithm Implementation'),
(14, 'AI Engineer', 'CSE 425, CSE 427, CSE 428, CSE 431, CSE 432', 'DeepLearning.AI TensorFlow, Udacity AI Engineer, Coursera AI For Everyone, Udemy AI & Deep Learning, LinkedIn Learning AI, Pluralsight AI Fundamentals, EdX AI MicroMasters, Fast.ai Deep Learning, MIT OpenCourseWare AI, DataCamp AI Courses', 'TensorFlow Developer, AWS ML Specialty', 'Neural Networks, CNN, RNN, LSTM, Transformers, Python, PyTorch, TensorFlow', 'Deep Learning, NLP, Computer Vision, Model Deployment, Algorithm Optimization, GPU Programming, Transfer Learning, Speech Recognition, Reinforcement Learning, Model Tuning, Cloud AI Services', 'AI Ethics, AI Research Methodology'),
(16, 'Big Data Engineer', 'CSE 342, CSE 427', 'Big Data Specialization (Coursera), Cloudera Training, Udemy Big Data Bootcamp, LinkedIn Learning Big Data, Pluralsight Big Data, EdX Big Data Essentials, DataCamp Big Data, Udemy Hadoop & Spark, Coursera Data Engineering on Google Cloud, Udacity Data Engineering Nanodegree', 'Cloudera Data Engineer, AWS Big Data Specialty', 'Hadoop, Spark, Scala, Python, SQL, NoSQL, Linux, Scripting', 'ETL, Data Pipelines, Data Warehousing, Streaming Data (Kafka), Data Modeling, Monitoring, Automation, Performance Optimization, Distributed Systems', 'Cloud Big Data Services, Data Governance'),
(18, 'Systems Administrator', 'CSE 342, CSE 360, CSE 462', 'Linux Foundation Courses, Microsoft Server Training, Udemy SysAdmin Bootcamp, Coursera IT Infrastructure, LinkedIn Learning Systems Admin, Pluralsight Systems Admin, Udemy Windows Server, EdX Systems Administration, Codecademy IT Basics, FutureLearn IT Admin Essentials', 'RHCSA, CompTIA Linux+, Microsoft MCSA', 'Linux/Windows Server, Networking, Scripting (Python, Bash), Troubleshooting, Documentation', 'Virtualization, Security, Monitoring & Logging, Backup & Recovery, Active Directory, Patch Management, Configuration Management, Firewalls, CI/CD Basics', 'Cloud Services, Automation'),
(19, 'Systems Analyst', 'CSE 371, CSE 470, CSE 471', 'Coursera Systems Analysis, Udemy Business Analysis, LinkedIn Learning Systems Analyst, Pluralsight Systems Analysis, EdX Systems Design, FutureLearn Systems Analyst, Udemy ERP Analysis, Coursera Agile Systems, Codecademy SQL for Analysts, Udemy Technical Writing for Analysts', 'IIBA ECBA, Certified Business Analyst', 'Requirements Gathering, UML, System Design, SQL, Documentation', 'Business Process Modeling, Software Testing, Data Modeling, Agile Methodologies, Process Improvement, Project Management, Technical Writing', 'ERP Knowledge, Risk Analysis, Communication'),
(20, 'Network Engineer', 'CSE 342, CSE 360, CSE 490', 'Cisco Networking Academy, Udemy CCNA, Coursera Network Engineering, Pluralsight Networking, LinkedIn Learning Network Engineering, Udemy Network Fundamentals, EdX Networking Essentials, Codecademy Networking Basics, FutureLearn Networking, Udemy Advanced Networking', 'Cisco CCNA, CompTIA Network+', 'TCP/IP, LAN/WAN, Routing & Switching, VPN, Wireless Networks, Network Monitoring (Nagios, SolarWinds), VLAN', 'Firewalls, Network Security, QoS, Load Balancing, Network Design, Troubleshooting, Protocol Analysis, Network Automation (Python/Ansible)', 'SDN, Cloud Networking'),
(27, 'Business Intelligence Developer', 'CSE 342, CSE 371', 'Coursera BI Developer Specialization, Udemy Power BI, LinkedIn Learning Power BI & Tableau, Pluralsight BI, EdX BI Analytics, DataCamp BI Analytics, Udemy Tableau, Coursera Data Visualization, Codecademy Data Analysis & Visualization, FutureLearn Business Analytics', 'Microsoft Certified: Data Analyst, Tableau Desktop Specialist', 'SQL, Data Cleaning, Data Visualization, Dashboard Design, Reporting, KPI Metrics, Communication Skills', 'Data Warehousing, ETL, Power BI, Tableau, Data Modeling, SQL Optimization, DAX/MDX, Python/R for Analysis', 'Data Governance, Analytics'),
(29, 'Systems Analyst', 'CSE 371, CSE 470, CSE 471', 'Coursera Systems Analysis, Udemy Business Analysis, LinkedIn Learning Systems Analyst, Pluralsight Systems Analysis, EdX Systems Design, FutureLearn Systems Analyst, Udemy ERP Analysis, Coursera Agile Systems, Codecademy SQL for Analysts, Udemy Technical Writing for Analysts', 'IIBA ECBA, Certified Business Analyst', 'Requirements Gathering, UML, System Design, SQL, Documentation', 'Business Process Modeling, Software Testing, Data Modeling, Agile Methodologies, Process Improvement, Project Management, Technical Writing', 'ERP Knowledge, Risk Analysis, Communication'),
(31, 'Cloud Engineer', 'CSE 342, CSE 462', 'AWS Cloud Practitioner, Azure Fundamentals, Udemy Cloud Engineer Bootcamp, LinkedIn Learning Cloud, Coursera AWS Cloud Specialization, Pluralsight Cloud Engineer, EdX Cloud Architecture, Udemy Kubernetes, FutureLearn Cloud Computing, Udacity Cloud DevOps Engineer', 'AWS Solutions Architect, Microsoft Azure Administrator', 'AWS, Azure, GCP, Docker, Kubernetes, Serverless, Scripting', 'CI/CD, Cloud Security, Infrastructure as Code (Terraform, CloudFormation), Monitoring, Automation, Load Balancing, Backup & Recovery, Multi-Cloud Strategy, Identity & Access Management, Cloud Migration', 'Cloud Architecture Design, Scalability Planning, Disaster Recovery, Cost Optimization, Cloud Governance'),
(32, 'DevOps Engineer', 'CSE 310, CSE 410, CSE 470', 'Udemy DevOps Bootcamp, LinkedIn Learning DevOps, Coursera DevOps Specialization, Pluralsight DevOps, EdX DevOps, Udemy Kubernetes & Docker, Coursera CI/CD Pipelines, FutureLearn DevOps, Codecademy DevOps, Udacity DevOps Nanodegree', 'AWS DevOps Engineer, Docker Certified Associate', 'CI/CD, Jenkins, Git/GitLab, Docker, Kubernetes, Scripting (Python/Bash)', 'Monitoring (Prometheus, Grafana), Logging (ELK Stack), Infrastructure as Code, Automation, Agile/Scrum, Microservices Deployment, Version Control, Testing, Performance Monitoring', 'Cloud Platforms (AWS/Azure/GCP), Security Best Practices'),
(33, 'Cloud Security Engineer', 'CSE 462, CSE 342', 'AWS Security Specialty, Azure Security Engineer, Udemy Cloud Security, Coursera Cloud Security, Pluralsight Cloud Security, LinkedIn Learning Cloud Security, EdX Cloud Security, FutureLearn Cloud Security, Udemy DevSecOps, Codecademy Security', 'AWS Security Specialty, Microsoft Azure Security Engineer', 'Cloud Security, IAM, Network Security, Logging & Monitoring, Scripting', 'Compliance, Encryption, Incident Response, Cloud Governance, Cloud Audit, Security Automation, DevSecOps, Risk Assessment', 'Cloud Architecture, Multi-Cloud Security'),
(34, 'Cybersecurity Analyst', 'CSE 342, CSE 360, CSE 462', 'Cisco Cybersecurity Essentials, Udemy CompTIA Security+, Coursera Cybersecurity Analyst, LinkedIn Learning Cybersecurity, Pluralsight Cybersecurity, EdX Cybersecurity, Udemy Ethical Hacking, FutureLearn Cybersecurity, Codecademy Security, Udemy Penetration Testing', 'CompTIA Security+, CEH, Cisco CyberOps Associate', 'Networking, Linux, Firewalls, Ethical Hacking, Penetration Testing, Malware Analysis, Threat Intelligence, Log Analysis', 'Incident Response, Risk Assessment, Vulnerability Scanning, SIEM Tools, Cryptography, Security Policies, Cloud Security', 'Compliance (ISO, NIST)'),
(35, 'Ethical hacking', 'CSE 342, CSE 462', 'EC-Council CEH Training, Offensive Security Training, Udemy Ethical Hacking Bootcamp, Coursera Penetration Testing, LinkedIn Learning Ethical Hacking, Pluralsight Ethical Hacking, Udemy Kali Linux, EdX Cybersecurity, FutureLearn Pen Testing, Codecademy Security Essentials', 'CEH, OSCP', 'Kali Linux, Metasploit, Network Scanning, Wireshark, Social Engineering, Password Cracking, Reporting & Documentation', 'Vulnerability Assessment, Exploit Development, Reverse Engineering, Web Application Security (OWASP Top 10)', 'Cloud Security, API Security, Security Auditing'),
(36, 'Blockchain Developer', 'CSE 310, CSE 427', 'Solidity by Example, Coursera Blockchain Basics, Udemy Ethereum & Solidity, LinkedIn Learning Blockchain, Pluralsight Blockchain Development, Udemy Smart Contracts, Coursera Blockchain Specialization, EdX Blockchain Fundamentals, FutureLearn Blockchain, Udacity Blockchain Developer Nanodegree', 'Ethereum Developer Certification, Blockchain Council Cert', 'Solidity, Ethereum, Smart Contracts, DApps, Web3.js, Truffle/Hardhat', 'Blockchain Architecture, Consensus Algorithms, Peer-to-Peer Networking, Security Auditing, Gas Optimization, NFT Development, Layer-2 Solutions', 'DeFi Protocols, Testing & Deployment'),
(37, 'Robotics Engineer', 'CSE 460, CSE 461', 'Robotics Specialization (Coursera), Udacity Robotics, EdX Robotics, Udemy ROS, LinkedIn Learning Robotics, Pluralsight Robotics, Coursera Industrial Robotics, FutureLearn Robotics, MIT OpenCourseWare Robotics, Udemy Robotics Projects', 'ROS Developer Certification, Certified Robotics Programmer', 'C++, Python, ROS, Sensors, Actuators, Control Systems', 'Path Planning, Kinematics, Dynamics, Robot Simulation, AI/ML for Robotics, SLAM, Vision Sensors, Robotics Algorithms, Embedded Systems, Testing, Debugging', 'Industrial Automation, Real-Time Systems'),
(38, 'IT Support Specialist', ' CSE 342, CSE 360', 'Google IT Support Professional, LinkedIn Learning IT Support, Udemy IT Support, Coursera IT Helpdesk, Pluralsight IT Support, EdX IT Support, FutureLearn IT Support, Udemy Networking for IT Support, Codecademy IT Fundamentals, Coursera IT Support Specialist', 'Google IT Support, CompTIA A+', 'Troubleshooting, Windows/Linux OS, Customer Support, Hardware/Software Maintenance, Remote Support, Ticketing Systems, Backup & Recovery, Documentation, Communication Skills', 'Networking, Active Directory, Cloud Services, Scripting, IT Security Basics, Monitoring Tools', 'Incident Response, IT Automation, System Optimization'),
(39, 'Computer Hardware Engineer', 'CSE 360, CSE 460, CSE 462', 'Udemy Computer Architecture, Coursera Hardware Design, LinkedIn Learning Hardware, Pluralsight Hardware, EdX Computer Architecture, FutureLearn Hardware Engineering, Udemy FPGA Design, Coursera VLSI Design, Udacity Computer Hardware, MIT OpenCourseWare Hardware', 'Certified Hardware Professional, CompTIA IT Fundamentals', 'Digital Logic, Microprocessors, Embedded Systems, Low-Level Programming, Optimization', 'PCB Design, Hardware-Software Interface, Testing, Debugging, Signal Processing, Microcontroller Programming, Hardware Simulation, Electronics Design, Circuit Analysis', 'VLSI, FPGA');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` varchar(10) NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Difficulty` enum('Easy','Average','Hard') NOT NULL,
  `EasyPercentage` int(11) DEFAULT NULL CHECK (`EasyPercentage` >= 0 and `EasyPercentage` <= 100),
  `AveragePercentage` int(11) DEFAULT NULL CHECK (`AveragePercentage` >= 0 and `AveragePercentage` <= 100),
  `HardPercentage` int(11) DEFAULT NULL CHECK (`HardPercentage` >= 0 and `HardPercentage` <= 100),
  `Unlock_Courses` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `CourseName`, `Difficulty`, `EasyPercentage`, `AveragePercentage`, `HardPercentage`, `Unlock_Courses`, `content`) VALUES
('CSE110', 'Programming Language I', 'Easy', 85, 10, 5, NULL, 'Introduction to programming, variables, data types, operators, control statements, functions, arrays, basic I/O'),
('CSE111', 'Programming Language II', 'Easy', 78, 15, 7, 'CSE220', 'Object-oriented programming, classes and objects, inheritance, polymorphism, file handling, exception handling'),
('CSE220', 'Data Structures', 'Hard', 15, 20, 65, 'CSE221', 'Stacks, queues, linked lists, trees, graphs, sorting algorithms, searching algorithms, recursion'),
('CSE221', 'Algorithms', 'Hard', 12, 25, 63, 'CSE321,CSE370,CSE422,CSE331', 'Algorithm analysis, greedy algorithms, divide-and-conquer, dynamic programming, graph algorithms, complexity theory'),
('CSE230', 'Discrete Mathematics', 'Hard', 18, 22, 60, 'CSE220', 'Logic, sets, relations, functions, combinatorics, graph theory, Boolean algebra, proof techniques'),
('CSE250', 'Circuits and Electronics', 'Easy', 82, 10, 8, 'CSE251', 'Basic circuit theory, Ohm’s law, Kirchhoff’s laws, AC/DC analysis, semiconductor basics'),
('CSE251', 'Electronic Devices and Circuits', 'Hard', 10, 28, 62, 'CSE260,CSE350', 'Diodes, transistors, FETs, operational amplifiers, amplifier circuits, biasing techniques'),
('CSE260', 'Digital Logic Design', 'Easy', 90, 7, 3, 'CSE340,CSE461,CSE460', 'Number systems, Boolean logic, combinational circuits, sequential circuits, flip-flops, counters, registers'),
('CSE320', 'Data Communications', 'Average', 25, 55, 20, 'CSE421', 'Data transmission basics, network models, error detection, multiplexing, switching, protocols'),
('CSE321', 'Operating System', 'Easy', 88, 9, 3, NULL, 'Process management, memory management, file systems, I/O systems, deadlocks, scheduling algorithms'),
('CSE330', 'Numerical Methods', 'Easy', 80, 12, 8, NULL, 'Numerical approximation, interpolation, root finding, numerical integration, differential equations'),
('CSE331', 'Automata and Computability', 'Easy', 86, 8, 6, 'CSE420', 'Finite automata, regular expressions, context-free grammars, Turing machines, decidability'),
('CSE340', 'Computer Architecture', 'Easy', 84, 12, 4, 'CSE341', 'CPU organization, memory hierarchy, pipelining, instruction sets, cache design, parallel processing'),
('CSE341', 'Microprocessors', 'Easy', 83, 11, 6, 'CSE360', 'Microprocessor architecture, instruction sets, assembly language programming, interfacing techniques'),
('CSE350', 'Digital Electronics and Pulse Techniques', 'Hard', 13, 20, 67, NULL, 'Digital ICs, logic families, timing analysis, flip-flop design, pulse techniques, signal processing basics'),
('CSE360', 'Computer Interfacing', 'Hard', 14, 22, 64, NULL, 'Microcontroller interfacing, sensors and actuators, serial communication, I/O programming'),
('CSE370', 'Database Systems', 'Easy', 91, 6, 3, 'CSE471', 'HTML, CSS, SQL, Php'),
('CSE420', 'Compiler Design', 'Hard', 11, 27, 62, NULL, 'Lexical analysis, parsing, syntax-directed translation, semantic analysis, code generation, optimization'),
('CSE421', 'Computer Networks', 'Hard', 17, 18, 65, NULL, 'Networking models, routing algorithms, TCP/IP, network security, wireless communication'),
('CSE422', 'Artificial Intelligence', 'Average', 28, 50, 22, NULL, 'Search algorithms, knowledge representation, machine learning basics, expert systems, AI applications,LISP and PROLOG Language, Python Programming (NumPy, Pandas)'),
('CSE423', 'Computer Graphics', 'Average', 32, 48, 20, NULL, '2D/3D graphics, transformations, projections, rendering, shading, animation basics,CPU and GPU differ, Logic gates, Boolean Algebra, Geometry, 3D Coordinate Systems, Basic calculus, C+/C++ Programming, APIs (OpenGL, Vulkan, DirectX)'),
('CSE427', 'Machine Learning Tools and Techniques', 'Average', 30, 50, 20, NULL, 'Python Programming (NumPy, Pandas), Data Preprocessing (cleaning, normalisation, encoding), ML Libraries (PyTorch)'),
('CSE428', 'Digital Signal Processing', 'Hard', 15, 20, 65, NULL, 'First Fourier Transform (FFT), Discrete Cosine Transform (DCT), Karhumen and Loeve Transform (KLT)'),
('CSE460', 'VLSI Design', 'Hard', 9, 18, 73, NULL, 'VLSI design flow, CMOS technology, layout design, logic synthesis, fabrication process'),
('CSE461', 'Introduction to Robotics', 'Easy', 87, 8, 5, NULL, 'Robotics basics, sensors and actuators, kinematics, path planning, control systems'),
('CSE470', 'Software Engineering', 'Hard', 16, 14, 70, 'CSE471', 'Software development life cycle, requirement analysis, design patterns, testing, project management'),
('CSE471', 'Systems Analysis and Design', 'Hard', 12, 16, 72, NULL, 'System requirements, feasibility analysis, modeling techniques, system design, maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `co_ops`
--

CREATE TABLE `co_ops` (
  `co_ops_id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cgpa` decimal(3,2) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `credits_earned` int(11) DEFAULT NULL,
  `work_hours` int(11) DEFAULT NULL,
  `pay_rate` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_credit` int(11) DEFAULT NULL,
  `approve_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `co_ops`
--

INSERT INTO `co_ops` (`co_ops_id`, `title`, `description`, `cgpa`, `location`, `credits_earned`, `work_hours`, `pay_rate`, `start_date`, `end_date`, `min_credit`, `approve_by`) VALUES
(1, 'Software Development Co-op', 'Work on real-world software projects, coding, and teamwork.', 3.60, 'Chittagong', 6, 20, 25000, '2025-09-01', '2026-01-15', 30, 4),
(2, 'Web Development Co-op', 'Develop and maintain web applications and websites.', 3.50, 'Banani', 5, 18, 22000, '2025-09-05', '2026-01-10', 25, 4),
(3, 'Data Science Co-op', 'Hands-on industry experience in data analysis, machine learning, and visualization. Students work with real datasets to build models, generate insights, and support data-driven decision-making.', 3.55, 'Banani', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 4),
(4, 'Cybersecurity Co-op', 'Assist in network security monitoring and vulnerability assessments.', 3.60, 'Narayanganj', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 6),
(5, 'AI & ML Co-op', 'Developing models in Python, TensorFlow, and PyTorch for real-world AI applications.', 3.65, 'Gulshan', 4, 16, 25000, '2025-11-05', '2026-03-20', 60, 4),
(6, 'Database Management Co-op', 'Design, maintain, and optimize databases for projects.', 3.50, 'Tejgaon', 5, 20, 24000, '2025-09-01', '2026-01-15', 28, 4),
(7, 'Cloud Computing Co-op', 'Assist with cloud infrastructure setup and management.', 3.55, 'Gulshan', 6, 20, 26000, '2026-04-10', '2026-12-15', 28, 4),
(8, 'Mobile App Development Co-op', 'Develop mobile applications for Android and iOS platforms.', 3.60, 'Dhaka', 6, 20, 25000, '2025-09-01', '2026-01-15', 30, 6),
(9, 'Software Testing Co-op', 'Perform software testing, QA, and bug tracking.', 3.50, 'Banani', 5, 18, 22000, '2025-09-05', '2026-01-10', 25, 4),
(10, 'Networking & IT Support Co-op', 'Assist IT support and networking teams in troubleshooting.', 3.45, 'Mymensingh', 4, 18, 20000, '2025-09-01', '2025-12-20', 20, 5),
(11, 'DevOps Co-op', 'Work with development and operations teams to automate deployment.', 3.60, 'Banani', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 4),
(12, 'Software Architecture Co-op', 'Assist in designing software system architecture and integration.', 3.55, 'Dhanmondi', 7, 22, 28000, '2025-09-05', '2026-01-20', 30, 5),
(13, 'IT Project Management Co-op', 'Support project planning, tracking, and delivery of IT projects.', 3.50, 'Uttara', 6, 20, 25000, '2025-09-01', '2026-01-15', 28, 4),
(14, 'Cloud Security Co-op', 'Monitor and maintain security for cloud-based systems.', 3.60, 'Mohakhali', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 4),
(15, 'AI Research Co-op', 'Conduct AI research and prototype new machine learning solutions.', 3.65, 'Badda', 7, 22, 28000, '2025-09-05', '2026-01-20', 30, 6),
(16, 'Software Development Co-op', 'Support the design and implementation of mobile applications for Android and iOS, including API integration, UI/UX development, and app testing.', 3.60, 'Dhanmondi', 9, 23, 30000, '2025-12-01', '2026-03-15', 20, 4),
(17, 'Web Development Co-op', 'Practical experience in designing, coding, and maintaining web applications. Students work with front-end and back-end technologies to build responsive, user-friendly websites.', 3.50, 'Gulshan', 5, 18, 22000, '2025-09-05', '2026-01-10', 25, 7),
(18, 'Data Science Co-op', 'Work on data analysis, machine learning models, and visualization.', 3.55, 'Gulshan', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 4),
(19, 'Cybersecurity Co-op', 'Assist in network security monitoring and vulnerability assessments.', 3.60, 'Dhaka', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 7),
(20, 'AI & ML Co-op', 'Develop AI and machine learning models for practical applications.', 3.65, 'Dhanmondi', 7, 22, 28000, '2025-09-05', '2026-01-20', 30, 5),
(21, 'Database Management Co-op', 'Design, maintain, and optimize databases for projects.', 3.50, 'Banani', 5, 20, 24000, '2025-09-01', '2026-01-15', 28, 4),
(22, 'Cloud Computing Co-op', 'Assist with cloud infrastructure setup and management.', 3.55, 'Tejgaon', 6, 20, 26000, '2025-09-10', '2026-01-15', 28, 4),
(23, 'Mobile App Development Co-op', 'Develop mobile applications for Android and iOS platforms.', 3.60, 'Bashundhara', 6, 20, 25000, '2025-09-01', '2026-01-15', 30, 4),
(24, 'Software Testing Co-op', 'Perform software testing, QA, and bug tracking.', 3.50, 'Dhanmondi', 5, 18, 22000, '2025-09-05', '2026-01-10', 25, 4),
(25, 'Networking & IT Support Co-op', 'Assist IT support and networking teams in troubleshooting.', 3.45, 'Banani', 4, 18, 20000, '2025-09-01', '2025-12-20', 20, 7),
(26, 'DevOps Co-op', 'Work with development and operations teams to automate deployment.', 3.30, 'Bashundhara', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 7),
(27, 'Software Architecture Co-op', 'Assist in designing software system architecture and integration.', 3.35, 'Banani', 7, 22, 28000, '2025-09-05', '2026-01-20', 30, 6),
(28, 'IT Project Management Co-op', 'Support project planning, tracking, and delivery of IT projects.', 3.30, 'Badda', 6, 20, 25000, '2025-09-01', '2026-01-15', 28, 4),
(29, 'Cloud Security Co-op', 'Monitor and maintain security for cloud-based systems.', 3.70, 'Dhanmondi', 6, 22, 27000, '2025-09-01', '2026-01-15', 30, 7),
(30, 'AI Research Co-op', 'Conduct AI research and prototype new machine learning solutions.', 3.40, 'Banani', 7, 22, 28000, '2025-09-05', '2026-01-20', 30, 5),
(31, 'Software Development Co-op', 'Work on real-world software projects, coding, and teamwork.', 3.60, 'Gulshan', 6, 20, 26000, '2025-10-01', '2026-02-15', 30, 4),
(32, 'Data Science Co-op', 'Work on data analysis, machine learning models, and visualization.', 3.55, 'Badda', 6, 22, 28000, '2025-10-05', '2026-02-20', 30, 5),
(33, 'Cybersecurity Co-op', 'Assist in network security monitoring and vulnerability assessments.', 3.60, 'Badda', 6, 22, 27500, '2025-10-01', '2026-02-15', 30, 4),
(34, 'AI & ML Co-op', 'Hands-on experience in developing and applying machine learning models and AI solutions. Students work with real datasets to build, train, and evaluate algorithms for practical applications.', 3.65, 'Banani', 7, 22, 28500, '2025-10-05', '2026-02-20', 30, 4),
(35, 'DevOps Co-op', 'Hands-on experience in automating software deployment, managing cloud infrastructure, and ensuring continuous integration and delivery (CI/CD) for scalable applications.', 3.60, 'Uttara', 6, 22, 27200, '2025-10-01', '2026-02-15', 30, 7),
(36, 'Database Management Co-op', 'Design, maintain, and optimize databases for projects.', 3.55, 'Mirpur', 6, 20, 24500, '2025-10-05', '2026-02-20', 28, 5),
(37, 'Cloud Computing Co-op', 'Assist with cloud infrastructure setup and management.', 3.50, 'Gulshan', 6, 21, 26500, '2025-10-01', '2026-02-15', 28, 4),
(38, 'Mobile App Development Co-op', 'Develop mobile applications for Android and iOS platforms.', 3.60, 'Banani', 6, 20, 25500, '2025-10-05', '2026-02-20', 30, 4),
(39, 'Software Testing Co-op', 'Perform software testing, QA, and bug tracking.', 3.45, 'Mohakhali', 5, 18, 22500, '2025-10-01', '2026-01-25', 25, 7),
(40, 'Networking & IT Support Co-op', 'Assist IT support and networking teams in troubleshooting.', 3.35, 'Gulshan', 4, 18, 20500, '2025-10-05', '2026-01-15', 20, 5),
(41, 'IT Project Management Co-op', 'Support project planning, tracking, and delivery of IT projects.', 3.50, 'Banani', 6, 20, 25500, '2025-10-01', '2026-02-15', 28, 4),
(42, 'Software Architecture Co-op', 'Assist in designing software system architecture and integration.', 3.65, 'Gulshan', 7, 22, 28500, '2025-10-05', '2026-02-20', 30, 4),
(43, 'Cloud Security Co-op', 'Monitor and maintain security for cloud-based systems.', 3.70, 'Dhanmondi', 6, 22, 27500, '2025-10-01', '2026-02-15', 30, 4),
(44, 'AI Research Co-op', 'Practical experience in exploring advanced AI concepts, conducting experiments, and developing innovative models. Students collaborate on research projects to push forward new applications of artificial intelligence.', 3.60, 'Banani', 7, 22, 28000, '2025-10-05', '2026-02-20', 60, 4),
(45, 'Web Development Co-op', 'Develop and maintain web applications and websites.', 3.55, 'Banani', 5, 18, 23000, '2025-10-01', '2026-01-25', 25, 4);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `fac_id` int(11) NOT NULL,
  `fac_initial` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`fac_id`, `fac_initial`, `name`, `email`, `password`) VALUES
(4, 'ZHR', 'Zahid Reza', 'zahid@gmail.com', '$2y$10$REAZPSJ5LXCyoZDvVQzGiOB.8zTZq3ahTyz4ccnL8tiqhrYdA0Vsq'),
(5, 'DPU', 'Shoaib Dipu', 'shoaib@gmail.com', '$2y$10$ozKPCtGTuFGjfV5djGC79OhK4uXhLTQfLv1VtIG9t8vRF3G3sHf8C'),
(6, 'FUL', 'Shafiul Alam', 'shafiul@gmail.com', '$2y$10$ohl.eNk0zVSoVveBoKDky.4nM.BK0FDGFBaPnGz6ZU4Y5.cuT1zk6'),
(7, 'PML', 'Rifat Alam Pomil', 'rifat@gmail.com', '$2y$10$4SzhHWoPE0mM93/F4qGz0.08Fyy/LoziRxFvNJQSmXI3y0iES8UQW'),
(8, 'BAS', 'Mobashra Abeer', 'mobashra@gmail.com', '$2y$10$atCc1Ka2/2bJh1LmvUv7s.wsxqJJ3QqeK2Vh0TSHak3kjCXONDNjO'),
(9, 'SJD', 'Sanjida', 'sanjida@gmail.com', '$2y$10$XCfyRQDR8k5DtBRo0oaBkOnEXizS5mhFfousjwg3mONi2W0JGSQTq'),
(10, 'SAM', 'Mithila', 'mithila@gmail.com', '$2y$10$1QIVKRLqLa8w1XcRPOPKrOhxnD2DyMIPrTjIUuGdYVdH478eeFTkW');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fac_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `title`, `description`, `fac_id`) VALUES
(1, 'Diagnosis early autism', 'Using ML', 4),
(3, 'Turing machine', 'A web app that simulates a single-tape Turing machine with step-by-step execution, tape visualization, and accept/reject detection.\r\n', 4),
(4, 'BRAC-HYPHEN', 'Making database for university', 4),
(5, 'Autonomous Drone Navigation', 'Drone navigates and avoids obstacles using computer vision and AI.', 4),
(6, 'Intelligent Traffic Management System', 'Use real-time traffic data, computer vision, and predictive analytics to optimize traffic lights and reduce congestion', 4),
(7, 'Natural Language Question Answering System', 'Designed an advanced NLP-based system capable of answering domain-specific questions (e.g., legal, educational, or medical) by retrieving context-aware answers from large text datasets. Leveraged transformer-based models such as BERT or GPT variants', 4),
(8, 'AI-Powered Healthcare Diagnosis Assistant', 'Built a predictive model that analyzes medical imaging (X-rays, MRIs) and patient health data to assist doctors in early diagnosis of diseases such as pneumonia or cancer. The system uses explainable AI techniques to highlight affected regions in scans.', 4),
(9, 'Multilingual Speech-to-Text and Translation Model', 'Developed a speech recognition system that converts audio into text and translates it into multiple languages using transformer-based sequence-to-sequence models.', 4),
(10, 'Drug Discovery using Deep Learning', 'Implemented a deep learning model to predict molecular properties and potential drug interactions, accelerating the drug discovery process.', 4),
(11, 'Cloud Infrastructure Security Automation', 'Implement an automated system that scans cloud environments (AWS/Azure/GCP) for misconfigurations, compliance issues, and vulnerabilities.', 4),
(12, 'AI-Driven Cyber Threat Intelligence Platform', 'Research on using AI to collect, analyze, and predict emerging cyber threats from dark web forums, malware repositories, and network traffic', 4),
(13, 'AI-Driven Cyber Threat Intelligence Platform', 'Research on using AI to collect, analyze, and predict emerging cyber threats from dark web forums, malware repositories, and network traffic.', 4),
(14, 'Quantum-Inspired Optimization for Logistics', 'Develop a logistics optimization platform inspired by quantum computing algorithms (QAOA, annealing) to solve problems like route planning and supply chain optimization.', 4),
(15, 'AI-Powered Climate Modeling Simulator', 'Develop an AI system to simulate climate change effects on specific regions, predicting floods, heatwaves, and crop yields.', 4),
(16, 'ABC', 'xyz', 8);

-- --------------------------------------------------------

--
-- Table structure for table `projectskill`
--

CREATE TABLE `projectskill` (
  `project_id` int(11) NOT NULL,
  `skill_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectskill`
--

INSERT INTO `projectskill` (`project_id`, `skill_code`) VALUES
(1, 1),
(1, 2),
(1, 3),
(3, 5),
(3, 6),
(3, 7),
(3, 9),
(4, 5),
(5, 5),
(5, 10),
(5, 12),
(6, 2),
(6, 4),
(6, 16),
(7, 2),
(7, 11),
(7, 16),
(8, 4),
(8, 12),
(8, 16),
(9, 2),
(9, 4),
(9, 12),
(9, 16),
(10, 12),
(10, 13),
(10, 16),
(10, 17),
(11, 15),
(11, 16),
(13, 4),
(13, 11),
(13, 12),
(13, 15),
(13, 16),
(14, 14),
(14, 16),
(15, 11),
(15, 12),
(15, 14),
(15, 16),
(16, 2),
(16, 10),
(16, 11),
(16, 12),
(16, 13),
(16, 14),
(16, 15),
(16, 17);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `project_id` int(11) NOT NULL,
  `student_ID` int(11) NOT NULL,
  `status` varchar(30) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`project_id`, `student_ID`, `status`) VALUES
(1, 23301525, 'Accepted'),
(3, 23301525, 'Accepted'),
(4, 23301525, 'Accepted'),
(5, 23301525, 'Accepted'),
(6, 23301531, 'Accepted'),
(6, 23301533, 'Accepted'),
(7, 23301531, 'Accepted'),
(7, 23301533, 'Accepted'),
(8, 23301531, 'Accepted'),
(8, 23301533, 'Rejected'),
(9, 23301533, 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `select_career`
--

CREATE TABLE `select_career` (
  `student_ID` int(11) NOT NULL,
  `career_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `select_career`
--

INSERT INTO `select_career` (`student_ID`, `career_id`) VALUES
(23301525, 11),
(23301525, 35),
(23301531, 2),
(23301533, 13);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skill_code` int(11) NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_code`, `skill_name`) VALUES
(1, 'Java'),
(2, 'NLP'),
(3, 'ML'),
(4, 'AI'),
(5, 'Python'),
(6, 'SQL'),
(7, 'HTML'),
(8, 'JavaScript'),
(9, 'Automata'),
(10, 'C++'),
(11, 'Machine Learning'),
(12, 'Deep Learning'),
(13, 'Data Analysis'),
(14, 'Cloud Computing'),
(15, 'Cybersecurity'),
(16, 'Python/Java'),
(17, 'Neural Network');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_ID` int(11) NOT NULL,
  `StudentName` varchar(100) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_ID`, `StudentName`, `Password`, `Email`) VALUES
(23301496, 'Mayesha Shayera', '$2y$10$CneWEHfSwdtT7dcsTuZ0EeD2QWdmiiOKh6WgzgcAHaf/2SmXd5C2.', 'mayesha.shayera.hasan@g.bracu.ac.bd'),
(23301525, 'Sanjida', '$2y$10$ZelY.irlQbZRc8NleKyHz.XgpuLFfemegGRYuMSiak30LU5xDyUum', 'mithilasanjida@gmail.com'),
(23301529, 'Mehzan', '$2y$10$wBXc7HjTkTwaI71Z5wuVOOaLId3gr1J1BKddXtA.zLDysNQ8ly/1y', 'mehzan@gmail.com'),
(23301531, 'Sanji', '$2y$10$MffNFYRv1cAOwXVtiH10vOGGKbvNmIb8T6e7tm9NEbripYSn0M/72', 'sanji@gmail.com'),
(23301532, 'Samantha', '$2y$10$JaSOBQY7zceHwOMdJgSRWeidCiw6CcPmAlrEohkubuyf5aLCuQ/Ee', 'samantha@gmail.com'),
(23301533, 'Mithila', '$2y$10$ukoxCiQ9cDHR/TAv1MxKn.6i8WuDtfA8fuVKiQ8PYRndl/BL.aLLe', 'mithilaa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `studentskill`
--

CREATE TABLE `studentskill` (
  `student_ID` int(11) NOT NULL,
  `skill_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentskill`
--

INSERT INTO `studentskill` (`student_ID`, `skill_code`) VALUES
(23301496, 5),
(23301496, 6),
(23301496, 7),
(23301496, 8),
(23301525, 1),
(23301525, 2),
(23301525, 4),
(23301525, 5),
(23301525, 6),
(23301525, 7),
(23301525, 8),
(23301525, 9),
(23301525, 10),
(23301525, 11),
(23301525, 12),
(23301525, 13),
(23301525, 14),
(23301525, 15),
(23301525, 16),
(23301525, 17),
(23301529, 15),
(23301531, 2),
(23301531, 4),
(23301531, 10),
(23301531, 11),
(23301531, 12),
(23301531, 15),
(23301531, 16),
(23301531, 17),
(23301533, 2),
(23301533, 4),
(23301533, 10),
(23301533, 11),
(23301533, 12),
(23301533, 16),
(23301533, 17);

-- --------------------------------------------------------

--
-- Table structure for table `st_progress`
--

CREATE TABLE `st_progress` (
  `student_ID` int(11) NOT NULL,
  `learning_modules` varchar(400) NOT NULL,
  `status` enum('Done','Not done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `st_progress`
--

INSERT INTO `st_progress` (`student_ID`, `learning_modules`, `status`) VALUES
(23301525, 'Actuators', 'Not done'),
(23301525, 'Agile/Scrum', 'Not done'),
(23301525, 'Algorithms', 'Done'),
(23301525, 'API Design', 'Not done'),
(23301525, 'API Development', 'Not done'),
(23301525, 'AWS IoT Core Certification', 'Not done'),
(23301525, 'CI/CD', 'Not done'),
(23301525, 'Cisco CCNA', 'Not done'),
(23301525, 'Cisco IoT Specialist', 'Not done'),
(23301525, 'Cisco Networking Academy', 'Not done'),
(23301525, 'Cloud Basics', 'Not done'),
(23301525, 'Cloud Integration', 'Not done'),
(23301525, 'Cloud Networking', 'Not done'),
(23301525, 'CoAP)', 'Not done'),
(23301525, 'Codecademy Computer Science', 'Not done'),
(23301525, 'Codecademy Networking Basics', 'Not done'),
(23301525, 'CompTIA Network+', 'Not done'),
(23301525, 'Coursera Industrial IoT', 'Not done'),
(23301525, 'Coursera IoT Specialization', 'Not done'),
(23301525, 'Coursera Network Engineering', 'Not done'),
(23301525, 'Coursera Python for Everybody', 'Not done'),
(23301525, 'Coursera Software Engineering', 'Not done'),
(23301525, 'CS50 (Harvard)', 'Not done'),
(23301525, 'CSE 310', 'Not done'),
(23301525, 'CSE 342', 'Not done'),
(23301525, 'CSE 360', 'Not done'),
(23301525, 'CSE 410', 'Not done'),
(23301525, 'CSE 419', 'Not done'),
(23301525, 'CSE 426', 'Not done'),
(23301525, 'CSE 461', 'Not done'),
(23301525, 'CSE 470', 'Not done'),
(23301525, 'CSE 490', 'Not done'),
(23301525, 'Data Analytics', 'Not done'),
(23301525, 'Data Storage', 'Not done'),
(23301525, 'Data Structures', 'Done'),
(23301525, 'Debugging', 'Not done'),
(23301525, 'Design Patterns', 'Not done'),
(23301525, 'Device Management', 'Not done'),
(23301525, 'Documentation', 'Not done'),
(23301525, 'Edge Computing', 'Not done'),
(23301525, 'EdX IoT Essentials', 'Not done'),
(23301525, 'EdX Networking Essentials', 'Not done'),
(23301525, 'EdX Software Engineering Essentials', 'Not done'),
(23301525, 'Embedded Linux', 'Not done'),
(23301525, 'Firewalls', 'Not done'),
(23301525, 'FutureLearn IoT Fundamentals', 'Not done'),
(23301525, 'FutureLearn Networking', 'Not done'),
(23301525, 'IoT Academy Courses', 'Not done'),
(23301525, 'LAN/WAN', 'Not done'),
(23301525, 'LinkedIn Learning IoT', 'Not done'),
(23301525, 'LinkedIn Learning Network Engineering', 'Not done'),
(23301525, 'LinkedIn Learning Software Development', 'Not done'),
(23301525, 'Linux', 'Done'),
(23301525, 'Load Balancing', 'Not done'),
(23301525, 'Microcontrollers', 'Not done'),
(23301525, 'Microservices', 'Not done'),
(23301525, 'Microsoft Certified Software Engineer', 'Not done'),
(23301525, 'MIT OpenCourseWare Intro to CS', 'Not done'),
(23301525, 'Monitoring & Logging', 'Not done'),
(23301525, 'Network Automation (Python/Ansible)', 'Not done'),
(23301525, 'Network Design', 'Not done'),
(23301525, 'Network Monitoring (Nagios', 'Done'),
(23301525, 'Network Security', 'Not done'),
(23301525, 'Networking Protocols (MQTT', 'Not done'),
(23301525, 'OOP', 'Done'),
(23301525, 'Oracle Java SE Programmer', 'Not done'),
(23301525, 'OTA Updates', 'Not done'),
(23301525, 'Performance Optimization', 'Not done'),
(23301525, 'Pluralsight IoT Development', 'Not done'),
(23301525, 'Pluralsight Networking', 'Not done'),
(23301525, 'Pluralsight Software Engineering Path', 'Not done'),
(23301525, 'Programming (C++/ Java/ Python/ C)', 'Done'),
(23301525, 'Protocol Analysis', 'Not done'),
(23301525, 'Python/C++ Programming', 'Done'),
(23301525, 'QoS', 'Not done'),
(23301525, 'Routing & Switching', 'Not done'),
(23301525, 'SDN', 'Not done'),
(23301525, 'Security for IoT', 'Not done'),
(23301525, 'Sensors', 'Not done'),
(23301525, 'Software Architecture', 'Not done'),
(23301525, 'SolarWinds)', 'Not done'),
(23301525, 'System Design', 'Not done'),
(23301525, 'TCP/IP', 'Done'),
(23301525, 'Testing (Unit/Integration/Regression)', 'Not done'),
(23301525, 'Troubleshooting', 'Not done'),
(23301525, 'Udemy Advanced Networking', 'Not done'),
(23301525, 'Udemy CCNA', 'Not done'),
(23301525, 'Udemy Complete Software Developer Bootcamp', 'Not done'),
(23301525, 'Udemy ESP32 IoT Projects', 'Not done'),
(23301525, 'Udemy IoT Developer', 'Not done'),
(23301525, 'Udemy Java Programming Masterclass', 'Not done'),
(23301525, 'Udemy Network Fundamentals', 'Not done'),
(23301525, 'Udemy Raspberry Pi IoT', 'Not done'),
(23301525, 'Version Control (Git)', 'Not done'),
(23301525, 'VLAN', 'Not done'),
(23301525, 'VPN', 'Done'),
(23301525, 'Wi-Fi', 'Not done'),
(23301525, 'Wireless Communication (BLE', 'Not done'),
(23301525, 'Wireless Networks', 'Done'),
(23301525, 'Zigbee)', 'Not done'),
(23301531, 'Actuators', 'Not done'),
(23301531, 'ARM Accredited Engineer', 'Not done'),
(23301531, 'C', 'Not done'),
(23301531, 'C++', 'Not done'),
(23301531, 'Communication Protocols (UART', 'Not done'),
(23301531, 'Coursera Embedded Software', 'Not done'),
(23301531, 'Coursera IoT & Embedded Systems', 'Not done'),
(23301531, 'CSE 360', 'Not done'),
(23301531, 'CSE 392', 'Not done'),
(23301531, 'CSE 460', 'Not done'),
(23301531, 'Debugging', 'Not done'),
(23301531, 'EdX Embedded Systems', 'Not done'),
(23301531, 'Embedded Security', 'Not done'),
(23301531, 'Embedded Systems Certification', 'Not done'),
(23301531, 'FPGA Basics', 'Not done'),
(23301531, 'FutureLearn Embedded Systems Fundamentals', 'Not done'),
(23301531, 'Hardware-Software Interface', 'Done'),
(23301531, 'I2C)', 'Not done'),
(23301531, 'Interrupt Handling', 'Not done'),
(23301531, 'LinkedIn Learning Embedded Programming', 'Not done'),
(23301531, 'Linux Kernel Basics', 'Not done'),
(23301531, 'Low-Level Programming', 'Not done'),
(23301531, 'Memory Management', 'Not done'),
(23301531, 'Microcontrollers', 'Not done'),
(23301531, 'MIT OpenCourseWare Embedded', 'Not done'),
(23301531, 'PCB Design', 'Not done'),
(23301531, 'Pluralsight Embedded Dev', 'Not done'),
(23301531, 'RTOS', 'Done'),
(23301531, 'Sensors', 'Done'),
(23301531, 'Signal Processing', 'Not done'),
(23301531, 'SPI', 'Not done'),
(23301531, 'Testing', 'Not done'),
(23301531, 'Udacity Embedded Systems', 'Not done'),
(23301531, 'Udemy Embedded Systems', 'Not done'),
(23301531, 'Udemy Microcontroller Programming', 'Not done'),
(23301533, 'Agile/Scrum', 'Done'),
(23301533, 'AI Ethics', 'Not done'),
(23301533, 'AI Research Methodology', 'Done'),
(23301533, 'Algorithm Optimization', 'Not done'),
(23301533, 'Algorithms', 'Not done'),
(23301533, 'API Design', 'Done'),
(23301533, 'AWS ML Specialty', 'Not done'),
(23301533, 'CI/CD', 'Done'),
(23301533, 'Cloud AI Services', 'Not done'),
(23301533, 'Cloud Basics', 'Not done'),
(23301533, 'CNN', 'Not done'),
(23301533, 'Codecademy Computer Science', 'Not done'),
(23301533, 'Computer Vision', 'Not done'),
(23301533, 'Coursera AI For Everyone', 'Not done'),
(23301533, 'Coursera Python for Everybody', 'Not done'),
(23301533, 'Coursera Software Engineering', 'Not done'),
(23301533, 'CS50 (Harvard)', 'Not done'),
(23301533, 'CSE 310', 'Not done'),
(23301533, 'CSE 410', 'Not done'),
(23301533, 'CSE 419', 'Not done'),
(23301533, 'CSE 425', 'Done'),
(23301533, 'CSE 426', 'Not done'),
(23301533, 'CSE 427', 'Done'),
(23301533, 'CSE 428', 'Done'),
(23301533, 'CSE 431', 'Not done'),
(23301533, 'CSE 432', 'Not done'),
(23301533, 'CSE 470', 'Not done'),
(23301533, 'Data Structures', 'Not done'),
(23301533, 'DataCamp AI Courses', 'Not done'),
(23301533, 'Debugging', 'Done'),
(23301533, 'Deep Learning', 'Not done'),
(23301533, 'DeepLearning.AI TensorFlow', 'Not done'),
(23301533, 'Design Patterns', 'Done'),
(23301533, 'Documentation', 'Not done'),
(23301533, 'EdX AI MicroMasters', 'Not done'),
(23301533, 'EdX Software Engineering Essentials', 'Not done'),
(23301533, 'Fast.ai Deep Learning', 'Not done'),
(23301533, 'GPU Programming', 'Not done'),
(23301533, 'LinkedIn Learning AI', 'Not done'),
(23301533, 'LinkedIn Learning Software Development', 'Not done'),
(23301533, 'LSTM', 'Done'),
(23301533, 'Microservices', 'Not done'),
(23301533, 'Microsoft Certified Software Engineer', 'Not done'),
(23301533, 'MIT OpenCourseWare AI', 'Not done'),
(23301533, 'MIT OpenCourseWare Intro to CS', 'Not done'),
(23301533, 'Model Deployment', 'Not done'),
(23301533, 'Model Tuning', 'Not done'),
(23301533, 'Neural Networks', 'Done'),
(23301533, 'NLP', 'Not done'),
(23301533, 'OOP', 'Not done'),
(23301533, 'Oracle Java SE Programmer', 'Not done'),
(23301533, 'Performance Optimization', 'Not done'),
(23301533, 'Pluralsight AI Fundamentals', 'Not done'),
(23301533, 'Pluralsight Software Engineering Path', 'Not done'),
(23301533, 'Programming (C++/ Java/ Python/ C)', 'Not done'),
(23301533, 'Python', 'Done'),
(23301533, 'PyTorch', 'Not done'),
(23301533, 'Reinforcement Learning', 'Not done'),
(23301533, 'RNN', 'Not done'),
(23301533, 'Software Architecture', 'Not done'),
(23301533, 'Speech Recognition', 'Not done'),
(23301533, 'System Design', 'Not done'),
(23301533, 'TensorFlow', 'Not done'),
(23301533, 'TensorFlow Developer', 'Done'),
(23301533, 'Testing (Unit/Integration/Regression)', 'Not done'),
(23301533, 'Transfer Learning', 'Not done'),
(23301533, 'Transformers', 'Done'),
(23301533, 'Udacity AI Engineer', 'Not done'),
(23301533, 'Udemy AI & Deep Learning', 'Not done'),
(23301533, 'Udemy Complete Software Developer Bootcamp', 'Not done'),
(23301533, 'Udemy Java Programming Masterclass', 'Not done'),
(23301533, 'Version Control (Git)', 'Not done');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_course`
--
ALTER TABLE `add_course`
  ADD PRIMARY KEY (`Student_ID`,`CourseID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `applied_coops`
--
ALTER TABLE `applied_coops`
  ADD PRIMARY KEY (`co_ops_id`,`Student_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `career`
--
ALTER TABLE `career`
  ADD PRIMARY KEY (`career_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `co_ops`
--
ALTER TABLE `co_ops`
  ADD PRIMARY KEY (`co_ops_id`),
  ADD KEY `fk_approve_by` (`approve_by`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`fac_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `fac_id` (`fac_id`);

--
-- Indexes for table `projectskill`
--
ALTER TABLE `projectskill`
  ADD PRIMARY KEY (`project_id`,`skill_code`),
  ADD KEY `skill_code` (`skill_code`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`project_id`,`student_ID`),
  ADD KEY `student_ID` (`student_ID`);

--
-- Indexes for table `select_career`
--
ALTER TABLE `select_career`
  ADD PRIMARY KEY (`student_ID`,`career_id`),
  ADD KEY `career_id` (`career_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_code`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `studentskill`
--
ALTER TABLE `studentskill`
  ADD PRIMARY KEY (`student_ID`,`skill_code`),
  ADD KEY `skill_code` (`skill_code`);

--
-- Indexes for table `st_progress`
--
ALTER TABLE `st_progress`
  ADD PRIMARY KEY (`student_ID`,`learning_modules`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `career`
--
ALTER TABLE `career`
  MODIFY `career_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `co_ops`
--
ALTER TABLE `co_ops`
  MODIFY `co_ops_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `fac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23301534;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_course`
--
ALTER TABLE `add_course`
  ADD CONSTRAINT `add_course_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`student_ID`),
  ADD CONSTRAINT `add_course_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `applied_coops`
--
ALTER TABLE `applied_coops`
  ADD CONSTRAINT `applied_coops_ibfk_1` FOREIGN KEY (`co_ops_id`) REFERENCES `co_ops` (`co_ops_id`),
  ADD CONSTRAINT `applied_coops_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`student_ID`);

--
-- Constraints for table `co_ops`
--
ALTER TABLE `co_ops`
  ADD CONSTRAINT `fk_approve_by` FOREIGN KEY (`approve_by`) REFERENCES `admin` (`fac_id`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculty` (`fac_id`);

--
-- Constraints for table `projectskill`
--
ALTER TABLE `projectskill`
  ADD CONSTRAINT `projectskill_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `projectskill_ibfk_2` FOREIGN KEY (`skill_code`) REFERENCES `skill` (`skill_code`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);

--
-- Constraints for table `select_career`
--
ALTER TABLE `select_career`
  ADD CONSTRAINT `select_career_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`),
  ADD CONSTRAINT `select_career_ibfk_2` FOREIGN KEY (`career_id`) REFERENCES `career` (`career_id`);

--
-- Constraints for table `studentskill`
--
ALTER TABLE `studentskill`
  ADD CONSTRAINT `studentskill_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`),
  ADD CONSTRAINT `studentskill_ibfk_2` FOREIGN KEY (`skill_code`) REFERENCES `skill` (`skill_code`);

--
-- Constraints for table `st_progress`
--
ALTER TABLE `st_progress`
  ADD CONSTRAINT `st_progress_ibfk_1` FOREIGN KEY (`student_ID`) REFERENCES `student` (`student_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
