<?php

namespace Space;

/**
 * Class DbConnect
 * @package Space
 */
class DbConnect
{
    /** @var null|\PDO $instance */
    private static $instance = null;
    /** @var \PDO $connection */
    private $connection;
    /** @var string $host */
    private $host = 'localhost';
    /** @var string $dbname */
    private $dbname = 'test_citrus_system';
    /** @var string $password */
    private $password = 'sarci';
    /** @var string $username */
    private $username = 'johnny';

    public function __construct()
    {
        $this->connection = new \PDO(
            "mysql:host=$this->host;dbname=$this->dbname",
            $this->username,
            $this->password,
            [\PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]
        );
    }

    /**
     * Get init
     *
     * @return DbConnect|null|\PDO
     */
    public static function getInstance()
    {
        if (!self::$instance) {
            self::$instance = new DbConnect();
        }

        return self::$instance;
    }

    /**
     * Get connection
     *
     * @return \PDO
     */
    public function getCon()
    {
        return $this->connection;
    }
}
