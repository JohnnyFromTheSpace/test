<?php

namespace Space;

/**
 * Class AdminController
 * @package Space
 */
class AdminController
{
    /** @var string $args */
    private $args = '';
    /** @var \PDO $connection */
    private $connection;

    public function __construct()
    {
        $this->connection = DbConnect::getInstance()->getCon();
        $this->init();
    }

    /**
     * Initial
     *
     * @return void
     */
    private function init()
    {
        /** @var array $data */
        $data = [];
        if (isset($_POST['_fun'])) {
            if ($_POST['_fun'] === 'homepage') {
                $data['comments'] = $this->getComments();
            }
            if ($_POST['_fun'] === 'manage_message') {
                $data['message'] = $this->manageMessage();
            }

            // set header
            header('Content-Type: application/json');
            echo json_encode($data);
            exit;
        }

        $this->redirect();
        exit;
    }

    /**
     * Get comments
     *
     * @return array
     */
    public function getComments()
    {
        try {
            $data = $this->connection->query("
              SELECT com.*, p.title AS product_title, co.name AS company_name FROM comment com 
                INNER JOIN product p ON p.id = com.product_id
                INNER JOIN company co ON co.id = p.company_id  
              ORDER BY com.id")->fetchAll();

            return $data;
        } catch (\PDOException $e) {
            die("Could not connect to the database: " . $e->getMessage());
        }
    }


    public function manageMessage()
    {
        if (!$this->validate()) return false;

        $data = [
            'active' => (int)$_POST['active'],
            'id' => (int)$_POST['id'],
            'product_id' => (int)$_POST['product_id'],
        ];
        $sql = "UPDATE comment SET active=:active WHERE id=:id AND product_id=:product_id";
        return $this->connection->prepare($sql)->execute($data);
    }

    /**
     * Validate data
     *
     * @return bool
     */
    private function validate()
    {
        // check active
        if (empty($_POST["active"])) {
            if (!ctype_digit($_POST["active"])) {
                return false;
            }
        }
        // check id
        if (empty($_POST["id"])) {
            if (!ctype_digit($_POST["id"])) {
                return false;
            }
        }
        // check product_id
        if (empty($_POST["product_id"])) {
            if (!ctype_digit($_POST["product_id"])) {
                return false;
            }
        }

        return true;
    }

    /**
     * Redirect
     *
     * @return void
     */
    private function redirect()
    {
        /* Redirect browser */
        header(sprintf("Location: /index.php/admin%s%s", !empty($this->args) ? '?' : '', $this->args));
        exit();
    }
}

new AdminController();

