CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `gender` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `socialSecurity` integer NOT NULL,
  `medicalFile` integer,
  `isAdmin` bool NOT NULL
);

CREATE TABLE `reservations` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `reservationDate` date NOT NULL,
  `center` varchar(255) NOT NULL,
  `doctor` integer NOT NULL,
  `hospitalisation` integer
);

CREATE TABLE `centers` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `centerName` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `specialties` varchar(255),
  `doctors` integer
);

CREATE TABLE `doctors` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `specialty` integer NOT NULL
);

CREATE TABLE `specialties` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `specialtyName` varchar(255) NOT NULL,
  `doctors` integer
);

CREATE TABLE `medicalFile` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `reservations` integer,
  `allergies` varchar(255),
  `documents` varchar(255)
);

CREATE TABLE `hospitalisation` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `vegetarian` bool,
  `singleRoom` bool,
  `television` bool
);

ALTER TABLE `users` ADD FOREIGN KEY (`medicalFile`) REFERENCES `medicalFile` (`id`);

ALTER TABLE `reservations` ADD FOREIGN KEY (`center`) REFERENCES `centers` (`id`);

ALTER TABLE `reservations` ADD FOREIGN KEY (`doctor`) REFERENCES `doctors` (`id`);

ALTER TABLE `reservations` ADD FOREIGN KEY (`hospitalisation`) REFERENCES `hospitalisation` (`id`);

CREATE TABLE `specialties_centers` (
  `specialties_id` integer,
  `centers_specialties` varchar,
  PRIMARY KEY (`specialties_id`, `centers_specialties`)
);

ALTER TABLE `specialties_centers` ADD FOREIGN KEY (`specialties_id`) REFERENCES `specialties` (`id`);

ALTER TABLE `specialties_centers` ADD FOREIGN KEY (`centers_specialties`) REFERENCES `centers` (`specialties`);


ALTER TABLE `doctors` ADD FOREIGN KEY (`id`) REFERENCES `centers` (`doctors`);

CREATE TABLE `doctors_specialties` (
  `doctors_id` integer,
  `specialties_doctors` integer,
  PRIMARY KEY (`doctors_id`, `specialties_doctors`)
);

ALTER TABLE `doctors_specialties` ADD FOREIGN KEY (`doctors_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `doctors_specialties` ADD FOREIGN KEY (`specialties_doctors`) REFERENCES `specialties` (`doctors`);


ALTER TABLE `reservations` ADD FOREIGN KEY (`id`) REFERENCES `medicalFile` (`reservations`);
