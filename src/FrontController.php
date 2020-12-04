<?php

namespace Space;

/**
 * Class FrontController
 * @package Space
 */
class FrontController
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
                $data['products'] = $this->getProducts();
                $data['comments'] = $this->getComments();
            }

            // set header
            header('Content-Type: application/json');
            echo json_encode($data);
            exit;
        } elseif (isset($_POST['add_comment'])) {
            if ($this->insertComment()) {
                setcookie('_message', 1, time() + 1, '/');
            } else {
                setcookie('_message', 0, time() + 1, '/');
            }
        }

        $this->redirect();
        exit;
    }

    /**
     * Get products
     *
     * @return array
     */
    public function getProducts()
    {
        try {
            $data = $this->connection->query("
              SELECT p.*, c.name AS company_name FROM product p 
                INNER JOIN company c ON c.id = p.company_id 
              ORDER BY p.id DESC LIMIT 9")->fetchAll();
            return $data;
        } catch (\PDOException $e) {
            die("Could not connect to the database: " . $e->getMessage());
        }
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
              SELECT com.text, p.title AS product_title, co.name AS company_name FROM comment com 
                INNER JOIN product p ON p.id = com.product_id
                INNER JOIN company co ON co.id = p.company_id 
              WHERE com.active = 1 
              ORDER BY com.id")->fetchAll();

            return $data;
        } catch (\PDOException $e) {
            die("Could not connect to the database: " . $e->getMessage());
        }
    }

    /**
     * Insert comment
     *
     * @return bool
     */
    private function insertComment()
    {
        try {
            if (!$this->validateForm()) return false;

            $data = [
                'product_id' => (int)$_POST['comm_product_id'],
                'name' => $_POST['comm_name'],
                'email' => $_POST['comm_email'],
                'text' => nl2br($_POST['comm_text']),
                'created' => date("Y-m-d"),
            ];
            $sql = "INSERT INTO comment (product_id, name, email, text, created) VALUES (:product_id, :name, :email, :text, :created)";
            return $this->connection->prepare($sql)->execute($data);
        } catch (\PDOException $e) {
            die("Could not connect to the database: " . $e->getMessage());
        }
    }

    /**
     * Validate comment name and email
     *
     * @return bool
     */
    private function validateForm()
    {
        // check name
        if (empty($_POST["comm_name"])) {
            if (!preg_match("/^[a-zA-Z-' ]*$/", $_POST["comm_name"])) {
                return false;
            }
        }
        // check email
        if (empty($_POST["comm_email"])) {
            if (!filter_var($_POST["comm_email"], FILTER_VALIDATE_EMAIL)) {
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
        header(sprintf("Location: /index.php/front%s%s", !empty($this->args) ? '?' : '', $this->args));
        exit();
    }
}

new FrontController();
