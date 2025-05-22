-- Cria o schema (ou database) pobreflix-teste se ele não existir
CREATE SCHEMA IF NOT EXISTS `pobreflix-teste`;

-- Usa o schema pobreflix-teste
USE `pobreflix-teste`;

-- Drop tables in reverse order of dependencies to avoid conflicts
-- Note: MySQL não usa 'CASCADE' em DROP TABLE para dependências de FKs.
-- Para MySQL, 'SET FOREIGN_KEY_CHECKS = 0;' é usado para desabilitar temporariamente
-- a verificação de chaves estrangeiras, permitindo o drop em qualquer ordem.
-- É bom reativá-lo depois.

SET FOREIGN_KEY_CHECKS = 0; -- Desabilita a verificação de chaves estrangeiras

DROP TABLE IF EXISTS `external_api`;
DROP TABLE IF EXISTS `consumption_reports`;
DROP TABLE IF EXISTS `consumption_history`;
DROP TABLE IF EXISTS `catalog`;
DROP TABLE IF EXISTS `users`;

SET FOREIGN_KEY_CHECKS = 1; -- Reabilita a verificação de chaves estrangeiras

-- Users Table
CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) UNIQUE NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `user_type` ENUM('Administrator', 'Client') NOT NULL, -- MySQL usa ENUM para CHECK IN
    PRIMARY KEY (`id`)
);

-- Catalog Table
CREATE TABLE `catalog` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `genre` VARCHAR(100),
    `content_type` ENUM('filme', 'serie') NOT NULL, -- MySQL usa ENUM para CHECK IN
    `video_url` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `image_url` TEXT, -- Adicionado aqui conforme seu ALTER TABLE
    PRIMARY KEY (`id`)
);

-- Consumption History Table
CREATE TABLE `consumption_history` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `catalog_id` INT NOT NULL,
    `watched_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`catalog_id`) REFERENCES `catalog`(`id`) ON DELETE CASCADE
);

-- Consumption Reports Table
CREATE TABLE `consumption_reports` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `catalog_id` INT UNIQUE NOT NULL,
    `views` INT DEFAULT 0,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Para atualizar automaticamente no UPDATE
    PRIMARY KEY (`id`),
    FOREIGN KEY (`catalog_id`) REFERENCES `catalog`(`id`) ON DELETE CASCADE
);

-- External API Integration Table
CREATE TABLE `external_api` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `source` VARCHAR(100) NOT NULL, -- Nome da API (ex: 'SuperFlix')
    `catalog_id` INT UNIQUE NOT NULL, -- Garantindo que um catálogo só tenha um registro na API
    `synced_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data da sincronização
    PRIMARY KEY (`id`),
    FOREIGN KEY (`catalog_id`) REFERENCES `catalog`(`id`) ON DELETE CASCADE
);

-- Usa o schema pobreflix-teste
USE `pobreflix-teste`;

CREATE TABLE IF NOT EXISTS `pobreflix-teste`.`sessao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dispositivo` VARCHAR(255) NOT NULL,
  `cripto_key` TEXT NOT NULL,
  `id_usuario` INT NOT NULL,
  `api_key` TEXT NOT NULL,
  `ativa` CHAR(1) NOT NULL DEFAULT 's',
  `data_datacriacao` TIMESTAMP NOT NULL,
  `data_expiracao` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pobreflix-teste`.`log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `operacao` VARCHAR(20) NOT NULL,
  `descricao` TEXT NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `id_usuario` INT NOT NULL,
  `ip` VARCHAR(45) NOT NULL,
  `user_agent` VARCHAR(45) NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `pobreflix-teste`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
