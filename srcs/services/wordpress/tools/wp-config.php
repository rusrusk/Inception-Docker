<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'rkultaev' );

/** MySQL database password */
define( 'DB_PASSWORD', 'rkultaev222' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ',2|~@}7!w|%B#x4*(!snC`*FOq3r70kI08AudTUM- 4X8<%f#]=+]+E8a]qUb8N/');
define('SECURE_AUTH_KEY',  ']jHMvicj?_vED}S*+q%i=uLN5uQ=6jwCb/xuOQH{AR]19Pha=KBbP}=_zbAF^HWV');
define('LOGGED_IN_KEY',    'qu<`M#WSm24QwC#;63>0RUZ#aO1s$d,2 (ymp?u>*a.iq@)Uo,+FEg2uDYoKbb@E');
define('NONCE_KEY',        ')!UUrq# k%/2ZXY0-_D^ %-3j/<,C!PipRh{D*8r{Wvqu:zn+iB4&$yAgb:+kZB:');
define('AUTH_SALT',        'iM-+{t+7FjTCh5_duJJyP}C>rKd@4LV|$f#qnv}gd%3{0i1N}$}mCI:=X$Yo,6Xe');
define('SECURE_AUTH_SALT', '~1jMGh%Lw*fKwLpkl30$JwjL+DQbAX-v=tXK94>AIT}3!u87!u2;|CTn/;s%_|7/');
define('LOGGED_IN_SALT',   'rrOnLjpdNQT[ S L&im29g_i*}AVDTa+!y3GM18_R~mzu^.17`}*1i|g4m;uB2wg');
define('NONCE_SALT',       'O)L0?4W4j.eq+v>UmTkt-aB5&bmmS-HLj70:rs{P9[0Tac}C;aE|`0O43<^-mo.i');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

 /* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . 'var/www/html/wordpress' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';