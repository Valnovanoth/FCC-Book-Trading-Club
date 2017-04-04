<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
            <li class="navbar-right<?php echo ($pagename == 'logout') ? ' active' : '' ?>">
                <a href="<?php echo site_url('logout') ?>">                    
                    <i class="fa fa-power-off"></i>
                </a>
            </li>
            <li class="navbar-right<?php echo ($pagename == 'user-settings') ? ' active' : '' ?>">
                <a href="<?php echo site_url('dashboard/user-settings') ?>">
                    <span class="glyphicon glyphicon-cog"></span>
                </a>
            </li>
            <li class="navbar-right<?php echo ($pagename == 'my-books') ? ' active' : '' ?>">
                <a href="<?php echo site_url('dashboard/my-books') ?>">My Books</a>
            </li>
            <li class="navbar-right<?php echo ($pagename == 'all-books') ? ' active' : '' ?>">
                <a href="<?php echo site_url('dashboard/all-books') ?>">All Books</a>
            </li>