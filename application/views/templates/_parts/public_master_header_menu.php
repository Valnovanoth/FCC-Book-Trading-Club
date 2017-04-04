<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
            <li class="navbar-right<?php echo ($pagename == 'login') ? ' active' : '' ?>">
                <a href="<?php echo site_url('login') ?>">Login</a>
            </li>
            <li class="navbar-right<?php echo ($pagename == 'register') ? ' active' : '' ?>">
                <a href="<?php echo site_url('register') ?>">Sign up</a>
            </li>