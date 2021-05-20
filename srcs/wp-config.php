<?php

define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'phemsi-a' );
define( 'DB_PASSWORD', '1234' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', 'utf8_unicode_ci' );
define('FS_METHOD', 'direct');

define('AUTH_KEY',         ' ');
define('SECURE_AUTH_KEY',  ' ');
define('LOGGED_IN_KEY',    ' ');
define('NONCE_KEY',        ' ');
define('AUTH_SALT',        ' ');
define('SECURE_AUTH_SALT', ' ');
define('LOGGED_IN_SALT',   ' ');
define('NONCE_SALT',       ' ');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
