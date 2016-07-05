--To load this file
--To load another lua script in gearswap
--In the console type: gs l <script name>
--For this file, name it colors.lua
--In the console type: gs l colors.lua


--In Game Macro   /console gs c [command name]
--In Chat         //gs c [command name]

--Example //gs c fontcolors
--Example //gs c nonfontcolors
--Example //gs c allcolors

--Original Author: lanAKAIan
--Recreated for Gearswap by Sithel
function self_command(command)
	-- Font-color affected colors were found by turning off all colors 
    -- and then turning them on individually, and recording first 
    -- color number found 
	if command == 'fontcolors' then
			add_to_chat(23,'Start Font-Color Affected Colors')
			add_to_chat(1,'Color 1: Chat - Immediate vicinity ("Say") ')
			add_to_chat(2,'Color 2: Chat - Wide area ("Shout") ')
			add_to_chat(3,'Color 3: Chat - Extremely Wide area ("Yell") ')
			add_to_chat(4,'Color 4: Chat - Tell target only ("Tell")')
			add_to_chat(5,'Color 5: Chat - All party members ("Party")')
			add_to_chat(6,'Color 6: Chat - Linkshell group ("Linkshell")')
			add_to_chat(7,'Color 7: Chat - Emotes')
			add_to_chat(17,'Color 17: Chat - Messages ("Message")')
			add_to_chat(142,'Color 42: Chat - NPC Conversations')
			add_to_chat(20,'Color 20: For Others - HP/MP others lose')
			add_to_chat(21,'Color 21: For Others - Actions others evade')
			add_to_chat(22,'Color 22: For Others - HP/MP others recover')
			add_to_chat(60,'Color 60: For Others - Beneficial effects others are granted')
			add_to_chat(61,'Color 61: For Others - Detrimental effects others receive')
			add_to_chat(63,'Color 63: For Others - Effects others resist')
			add_to_chat(28,'Color 28: For Self - HP/MP you lose')
			add_to_chat(29,'Color 29: For Self - Actions you evade')
			add_to_chat(30,'Color 30: For Self - HP/MP you recover')
			add_to_chat(56,'Color 56: For Self - Beneficial effects you are granted')
			add_to_chat(57,'Color 57: For Self - Detrimental effects you receive')
			add_to_chat(59,'Color 59: For Self - Effects you resist')
			add_to_chat(8,'Color 8: System - Calls for help')
			add_to_chat(50,'Color 50: System - Standard battle messages')
			add_to_chat(121,'Color 121: System - Basic system messages')
			add_to_chat(23,'End Font-Color Affected Colors')
			
	elseif command == 'nonfontcolors' then
	-- Non-font-color affected colors were found by turning off all colors
			add_to_chat(23,'Start Non-Font-Color Affected Colors')
			add_to_chat(0,'Color 0')
			add_to_chat(3,'Color 3')
			add_to_chat(11,'Color 11')
			add_to_chat(19,'Color 19')
			add_to_chat(36,'Color 36')
			add_to_chat(37,'Color 37')
			add_to_chat(38,'Color 38')
			add_to_chat(39,'Color 39')
			add_to_chat(44,'Color 44')
			add_to_chat(45,'Color 45')
			add_to_chat(46,'Color 46')
			add_to_chat(47,'Color 47')
			add_to_chat(48,'Color 48')
			add_to_chat(49,'Color 49')
			add_to_chat(53,'Color 53')
			add_to_chat(54,'Color 54')
			add_to_chat(73,'Color 73')
			add_to_chat(74,'Color 74')
			add_to_chat(75,'Color 75')
			add_to_chat(76,'Color 76')
			add_to_chat(77,'Color 77')
			add_to_chat(78,'Color 78')
			add_to_chat(79,'Color 79')
			add_to_chat(95,'Color 95')
			add_to_chat(96,'Color 96')
			add_to_chat(97,'Color 97')
			add_to_chat(98,'Color 98')
			add_to_chat(99,'Color 99')
			add_to_chat(115,'Color 115')
			add_to_chat(116,'Color 116')
			add_to_chat(117,'Color 117')
			add_to_chat(118,'Color 118')
			add_to_chat(119,'Color 119')
			add_to_chat(120,'Color 120')
			add_to_chat(123,'Color 123')
			add_to_chat(124,'Color 124')
			add_to_chat(125,'Color 125')
			add_to_chat(126,'Color 126')
			add_to_chat(141,'Color 141')
			add_to_chat(154,'Color 154')
			add_to_chat(155,'Color 155')
			add_to_chat(156,'Color 156')
			add_to_chat(157,'Color 157')
			add_to_chat(158,'Color 158')
			add_to_chat(159,'Color 159')
			add_to_chat(160,'Color 160')
			add_to_chat(161,'Color 161')
			add_to_chat(166,'Color 166')
			add_to_chat(167,'Color 167')
			add_to_chat(191,'Color 191')
			add_to_chat(192,'Color 192')
			add_to_chat(193,'Color 193')
			add_to_chat(194,'Color 194')
			add_to_chat(195,'Color 195')
			add_to_chat(196,'Color 196')
			add_to_chat(197,'Color 197')
			add_to_chat(198,'Color 198')
			add_to_chat(199,'Color 199')
			add_to_chat(200,'Color 200')
			add_to_chat(201,'Color 201')
			add_to_chat(202,'Color 202')
			add_to_chat(203,'Color 203')
			add_to_chat(204,'Color 204')
			add_to_chat(206,'Color 206')
			add_to_chat(207,'Color 207')
			add_to_chat(209,'Color 209')
			add_to_chat(210,'Color 210')
			add_to_chat(211,'Color 211')
			add_to_chat(212,'Color 212')
			add_to_chat(213,'Color 213')
			add_to_chat(214,'Color 214')
			add_to_chat(215,'Color 215')
			add_to_chat(216,'Color 216')
			add_to_chat(217,'Color 217')
			add_to_chat(218,'Color 218')
			add_to_chat(219,'Color 219')
			add_to_chat(220,'Color 220')
			add_to_chat(221,'Color 221')
			add_to_chat(222,'Color 222')
			add_to_chat(223,'Color 223')
			add_to_chat(224,'Color 224')
			add_to_chat(225,'Color 225')
			add_to_chat(226,'Color 226')
			add_to_chat(227,'Color 227')
			add_to_chat(228,'Color 228')
			add_to_chat(229,'Color 229')
			add_to_chat(230,'Color 230')
			add_to_chat(231,'Color 231')
			add_to_chat(232,'Color 232')
			add_to_chat(233,'Color 233')
			add_to_chat(234,'Color 234')
			add_to_chat(235,'Color 235')
			add_to_chat(236,'Color 236')
			add_to_chat(237,'Color 237')
			add_to_chat(238,'Color 238')
			add_to_chat(239,'Color 239')
			add_to_chat(240,'Color 240')
			add_to_chat(241,'Color 241')
			add_to_chat(242,'Color 242')
			add_to_chat(243,'Color 243')
			add_to_chat(244,'Color 244')
			add_to_chat(245,'Color 245')
			add_to_chat(246,'Color 246')
			add_to_chat(247,'Color 247')
			add_to_chat(248,'Color 248')
			add_to_chat(249,'Color 249')
			add_to_chat(250,'Color 250')
			add_to_chat(251,'Color 251')
			add_to_chat(252,'Color 252')
			add_to_chat(253,'Color 253')
			add_to_chat(254,'Color 254')
			add_to_chat(255,'Color 255')
			add_to_chat(23,'End Non-Font-Color Affected Colors')
			
	elseif command == 'allcolors' then
			-- All Colors
			add_to_chat(23,'Start All Colors')
			add_to_chat(0,'Color 0')
			add_to_chat(1,'Color 1')
			add_to_chat(2,'Color 2')
			add_to_chat(3,'Color 3')
			add_to_chat(4,'Color 4')
			add_to_chat(5,'Color 5')
			add_to_chat(6,'Color 6')
			add_to_chat(7,'Color 7')
			add_to_chat(8,'Color 8')
			add_to_chat(9,'Color 9')
			add_to_chat(10,'Color 10')
			add_to_chat(11,'Color 11')
			add_to_chat(12,'Color 12')
			add_to_chat(13,'Color 13')
			add_to_chat(14,'Color 14')
			add_to_chat(15,'Color 15')
			add_to_chat(16,'Color 16')
			add_to_chat(17,'Color 17')
			add_to_chat(18,'Color 18')
			add_to_chat(19,'Color 19')
			add_to_chat(20,'Color 20')
			add_to_chat(21,'Color 21')
			add_to_chat(22,'Color 22')
			add_to_chat(23,'Color 23')
			add_to_chat(24,'Color 24')
			add_to_chat(25,'Color 25')
			add_to_chat(26,'Color 26')
			add_to_chat(27,'Color 27')
			add_to_chat(28,'Color 28')
			add_to_chat(29,'Color 29')
			add_to_chat(30,'Color 30')
			add_to_chat(31,'Color 31')
			add_to_chat(32,'Color 32')
			add_to_chat(33,'Color 33')
			add_to_chat(34,'Color 34')
			add_to_chat(35,'Color 35')
			add_to_chat(36,'Color 36')
			add_to_chat(37,'Color 37')
			add_to_chat(38,'Color 38')
			add_to_chat(39,'Color 39')
			add_to_chat(40,'Color 40')
			add_to_chat(41,'Color 41')
			add_to_chat(42,'Color 42')
			add_to_chat(43,'Color 43')
			add_to_chat(44,'Color 44')
			add_to_chat(45,'Color 45')
			add_to_chat(46,'Color 46')
			add_to_chat(47,'Color 47')
			add_to_chat(48,'Color 48')
			add_to_chat(49,'Color 49')
			add_to_chat(50,'Color 50')
			add_to_chat(51,'Color 51')
			add_to_chat(52,'Color 52')
			add_to_chat(53,'Color 53')
			add_to_chat(54,'Color 54')
			add_to_chat(55,'Color 55')
			add_to_chat(56,'Color 56')
			add_to_chat(57,'Color 57')
			add_to_chat(58,'Color 58')
			add_to_chat(59,'Color 59')
			add_to_chat(60,'Color 60')
			add_to_chat(61,'Color 61')
			add_to_chat(62,'Color 62')
			add_to_chat(63,'Color 63')
			add_to_chat(64,'Color 64')
			add_to_chat(65,'Color 65')
			add_to_chat(66,'Color 66')
			add_to_chat(67,'Color 67')
			add_to_chat(68,'Color 68')
			add_to_chat(69,'Color 69')
			add_to_chat(70,'Color 70')
			add_to_chat(71,'Color 71')
			add_to_chat(72,'Color 72')
			add_to_chat(73,'Color 73')
			add_to_chat(74,'Color 74')
			add_to_chat(75,'Color 75')
			add_to_chat(76,'Color 76')
			add_to_chat(77,'Color 77')
			add_to_chat(78,'Color 78')
			add_to_chat(79,'Color 79')
			add_to_chat(80,'Color 80')
			add_to_chat(81,'Color 81')
			add_to_chat(82,'Color 82')
			add_to_chat(83,'Color 83')
			add_to_chat(84,'Color 84')
			add_to_chat(85,'Color 85')
			add_to_chat(86,'Color 86')
			add_to_chat(87,'Color 87')
			add_to_chat(88,'Color 88')
			add_to_chat(89,'Color 89')
			add_to_chat(90,'Color 90')
			add_to_chat(91,'Color 91')
			add_to_chat(92,'Color 92')
			add_to_chat(93,'Color 93')
			add_to_chat(94,'Color 94')
			add_to_chat(95,'Color 95')
			add_to_chat(96,'Color 96')
			add_to_chat(97,'Color 97')
			add_to_chat(98,'Color 98')
			add_to_chat(99,'Color 99')
			add_to_chat(100,'Color 100')
			add_to_chat(101,'Color 101')
			add_to_chat(102,'Color 102')
			add_to_chat(103,'Color 103')
			add_to_chat(104,'Color 104')
			add_to_chat(105,'Color 105')
			add_to_chat(106,'Color 106')
			add_to_chat(107,'Color 107')
			add_to_chat(108,'Color 108')
			add_to_chat(109,'Color 109')
			add_to_chat(110,'Color 110')
			add_to_chat(111,'Color 111')
			add_to_chat(112,'Color 112')
			add_to_chat(113,'Color 113')
			add_to_chat(114,'Color 114')
			add_to_chat(115,'Color 115')
			add_to_chat(116,'Color 116')
			add_to_chat(117,'Color 117')
			add_to_chat(118,'Color 118')
			add_to_chat(119,'Color 119')
			add_to_chat(120,'Color 120')
			add_to_chat(121,'Color 121')
			add_to_chat(122,'Color 122')
			add_to_chat(123,'Color 123')
			add_to_chat(124,'Color 124')
			add_to_chat(125,'Color 125')
			add_to_chat(126,'Color 126')
			add_to_chat(127,'Color 127')
			add_to_chat(128,'Color 128')
			add_to_chat(129,'Color 129')
			add_to_chat(130,'Color 130')
			add_to_chat(131,'Color 131')
			add_to_chat(132,'Color 132')
			add_to_chat(133,'Color 133')
			add_to_chat(134,'Color 134')
			add_to_chat(135,'Color 135')
			add_to_chat(136,'Color 136')
			add_to_chat(137,'Color 137')
			add_to_chat(138,'Color 138')
			add_to_chat(139,'Color 139')
			add_to_chat(140,'Color 140')
			add_to_chat(141,'Color 141')
			add_to_chat(142,'Color 142')
			add_to_chat(143,'Color 143')
			add_to_chat(144,'Color 144')
			add_to_chat(145,'Color 145')
			add_to_chat(146,'Color 146')
			add_to_chat(147,'Color 147')
			add_to_chat(148,'Color 148')
			add_to_chat(149,'Color 149')
			add_to_chat(150,'Color 150')
			add_to_chat(151,'Color 151')
			add_to_chat(152,'Color 152')
			add_to_chat(153,'Color 153')
			add_to_chat(154,'Color 154')
			add_to_chat(155,'Color 155')
			add_to_chat(156,'Color 156')
			add_to_chat(157,'Color 157')
			add_to_chat(158,'Color 158')
			add_to_chat(159,'Color 159')
			add_to_chat(160,'Color 160')			
			add_to_chat(161,'Color 161')
			add_to_chat(162,'Color 162')
			add_to_chat(163,'Color 163')
			add_to_chat(164,'Color 164')
			add_to_chat(165,'Color 165')
			add_to_chat(166,'Color 166')
			add_to_chat(167,'Color 167')
			add_to_chat(168,'Color 168')
			add_to_chat(169,'Color 169')
			add_to_chat(170,'Color 170')
			add_to_chat(171,'Color 171')
			add_to_chat(172,'Color 172')
			add_to_chat(173,'Color 173')
			add_to_chat(174,'Color 174')
			add_to_chat(175,'Color 175')
			add_to_chat(176,'Color 176')
			add_to_chat(177,'Color 177')
			add_to_chat(178,'Color 178')
			add_to_chat(179,'Color 179')
			add_to_chat(180,'Color 180')
			add_to_chat(181,'Color 181')
			add_to_chat(182,'Color 182')
			add_to_chat(183,'Color 183')
			add_to_chat(184,'Color 184')
			add_to_chat(185,'Color 185')
			add_to_chat(186,'Color 186')
			add_to_chat(187,'Color 187')
			add_to_chat(188,'Color 188')
			add_to_chat(199,'Color 189')
			add_to_chat(190,'Color 190')
			add_to_chat(191,'Color 191')
			add_to_chat(192,'Color 192')
			add_to_chat(193,'Color 193')
			add_to_chat(194,'Color 194')
			add_to_chat(195,'Color 195')
			add_to_chat(196,'Color 196')
			add_to_chat(197,'Color 197')
			add_to_chat(198,'Color 198')
			add_to_chat(199,'Color 199')
			add_to_chat(200,'Color 200')
			add_to_chat(201,'Color 201')
			add_to_chat(202,'Color 202')
			add_to_chat(203,'Color 203')
			add_to_chat(204,'Color 204')
			add_to_chat(205,'Color 205')
			add_to_chat(206,'Color 206')
			add_to_chat(207,'Color 207')
			add_to_chat(208,'Color 208')
			add_to_chat(209,'Color 209')
			add_to_chat(210,'Color 210')
			add_to_chat(211,'Color 211')
			add_to_chat(212,'Color 212')
			add_to_chat(213,'Color 213')
			add_to_chat(214,'Color 214')
			add_to_chat(215,'Color 215')
			add_to_chat(216,'Color 216')
			add_to_chat(217,'Color 217')
			add_to_chat(218,'Color 218')
			add_to_chat(219,'Color 219')
			add_to_chat(220,'Color 220')
			add_to_chat(221,'Color 221')
			add_to_chat(222,'Color 222')
			add_to_chat(223,'Color 223')
			add_to_chat(224,'Color 224')
			add_to_chat(225,'Color 225')
			add_to_chat(226,'Color 226')
			add_to_chat(227,'Color 227')
			add_to_chat(228,'Color 228')
			add_to_chat(229,'Color 229')
			add_to_chat(230,'Color 230')
			add_to_chat(231,'Color 231')
			add_to_chat(232,'Color 232')
			add_to_chat(233,'Color 233')
			add_to_chat(234,'Color 234')
			add_to_chat(235,'Color 235')
			add_to_chat(236,'Color 236')
			add_to_chat(237,'Color 237')
			add_to_chat(238,'Color 238')
			add_to_chat(239,'Color 239')
			add_to_chat(240,'Color 240')
			add_to_chat(241,'Color 241')
			add_to_chat(242,'Color 242')
			add_to_chat(243,'Color 243')
			add_to_chat(244,'Color 244')
			add_to_chat(245,'Color 245')
			add_to_chat(246,'Color 246')
			add_to_chat(247,'Color 247')
			add_to_chat(248,'Color 248')
			add_to_chat(249,'Color 249')
			add_to_chat(250,'Color 250')
			add_to_chat(251,'Color 251')
			add_to_chat(252,'Color 252')
			add_to_chat(253,'Color 253')
			add_to_chat(254,'Color 254')
			add_to_chat(255,'Color 255')
			add_to_chat(23,'End All Colors')
	end
end