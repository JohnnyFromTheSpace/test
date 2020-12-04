<?php

require_once __DIR__.'/../vendor/autoload.php';

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

$request = Request::createFromGlobals();
$response = new Response();

$map = [
    '/admin' => __DIR__.'/../web/admin.html',
    '/adminController' => __DIR__.'/../src/AdminController.php',
    '/front' => __DIR__.'/../web/front.html',
    '/frontController' => __DIR__.'/../src/FrontController.php',
];

$path = $request->getPathInfo();
if (isset($map[$path])) {
    ob_start();
    include $map[$path];
    $response->setContent(ob_get_clean());
} else {
    if ($path  === '/' || $path === '/front') {
        ob_start();
        include $map['/front'];
        $response->setContent(ob_get_clean());
    } else {
        $response->setStatusCode(404);
        $response->setContent('Not Found');
    }
}

$response->send();
